import Entity
import Usecase

public protocol StudentRepository {
    
    func find(_ user: User) -> Student?
    
}
