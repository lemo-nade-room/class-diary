import { HTTPError } from '@/resources/network/HTTPError';
import type Encodable from '@/resources/codable/encode';
import { createArrayDecoder } from '@/resources/codable/decode';

export type Before = () => void | Promise<void>;
export type After = (response: Response) => void | Promise<void>;
export const DEFAULT_BEFORE: Before = () => {};
export const DEFAULT_AFTER: After = () => {};

/** 特定のパスを1つのリソースとして通信処理を行う */
export interface HTTPResource<T extends Encodable | readonly Encodable[]> {
	/**
	 * ResourceからGETで取得する
	 *
	 * 通信に失敗した場合、NetworkErrorがthrowされる
	 */
	get(): Promise<T>;

	/**
	 * ResourceにPOSTで送信する
	 *
	 * 通信に失敗した場合、NetworkErrorがthrowされる
	 */
	post(content: T): Promise<void>;

	/**
	 * ResourceにPUTで送信する
	 *
	 * 通信に失敗した場合、NetworkErrorがthrowされる
	 */
	put(content: T): Promise<void>;

	/**
	 * ResourceにDELETEで送信する
	 *
	 * 通信に失敗した場合、NetworkErrorがthrowされる
	 */
	delete(): Promise<void>;

	/**
	 * 現在のリソースをより詳細に拡張したリソースを生成する
	 * @param decoder 生成リソースの型のparser
	 * @param paths 現在のパスフレーズに追加するパスフレーズの配列
	 * @param headers 現在のヘッダーに追加するヘッダー
	 * @param before 現在のbeforeに追加するbefore
	 * @param after 現在のafterに追加するafter
	 */
	create<K extends Encodable | readonly Encodable[]>(
		decoder: (json: unknown) => K,
		paths: readonly string[],
		headers?: Headers,
		before?: Before,
		after?: After
	): HTTPResource<K>;
}

export class HTTPResourceFactory {
	/**
	 * @param baseURL URLドメイン
	 * @param headers 共通ヘッダー
	 * @param before 通信時の共通の前処理
	 * @param after 通信時の共通の後処理
	 */
	constructor(
		private readonly baseURL: string,
		private readonly headers: Headers = new Headers(),
		private readonly before: Before = DEFAULT_BEFORE,
		private readonly after: After = DEFAULT_AFTER
	) {}

	/**
	 * NetworkResourceを生成する
	 * @param paths '/api/resource' であれば ['api', 'resource'] のようなbaseURLにつながるパスフレーズの配列
	 * @param decoder JSONオブジェクトからT型に変換するメソッド
	 * @param headers 通信時のヘッダ
	 * @param before 通信時の共通の前処理
	 * @param after 通信時の共通の後処理
	 */
	create<T extends Encodable | readonly Encodable[]>(
		paths: readonly string[],
		decoder: (json: unknown) => T,
		headers: Headers = new Headers(),
		before: Before = DEFAULT_BEFORE,
		after: After = DEFAULT_AFTER
	): HTTPResource<T> {
		return new HTTPResourceImpl(
			decoder,
			this.baseURL,
			paths,
			this.mergeHeaders(headers),
			this.mergeBefore(before),
			this.mergeAfter(after)
		);
	}

	/**
	 * NetworkResourceを生成する
	 * @param paths '/api/resource' であれば ['api', 'resource'] のようなbaseURLにつながるパスフレーズの配列
	 * @param decoder JSONオブジェクトからT型に変換するメソッド
	 * @param headers 通信時のヘッダ
	 * @param before 通信時の共通の前処理
	 * @param after 通信時の共通の後処理
	 */
	createArray<T extends Encodable>(
		paths: readonly string[],
		decoder: (json: unknown) => T,
		headers: Headers = new Headers(),
		before: Before = DEFAULT_BEFORE,
		after: After = DEFAULT_AFTER
	): HTTPResource<readonly T[]> {
		return new HTTPResourceImpl(
			createArrayDecoder(decoder),
			this.baseURL,
			paths,
			this.mergeHeaders(headers),
			this.mergeBefore(before),
			this.mergeAfter(after)
		);
	}

	/** ヘッダーの取得 */
	get(name: string): string | null {
		return this.headers.get(name);
	}

	/** ヘッダーの追加 */
	append(name: string, value: string): void {
		this.headers.append(name, value);
	}

	/** ヘッダーのセット */
	set(name: string, value: string): void {
		this.headers.set(name, value);
	}

	/** ヘッダーの削除 */
	delete(name: string): void {
		this.headers.delete(name);
	}

	private mergeBefore(before: Before): Before {
		return () => {
			this.before();
			before();
		};
	}

	private mergeAfter(after: After): After {
		return (response) => {
			after(response);
			this.after(response);
		};
	}

	private mergeHeaders(headers: Headers): Headers {
		const result = new Headers(this.headers);
		headers.forEach((value, key) => result.set(key, value));
		return result;
	}
}

class HTTPResourceImpl<T extends Encodable | readonly Encodable[]> implements HTTPResource<T> {
	constructor(
		private readonly decoder: (object: unknown) => T,
		private readonly baseURL: string,
		private readonly paths: readonly string[],
		private readonly headers: Readonly<Headers>,
		private readonly before: Before,
		private readonly after: After
	) {}

	async get(): Promise<T> {
		await this.before();
		const response = await fetch(this.path, {
			method: 'GET',
			headers: this.headers
		});
		if (!response.ok) {
			throw new HTTPError(response.status, response.statusText);
		}
		const json: unknown = await response.json();
		await this.after(response);
		return this.decoder(json);
	}

	async post(content: T): Promise<void> {
		await this.before();
		const response = await fetch(this.path, {
			method: 'POST',
			headers: this.headers,
			body: JSON.stringify(this.encodeContent(content))
		});
		await this.after(response);
		if (!response.ok) {
			throw new HTTPError(response.status, response.statusText);
		}
	}

	async put(content: T): Promise<void> {
		await this.before();
		const response = await fetch(this.path, {
			method: 'PUT',
			headers: this.headers,
			body: JSON.stringify(this.encodeContent(content))
		});
		await this.after(response);
		if (!response.ok) {
			throw new HTTPError(response.status, response.statusText);
		}
	}

	async delete(): Promise<void> {
		await this.before();
		const response = await fetch(this.path, {
			method: 'DELETE',
			headers: this.headers
		});
		await this.after(response);
		if (!response.ok) {
			throw new HTTPError(response.status, response.statusText);
		}
	}

	create<K extends Encodable | readonly Encodable[]>(
		decoder: (json: unknown) => K,
		paths: readonly string[],
		headers: Headers = new Headers(),
		before: Before = DEFAULT_BEFORE,
		after: After = DEFAULT_AFTER
	): HTTPResource<K> {
		return new HTTPResourceImpl(
			decoder,
			this.baseURL,
			this.paths.concat(paths),
			this.mergeHeaders(headers),
			this.mergeBefore(before),
			this.mergeAfter(after)
		);
	}

	private get path(): string {
		return `${this.baseURL}/${this.paths.join('/')}`;
	}

	private mergeHeaders(headers: Headers): Headers {
		const result = new Headers(this.headers);
		headers.forEach((value, key) => result.set(key, value));
		return result;
	}

	private mergeBefore(before: Before): Before {
		return () => {
			this.before();
			before();
		};
	}

	private mergeAfter(after: After): After {
		return (response) => {
			after(response);
			this.after(response);
		};
	}

	private encodeContent(content: T): unknown {
		if (Array.isArray(content)) {
			const encodableArray = content as readonly Encodable[];
			return encodableArray.map((el) => el.encode());
		} else {
			const encodable = content as Encodable;
			return encodable.encode();
		}
	}
}
