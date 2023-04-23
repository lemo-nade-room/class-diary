export default interface Encodable {
	encode(): unknown;
}

export function encodeArray(array: readonly Encodable[]): unknown {
	return array.map((el) => el.encode());
}
