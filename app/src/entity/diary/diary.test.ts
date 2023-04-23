import { describe, expect, test } from 'vitest';
import Subject from '@/entity/diary/subject/subject';
import Diary from '@/entity/diary/diary';
import Student from '@/entity/diary/student/student';
import Study from '@/entity/diary/study/study';
import Research from '@/entity/diary/research/research';

describe('Diary Tests', () => {
	test('JSON Decode Test', () => {
		const expected = new Diary(
			new Date('2022-01-02'),
			'曇り',
			[new Student(20, '田中')],
			[new Study([], new Subject('国語'), [], '')],
			'イベント',
			[new Research('Mike')],
			new Date('2022-01-04'),
			'眠い'
		);
		const actual = Diary.decode({
			date: '2022-01-02T00:00:00Z',
			weather: '曇り',
			responsibleStudents: [{ number: 20, name: '田中' }],
			studies: [{ periods: [], subject: { name: '国語' }, absentStudents: [], remark: '' }],
			eventOrOther: 'イベント',
			cleanResponsibleResearches: [{ teacher: 'Mike' }],
			cleanDate: '2022-01-04T00:00:00Z',
			impressionOrContact: '眠い'
		});
		expect(actual).toEqual(expected);
	});
});
