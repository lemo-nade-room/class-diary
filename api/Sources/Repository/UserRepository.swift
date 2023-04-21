import Usecase
import Entity

public protocol UserRepository {
    
    func find(_ mailAddress: String) async throws -> User?
    
}
