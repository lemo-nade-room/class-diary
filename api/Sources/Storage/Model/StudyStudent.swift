import Foundation
import Fluent

final class StudyStudent: Model {
    static let schema = "study+student"
    
    @ID(key: .id)
    var id: UUID?

    @Parent(key: "study_id")
    var study: Study
    
    @Parent(key: "student_id")
    var student: Student

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }

    init(
        _ id: UUID? = nil,
        _ studyID: Study.IDValue,
        _ studentID: Student.IDValue
    ) {
        self.id = id
        self.$study.id = studyID
        self.$student.id = studentID
    }
}
