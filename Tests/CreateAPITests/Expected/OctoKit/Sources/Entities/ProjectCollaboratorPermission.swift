// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ProjectCollaboratorPermission: Codable {
    public var permission: String
    /// Simple User
    public var user: SimpleUser?

    public init(permission: String, user: SimpleUser? = nil) {
        self.permission = permission
        self.user = user
    }
}
