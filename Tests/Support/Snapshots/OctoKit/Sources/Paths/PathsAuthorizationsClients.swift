// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Authorizations {
    public var clients: Clients {
        Clients(path: path + "/clients")
    }

    public struct Clients {
        /// Path: `/authorizations/clients`
        public let path: String
    }
}
