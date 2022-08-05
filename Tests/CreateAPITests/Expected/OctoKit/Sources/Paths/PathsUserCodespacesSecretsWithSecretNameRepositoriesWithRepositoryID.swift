// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Codespaces.Secrets.WithSecretName.Repositories {
    public func repositoryID(_ repositoryID: Int) -> WithRepositoryID {
        WithRepositoryID(path: "\(path)/\(repositoryID)")
    }

    public struct WithRepositoryID {
        /// Path: `/user/codespaces/secrets/{secret_name}/repositories/{repository_id}`
        public let path: String

        /// Add a selected repository to a user secret
        ///
        /// Adds a repository to the selected repositories for a user's codespace secret.
        /// You must authenticate using an access token with the `user` or `read:user` scope to use this endpoint. User must have Codespaces access to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/codespaces#add-a-selected-repository-to-a-user-secret)
        public var put: Request<Void> {
            Request(method: "PUT", url: path, id: "codespaces/add-repository-for-secret-for-authenticated-user")
        }

        /// Remove a selected repository from a user secret
        ///
        /// Removes a repository from the selected repositories for a user's codespace secret.
        /// You must authenticate using an access token with the `user` or `read:user` scope to use this endpoint. User must have Codespaces access to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/codespaces#remove-a-selected-repository-from-a-user-secret)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "codespaces/remove-repository-for-secret-for-authenticated-user")
        }
    }
}
