import Foundation
import Entity

public protocol DiaryAllTakable {
    func all() async throws -> [Diary]
}

public protocol DiaryCreatable {
    func create(_ diary: Diary) async throws
}

public protocol DiaryUpdatable {
    func update(_ diary: Diary) async throws
}

public protocol DiaryDeletable {
    func delete(_ date: Date) async throws
}
