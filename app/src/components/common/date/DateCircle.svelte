<script lang="ts">
	export let date: Date = new Date();

	const DAYS: readonly { name: string; class: string }[] = [
		{ name: '日', class: 'sun' },
		{ name: '月', class: 'mon' },
		{ name: '火', class: 'tue' },
		{ name: '水', class: 'wed' },
		{ name: '木', class: 'thu' },
		{ name: '金', class: 'fri' },
		{ name: '土', class: 'sat' }
	];
	$: monthString = date.getMonth() + 1;
	$: dateString = date.getDate();
	$: day = DAYS[date.getDay()];
</script>

<div class="diary-circle {day.class}">
	<span class="day">{day.name}</span>
	<span class="number month">{monthString}</span>
	<span class="divisor" />
	<span class="number date">{dateString}</span>
</div>

<style lang="scss">
	.diary-circle {
		$radius: 36px;
		width: $radius * 2;
		height: $radius * 2;
		border-radius: 50%;
		position: relative;

		& > .divisor {
			display: block;
			width: $radius * 1.6;
			height: 2px;
			background-color: white;
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%) rotate(-45deg);
		}

		& > .number {
			display: block;
			width: $radius * 0.9;
			text-align: center;
			font-size: $radius * 0.7;
			font-weight: bold;
			text-shadow: 0.1px 0.1px 0.1px black;
			color: white;
			position: absolute;
			left: 50%;
			top: 50%;
			$away: 35%;
			&.month {
				transform: translate(-50% - $away, -50% - $away);
			}
			&.date {
				transform: translate(-50% + $away, -50% + $away);
			}
		}

		& > .day {
			font-size: $radius * 1;
			font-weight: bold;
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%);
		}

		&.mon {
			background-color: #e063f3;
			& > .day {
				color: #8a4f93;
			}
		}
		&.tue {
			background-color: #f37c58;
			& > .day {
				color: #8d5952;
			}
		}
		&.wed {
			background-color: #58e6f3;
			& > .day {
				color: #527d8d;
			}
		}
		&.thu {
			background-color: #96f358;
			& > .day {
				color: #668d52;
			}
		}
		&.fri {
			background-color: #f3e458;
			& > .day {
				color: #8d8c52;
			}
		}
		&.sat {
			background-color: #b5bad9;
			& > .day {
				color: #838375;
			}
		}
		&.sun {
			background-color: #d3b2b4;
			& > .day {
				color: #8d7676;
			}
		}

		background-color: #f3e458;
	}
</style>
