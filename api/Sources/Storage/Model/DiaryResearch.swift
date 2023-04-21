import Foundation
import Fluent

final class DiaryResearch: Model {
    static let schema = "diary+research"
    
    @ID(key: .id)
    var id: UUID?

    @Parent(key: "diary_id")
    var diary: Diary

    @Parent(key: "research_id")
    var research: Research
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }

    init(
        _ id: UUID? = nil,
        _ diaryID: Diary.IDValue,
        _ researchID: Research.IDValue
    ) {
        self.id = id
        self.$diary.id = diaryID
        self.$research.id = researchID
    }
}
