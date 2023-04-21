import Foundation
import Fluent

final class DiaryStudent: Model {
    static let schema = "diary+student"
    
    @ID(key: .id)
    var id: UUID?

    @Parent(key: "diary_id")
    var diary: Diary

    @Parent(key: "student_id")
    var student: Student
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }

    init(
        _ id: UUID? = nil,
        _ diaryID: Diary.IDValue,
        _ studentID: Student.IDValue
    ) {
        self.id = id
        self.$diary.id = diaryID
        self.$student.id = studentID
    }
}
