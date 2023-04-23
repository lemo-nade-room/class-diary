<script lang="ts">
	import type Diary from '@/entity/diary/diary';
	import DiaryTimeline from '@/components/part/diary/timeline/DiaryTimeline.svelte';

	export let diaries: readonly Diary[] = [];
</script>

<div class="home-view">
	<DiaryTimeline {diaries} />
</div>
