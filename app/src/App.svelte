<script lang="ts">
	import routes from '@/router/router';
	import Router from 'svelte-spa-router';
	import Button, { Label } from '@smui/button';
</script>

<svelte:head>
	<!-- Material Icons -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	<!-- Roboto -->
	<link
		rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,600,700"
	/>
	<!-- Roboto Mono -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono" />
	<link rel="stylesheet" href="node_modules/svelte-material-ui/bare.css" />
</svelte:head>

<main>
	<Button>
		<Label>Default</Label>
	</Button>
	<Router {routes} />
</main>
