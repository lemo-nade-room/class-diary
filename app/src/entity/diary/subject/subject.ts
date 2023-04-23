import { z } from 'zod';
import type { Decoder } from '@/entity/util/decode';
import { decodeArray } from '@/entity/util/decode';
export default class Subject {
	constructor(readonly name: string) {}

	static readonly decode: Decoder<Subject> = (json) => {
		const schema = SubjectSchema.parse(json);
		return new Subject(schema.name);
	};

	static readonly decodeArray: Decoder<readonly Subject[]> = (json) => {
		return decodeArray(json, this.decode);
	};
}

export const SubjectSchema = z.object({
	name: z.string()
});
