import Fluent

public func registerMigration(_ migrations: Migrations) {
    migrations.add(Diary.Migration())
    
    migrations.add(Research.Migration())
    migrations.add(DiaryResearch.Migration())
    
    migrations.add(Student.Migration())
    migrations.add(DiaryStudent.Migration())
    
    migrations.add(Subject.Migration())
    migrations.add(Study.Migration())
    
    migrations.add(StudyStudent.Migration())
}
