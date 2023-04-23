import { describe, expect, test } from 'vitest';
import encodeUTCDate from '@/resources/codable/date';

describe('Encode Date Tests', () => {
	test('2006-01-02T15:04:05 → 2006-01-02T00:00:00Z', () => {
		const expected = '2006-01-02T00:00:00Z';
		const actual = encodeUTCDate(new Date('2006-01-02T15:04:05'));
		expect(actual).toBe(expected);
	});
});
