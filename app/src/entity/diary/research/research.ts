import { z } from 'zod';
import type { Decoder } from '@/resources/codable/decode';
import type Encodable from '@/resources/codable/encode';

export default class Research implements Encodable {
	constructor(readonly teacher: string) {}

	static readonly decode: Decoder<Research> = (json) => {
		const schema = ResearchSchema.parse(json);
		return new Research(schema.teacher);
	};

	encode(): unknown {
		return this;
	}
}

export const ResearchSchema = z.object({
	teacher: z.string()
});
