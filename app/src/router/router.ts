import type { RouteDefinition } from 'svelte-spa-router';
import HomeView from '@/views/HomeView.svelte';

const routes: RouteDefinition = {
	// Exact path
	'/': HomeView
};

export default routes;
