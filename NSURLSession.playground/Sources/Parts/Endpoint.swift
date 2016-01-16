import Foundation

public typealias Parameters = [String:AnyObject]
public typealias Headers = [String:AnyObject]

public enum Method: String {
    
    case GET,POST,DELETE,PUT,PATCH,OPTIONS
    
}

public struct Endpoint: Equatable {
    
    public var name: String
    public var path: String
    public var method: Method
    public var body: Parameters = [:]
    public var query: Parameters = [:]
    public var headers: Headers = [:]
    
    public var requiresToken: Bool = false
    
    public init(name: String, path: String, method: Method) {
        
        self.name = name
        self.path = path
        self.method = method
        
    }
    
}

public func == (lhs: Endpoint, rhs: Endpoint) -> Bool {
    
    return lhs.name == rhs.name && lhs.path == rhs.path && lhs.method.rawValue == rhs.method.rawValue
    
}

public protocol EndpointList: RawRepresentable, Hashable { var endpoints: [Endpoint] { get } }

extension EndpointList {
    
    public static var endpoints: [Endpoint] { return [] }
    
    public typealias RawValue = String
    
    public var choices: [Any] { return Mirror(reflecting: self).children.map({ return $0.1 }) }
    
    public var rawValue: Endpoint { return endpoints[hashValue] }
    
}