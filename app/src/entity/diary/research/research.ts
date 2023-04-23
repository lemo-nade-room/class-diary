import { z } from 'zod';
import type { Decoder } from '@/entity/util/decode';
import { decodeArray } from '@/entity/util/decode';

export default class Research {
	constructor(readonly teacher: string) {}

	static readonly decode: Decoder<Research> = (json) => {
		const schema = ResearchSchema.parse(json);
		return new Research(schema.teacher);
	};

	static readonly decodeArray: Decoder<readonly Research[]> = (json) => {
		return decodeArray(json, this.decode);
	};
}

export const ResearchSchema = z.object({
	teacher: z.string()
});
