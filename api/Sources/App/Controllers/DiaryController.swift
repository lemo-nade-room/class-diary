import Vapor
import Provider
import Presentation
import Entity

struct DiaryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let diary = routes.grouped(.init(stringLiteral: path))
        diary.post(use: create)
    }
    
    func create(req: Request) async throws -> HTTPStatus {
        let 日誌 = try req.body日誌
        try await req.diaryCreateService.create(日誌)
        return .created
    }
    
    func update(req: Request) async throws -> HTTPStatus {
        let 日誌 = try req.body日誌
        try await req.diaryUpdateService.update(日誌)
        return .ok
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        let 日付 = try req.paramDiaryDate
        try await req.diaryDeleteService.delete(日付)
        return .ok
    }
}

fileprivate let path = ":diary-date"

extension Request {
    
    fileprivate var paramDiaryDate: Date {
        get throws {
            if let date = parameters.get(path) {
                return try Date(date)
            }
            throw Abort(.badRequest)
        }
    }
    
    fileprivate var body日誌: Entity.Diary {
        get throws {
            let 日付 = try paramDiaryDate
            let 日誌 = try content.decode(Presentation.Diary.self).entity
            guard 日付 == 日誌.日付 else {
                throw Abort(.badRequest, reason: "日誌の日付とパスの日付が異なる")
            }
            return 日誌
        }
    }
}
