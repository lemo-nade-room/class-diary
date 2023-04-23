import type { RouteDefinition } from 'svelte-spa-router';
import Home from '@/routes/Home.svelte';

const routes: RouteDefinition = {
	// Exact path
	'/': Home
};

export default routes;
