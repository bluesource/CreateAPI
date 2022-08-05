// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Environment Approval
///
/// An entry in the reviews log for environment deployments
public struct EnvironmentApprovals: Codable {
    /// The list of environments that were approved or rejected
    public var environments: [Environment]
    /// Whether deployment to the environment(s) was approved or rejected
    ///
    /// Example: "approved"
    public var state: State
    /// Simple User
    public var user: SimpleUser
    /// The comment submitted with the deployment review
    ///
    /// Example: "Ship it!"
    public var comment: String

    public struct Environment: Codable {
        /// The id of the environment.
        ///
        /// Example: 56780428
        public var id: Int?
        /// Example: "MDExOkVudmlyb25tZW50NTY3ODA0Mjg="
        public var nodeID: String?
        /// The name of the environment.
        ///
        /// Example: "staging"
        public var name: String?
        /// Example: "https://api.github.com/repos/github/hello-world/environments/staging"
        public var url: String?
        /// Example: "https://github.com/github/hello-world/deployments/activity_log?environments_filter=staging"
        public var htmlURL: String?
        /// The time that the environment was created, in ISO 8601 format.
        ///
        /// Example: "2020-11-23T22:00:40Z"
        public var createdAt: Date?
        /// The time that the environment was last updated, in ISO 8601 format.
        ///
        /// Example: "2020-11-23T22:00:40Z"
        public var updatedAt: Date?

        public init(id: Int? = nil, nodeID: String? = nil, name: String? = nil, url: String? = nil, htmlURL: String? = nil, createdAt: Date? = nil, updatedAt: Date? = nil) {
            self.id = id
            self.nodeID = nodeID
            self.name = name
            self.url = url
            self.htmlURL = htmlURL
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case nodeID = "node_id"
            case name
            case url
            case htmlURL = "html_url"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }

    /// Whether deployment to the environment(s) was approved or rejected
    ///
    /// Example: "approved"
    public enum State: String, Codable, CaseIterable {
        case approved
        case rejected
    }

    public init(environments: [Environment], state: State, user: SimpleUser, comment: String) {
        self.environments = environments
        self.state = state
        self.user = user
        self.comment = comment
    }
}
