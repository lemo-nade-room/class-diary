import { types } from 'sass';
import Error = types.Error;

export class HTTPError extends Error {
	constructor(readonly status: number, message: string) {
		super(message);
	}
}
