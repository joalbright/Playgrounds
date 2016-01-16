import Foundation


enum GitHubEndpoints: String, EndpointList {
    
    case User
    
    var endpoints: [Endpoint] { return [
        
        Endpoint(name: "", path: "", method: .POST)
        
    ] }
    
    init?(name: String) {

        self = GitHubEndpoints(name: name)
        guard let find = endpoints.filter({ $0.name == rawValue }).first else { return }
        guard let choice = choices[index] as? GitHubEndpoints else { return }
        self = choice
        
    }
    
}


GitHubEndpoints(name: "")