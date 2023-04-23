<script lang="ts">
	import Diary from '@/entity/diary/diary';

	export let diary: Diary = new Diary();
</script>

<div class="diary-card">
	<span>{diary.date.toISOString()}</span>
	<span>{diary.weather}</span>
	<span>{diary.eventOrOther}</span>
</div>
