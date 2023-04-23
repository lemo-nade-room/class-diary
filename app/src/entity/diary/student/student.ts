import { z } from 'zod';
import type { Decoder } from '@/resources/codable/decode';
import type Encodable from '@/resources/codable/encode';

export default class Student implements Encodable {
	constructor(readonly number: number, readonly name: string) {}

	static readonly decode: Decoder<Student> = (json) => {
		const schema = StudentSchema.parse(json);
		return new Student(schema.number, schema.name);
	};

	encode(): unknown {
		return this;
	}
}

export const StudentSchema = z.object({
	number: z.number(),
	name: z.string()
});
