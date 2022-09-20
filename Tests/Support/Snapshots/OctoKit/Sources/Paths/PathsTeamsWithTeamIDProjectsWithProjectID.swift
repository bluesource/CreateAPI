// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Teams.WithTeamID.Projects {
    public func projectID(_ projectID: Int) -> WithProjectID {
        WithProjectID(path: "\(path)/\(projectID)")
    }

    public struct WithProjectID {
        /// Path: `/teams/{team_id}/projects/{project_id}`
        public let path: String

        /// Check team permissions for a project (Legacy)
        ///
        /// **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Check team permissions for a project](https://docs.github.com/rest/reference/teams#check-team-permissions-for-a-project) endpoint.
        /// 
        /// Checks whether a team has `read`, `write`, or `admin` permissions for an organization project. The response includes projects inherited from a parent team.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams/#check-team-permissions-for-a-project-legacy)
        @available(*, deprecated, message: "Deprecated")
        public var get: Request<OctoKit.TeamProject> {
            Request(method: "GET", url: path, id: "teams/check-permissions-for-project-legacy")
        }

        /// Add or update team project permissions (Legacy)
        ///
        /// **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Add or update team project permissions](https://docs.github.com/rest/reference/teams#add-or-update-team-project-permissions) endpoint.
        /// 
        /// Adds an organization project to a team. To add a project to a team or update the team's permission on a project, the authenticated user must have `admin` permissions for the project. The project and team must be part of the same organization.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams/#add-or-update-team-project-permissions-legacy)
        @available(*, deprecated, message: "Deprecated")
        public func put(permission: PutRequest.Permission? = nil) -> Request<Void> {
            Request(method: "PUT", url: path, body: PutRequest(permission: permission), id: "teams/add-or-update-project-permissions-legacy")
        }

        public struct PutRequest: Encodable {
            /// The permission to grant to the team for this project. Can be one of:  
            /// \* `read` - team members can read, but not write to or administer this project.  
            /// \* `write` - team members can read and write, but not administer this project.  
            /// \* `admin` - team members can read, write and administer this project.  
            /// Default: the team's `permission` attribute will be used to determine what permission to grant the team on this project. Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP verbs](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-verbs)."
            public var permission: Permission?

            /// The permission to grant to the team for this project. Can be one of:  
            /// \* `read` - team members can read, but not write to or administer this project.  
            /// \* `write` - team members can read and write, but not administer this project.  
            /// \* `admin` - team members can read, write and administer this project.  
            /// Default: the team's `permission` attribute will be used to determine what permission to grant the team on this project. Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP verbs](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-verbs)."
            public enum Permission: String, Codable, CaseIterable {
                case read
                case write
                case admin
            }

            public init(permission: Permission? = nil) {
                self.permission = permission
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(permission, forKey: "permission")
            }
        }

        /// Remove a project from a team (Legacy)
        ///
        /// **Deprecation Notice:** This endpoint route is deprecated and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove a project from a team](https://docs.github.com/rest/reference/teams#remove-a-project-from-a-team) endpoint.
        /// 
        /// Removes an organization project from a team. An organization owner or a team maintainer can remove any project from the team. To remove a project from a team as an organization member, the authenticated user must have `read` access to both the team and project, or `admin` access to the team or project. **Note:** This endpoint removes the project from the team, but does not delete it.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams/#remove-a-project-from-a-team-legacy)
        @available(*, deprecated, message: "Deprecated")
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "teams/remove-project-legacy")
        }
    }
}
