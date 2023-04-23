import { describe, expect, test } from 'vitest';
import Student from '@/entity/diary/student/student';

describe('Student Tests', () => {
	test('JSON Decode Test', () => {
		const expected = new Student(20, '田中');
		const actual = Student.decode({
			number: 20,
			name: '田中'
		});
		expect(actual).toEqual(expected);
	});
});
