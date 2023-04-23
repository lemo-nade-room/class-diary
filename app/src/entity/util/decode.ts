export type Decoder<T> = (json: unknown) => T;

export function decodeArray<T>(array: unknown, decoder: Decoder<T>): readonly T[] {
	if (!Array.isArray(array)) {
		throw new Error(`argument json should be array, but ${array}`);
	}
	return array.map(decoder);
}
