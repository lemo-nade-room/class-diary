import type { RouteDefinition } from 'svelte-spa-router';
import HomeRoute from '@/routes/HomeRoute.svelte';

const routes: RouteDefinition = {
	// Exact path
	'/': HomeRoute
};

export default routes;
