import { describe, expect, test } from 'vitest';
import Student from '@/entity/diary/student/student';
import Study from '@/entity/diary/study/study';
import Subject from '@/entity/diary/subject/subject';

describe('Study Tests', () => {
	test('JSON Decode Test', () => {
		const expected = new Study([1, 2], new Subject('国語'), [new Student(20, '田中')], '宿題あり');
		const actual = Study.decode({
			periods: [1, 2],
			subject: { name: '国語' },
			absentStudents: [{ number: 20, name: '田中' }],
			remark: '宿題あり'
		});
		expect(actual).toEqual(expected);
	});
});
