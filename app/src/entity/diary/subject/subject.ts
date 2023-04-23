import { z } from 'zod';
import type { Decoder } from '@/resources/codable/decode';
import type Encodable from '@/resources/codable/encode';
export default class Subject implements Encodable {
	constructor(readonly name: string) {}

	static readonly decode: Decoder<Subject> = (json) => {
		const schema = SubjectSchema.parse(json);
		return new Subject(schema.name);
	};

	encode(): unknown {
		return this;
	}
}

export const SubjectSchema = z.object({
	name: z.string()
});
