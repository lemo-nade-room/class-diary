import type { HTTPResource } from '@/resources/network/HTTPResource';
import type Encodable from '@/resources/codable/encode';

export class MockHTTPResource<T extends Encodable | readonly Encodable[]>
	implements HTTPResource<T>
{
	constructor(public initial: T, public next?: HTTPResource<any>) {}

	create<K extends Encodable | readonly Encodable[]>(): HTTPResource<K> {
		return this.next ?? new MockHTTPResource(undefined as K);
	}

	get(): Promise<T> {
		return Promise.resolve(this.initial);
	}

	post(content: T): Promise<void> {
		this.initial = content;
		return Promise.resolve();
	}

	put(content: T): Promise<void> {
		this.initial = content;
		return Promise.resolve();
	}

	delete(): Promise<void> {
		return Promise.resolve();
	}
}
