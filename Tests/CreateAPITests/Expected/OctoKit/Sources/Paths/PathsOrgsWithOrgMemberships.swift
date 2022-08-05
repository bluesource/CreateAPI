// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var memberships: Memberships {
        Memberships(path: path + "/memberships")
    }

    public struct Memberships {
        /// Path: `/orgs/{org}/memberships`
        public let path: String
    }
}
