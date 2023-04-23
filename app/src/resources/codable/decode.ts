export type Decoder<T> = (json: unknown) => T;

export function createArrayDecoder<T>(decoder: Decoder<T>): Decoder<readonly T[]> {
	return (array) => {
		if (!Array.isArray(array)) {
			throw new Error(`argument json should be array, but ${array}`);
		}
		return array.map(decoder);
	};
}
