// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var blocks: Blocks {
        Blocks(path: path + "/blocks")
    }

    public struct Blocks {
        /// Path: `/orgs/{org}/blocks`
        public let path: String

        /// List users blocked by an organization
        ///
        /// List the users blocked by an organization.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-users-blocked-by-an-organization)
        public var get: Request<[OctoKit.SimpleUser]> {
            Request(method: "GET", url: path, id: "orgs/list-blocked-users")
        }
    }
}
