<script lang="ts">
	import Diary from '@/entity/diary/diary';
	import Student from '@/entity/diary/student/student';
	import Study from '@/entity/diary/study/study';
	import Subject from '@/entity/diary/subject/subject';
	import Research from '@/entity/diary/research/research';
	import HomeView from '@/views/HomeView.svelte';

	let diaries: readonly Diary[] = [
		new Diary(
			new Date('2023-03-18'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-19'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-20'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-21'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-22'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-23'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		),
		new Diary(
			new Date('2023-03-24'),
			'晴れ',
			[new Student(1, '青木'), new Student(2, '石野')],
			[
				new Study(
					[1, 2],
					new Subject('国語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[3, 4],
					new Subject('数学'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[5, 6],
					new Subject('理科'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				),
				new Study(
					[7, 8],
					new Subject('英語'),
					[new Student(30, '和田'), new Student(31, '富山')],
					''
				)
			],
			'雛祭',
			[new Research('大和田')],
			new Date('2023-03-20'),
			'楽しかった'
		)
	];
</script>

<HomeView {diaries} />
