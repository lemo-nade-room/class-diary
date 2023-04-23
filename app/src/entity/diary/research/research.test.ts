import { describe, expect, test } from 'vitest';
import Research from '@/entity/diary/research/research';

describe('Research Tests', () => {
	test('JSON Decode Test', () => {
		const expected = new Research('田中');
		const actual = Research.decode({
			teacher: '田中'
		});
		expect(actual).toEqual(expected);
	});
});
