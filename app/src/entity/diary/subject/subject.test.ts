import { describe, expect, test } from 'vitest';
import Subject from '@/entity/diary/subject/subject';

describe('Subject Tests', () => {
	test('JSON Decode Test', () => {
		const expected = new Subject('国語');
		const actual = Subject.decode({
			name: '国語'
		});
		expect(actual).toEqual(expected);
	});

	test('JSON Array Decode Test', () => {
		const expected = [new Subject('国語'), new Subject('数学')];
		const actual = Subject.decodeArray([{ name: '国語' }, { name: '数学' }]);
		expect(actual).toEqual(expected);
	});
});
