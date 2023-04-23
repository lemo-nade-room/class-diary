import Vapor
import Storage

extension Request {
    
    var diaryRepository: DiaryRepository {
        .init(on: db)
    }
}
