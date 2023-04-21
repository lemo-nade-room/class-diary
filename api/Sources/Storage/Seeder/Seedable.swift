import Fluent

protocol Seedable {
    func seed(on db: Database) async throws
    func revert(on db: Database) async throws
}
