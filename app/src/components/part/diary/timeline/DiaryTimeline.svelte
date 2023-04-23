<script lang="ts">
	import type Diary from '@/entity/diary/diary';
	import DiaryCard from '@/components/part/diary/card/DiaryCard.svelte';

	export let diaries: readonly Diary[] = [];
</script>

<div class="diary-timeline">
	{#each diaries as diary}
		<DiaryCard {diary} />
	{/each}
</div>
