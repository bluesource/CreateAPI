// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.App.Installations.WithInstallationID {
    public var suspended: Suspended {
        Suspended(path: path + "/suspended")
    }

    public struct Suspended {
        /// Path: `/app/installations/{installation_id}/suspended`
        public let path: String

        /// Suspend an app installation
        ///
        /// Suspends a GitHub App on a user, organization, or business account, which blocks the app from accessing the account's resources. When a GitHub App is suspended, the app's access to the GitHub API or webhook events is blocked for that account.
        /// 
        /// You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#suspend-an-app-installation)
        public var put: Request<Void> {
            Request(method: "PUT", url: path, id: "apps/suspend-installation")
        }

        /// Unsuspend an app installation
        ///
        /// Removes a GitHub App installation suspension.
        /// 
        /// You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#unsuspend-an-app-installation)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "apps/unsuspend-installation")
        }
    }
}
