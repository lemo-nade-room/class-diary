import Foundation

public struct User: Hashable, Equatable {
    
    public var mailAddress: String
    
    public init(_ mailAddress: String) {
        self.mailAddress = mailAddress
    }
    
}
