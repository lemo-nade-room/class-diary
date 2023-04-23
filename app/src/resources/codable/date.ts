/** Date型の日付部分をIS8601に変換 */
export default function encodeUTCDate(date: Date): string {
	const yyyy = String(date.getFullYear()).padStart(4, '0');
	const MM = String(date.getMonth() + 1).padStart(2, '0');
	const dd = String(date.getDate()).padStart(2, '0');
	return `${yyyy}-${MM}-${dd}T00:00:00Z`;
}
