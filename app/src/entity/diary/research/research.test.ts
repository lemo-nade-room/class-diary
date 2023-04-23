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

	test('JSON Array Decode Test', () => {
		const expected = [new Research('田中'), new Research('中田')];
		const actual = Research.decodeArray([{ teacher: '田中' }, { teacher: '中田' }]);
		expect(actual).toEqual(expected);
	});
});
