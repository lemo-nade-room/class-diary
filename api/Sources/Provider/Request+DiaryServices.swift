import Vapor
import Service

extension Request {
    
    public var diaryTakeAllService: DiaryTakeAllService {
        .init(diaryRepository)
    }
    
    public var diaryCreateService: DiaryCreateService {
        .init(diaryRepository)
    }
    
    public var diaryUpdateService: DiaryUpdateService {
        .init(diaryRepository)
    }
    
    public var diaryDeleteService: DiaryDeleteService {
        .init(diaryRepository)
    }
}
