import Student from '@/entity/diary/student/student';
import Study from '@/entity/diary/study/study';
import Research from '@/entity/diary/research/research';
import { z } from 'zod';
import { StudentSchema } from '@/entity/diary/student/student';
import { StudySchema } from '@/entity/diary/study/study';
import { ResearchSchema } from '@/entity/diary/research/research';
import type { Decoder } from '@/resources/codable/decode';
import { createArrayDecoder } from '@/resources/codable/decode';
import type Encodable from '@/resources/codable/encode';
import encodeUTCDate from '@/resources/codable/date';
import { encodeArray } from '@/resources/codable/encode';

export type Weather = '晴れ' | '雨' | '曇り' | '雪';
export const WeatherSchema = z.enum(['晴れ', '雨', '曇り', '雪']);

export default class Diary implements Encodable {
	/**
	 * 日誌
	 * @param date 日付
	 * @param weather 天候
	 * @param responsibleStudents 日直担当
	 * @param studies 授業一覧
	 * @param eventOrOther 行事・その他
	 * @param cleanResponsibleResearches 清掃担当研究室
	 * @param cleanDate 清掃（予定）日
	 * @param impressionOrContact 感想・連絡事項
	 */
	constructor(
		readonly date: Date,
		readonly weather: Weather,
		readonly responsibleStudents: readonly Student[],
		readonly studies: readonly Study[],
		readonly eventOrOther: string,
		readonly cleanResponsibleResearches: readonly Research[],
		readonly cleanDate: Date,
		readonly impressionOrContact: string
	) {}

	static readonly decode: Decoder<Diary> = (json) => {
		const schema = DiarySchema.parse(json);
		return new Diary(
			new Date(schema.date),
			schema.weather,
			createArrayDecoder(Student.decode)(schema.responsibleStudents),
			createArrayDecoder(Study.decode)(schema.studies),
			schema.eventOrOther,
			createArrayDecoder(Research.decode)(schema.cleanResponsibleResearches),
			new Date(schema.cleanDate),
			schema.impressionOrContact
		);
	};

	encode(): unknown {
		return {
			date: encodeUTCDate(this.date),
			weather: this.weather,
			responsibleStudents: encodeArray(this.responsibleStudents),
			studies: encodeArray(this.studies),
			eventOrOther: this.eventOrOther,
			cleanResponsibleResearches: encodeArray(this.cleanResponsibleResearches),
			cleanDate: encodeUTCDate(this.cleanDate),
			impressionOrContact: this.impressionOrContact
		};
	}
}

export const DiarySchema = z.object({
	date: z.string().datetime(),
	weather: WeatherSchema,
	responsibleStudents: z.array(StudentSchema),
	studies: z.array(StudySchema),
	eventOrOther: z.string(),
	cleanResponsibleResearches: z.array(ResearchSchema),
	cleanDate: z.string().datetime(),
	impressionOrContact: z.string()
});
