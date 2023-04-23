import Fluent

public struct DiaryRepository {
    
    var db: Database
    
    public init(on db: Database) {
        self.db = db
    }
}
