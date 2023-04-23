import { z } from 'zod';
import type { Decoder } from '@/resources/codable/decode';
import { createArrayDecoder } from '@/resources/codable/decode';
import Subject from '@/entity/diary/subject/subject';
import Student from '@/entity/diary/student/student';
import { SubjectSchema } from '@/entity/diary/subject/subject';
import { StudentSchema } from '@/entity/diary/student/student';
import type Encodable from '@/resources/codable/encode';
import { encodeArray } from '@/resources/codable/encode';

export default class Study implements Encodable {
	/** 授業
	 * @param periods 時限
	 * @param subject 科目
	 * @param absentStudents 欠課学生
	 * @param remark 備考
	 */
	constructor(
		readonly periods: readonly number[],
		readonly subject: Subject,
		readonly absentStudents: readonly Student[],
		readonly remark: string
	) {}

	static readonly decode: Decoder<Study> = (json) => {
		const schema = StudySchema.parse(json);
		return new Study(
			schema.periods,
			Subject.decode(schema.subject),
			createArrayDecoder(Student.decode)(schema.absentStudents),
			schema.remark
		);
	};

	encode(): unknown {
		return {
			periods: this.periods,
			subject: this.subject.encode(),
			absentStudents: encodeArray(this.absentStudents),
			remark: this.remark
		};
	}
}

export const StudySchema = z.object({
	periods: z.array(z.number()),
	subject: SubjectSchema,
	absentStudents: z.array(StudentSchema),
	remark: z.string()
});
