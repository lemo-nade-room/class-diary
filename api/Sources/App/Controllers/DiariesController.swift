import Vapor
import Provider
import Presentation
import Entity

struct DiariesController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let diaries = routes.grouped("diary")
        diaries.get(use: index)
        
        try diaries.register(collection: DiaryController())
        
    }
    
    func index(req: Request) async throws -> [Presentation.Diary] {
        try await req.diaryTakeAllService.all()
            .toJSON
    }
}
