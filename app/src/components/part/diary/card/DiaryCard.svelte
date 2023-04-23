<script lang="ts">
	import Diary from '@/entity/diary/diary';
	import DiaryCircle from '@/components/common/date/DateCircle.svelte';

	export let diary: Diary = new Diary();
</script>

<div class="diary-card">
	<div><DiaryCircle date={diary.date} /></div>
	<span>{diary.date.toISOString()}</span>
	<span>{diary.weather}</span>
	<span>{diary.eventOrOther}</span>
</div>
