// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Workflows.WithWorkflowID {
    public var timing: Timing {
        Timing(path: path + "/timing")
    }

    public struct Timing {
        /// Path: `/repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing`
        public let path: String

        /// Get workflow usage
        ///
        /// Gets the number of billable minutes used by a specific workflow during the current billing cycle. Billable minutes only apply to workflows in private repositories that use GitHub-hosted runners. Usage is listed for each GitHub-hosted runner operating system in milliseconds. Any job re-runs are also included in the usage. The usage does not include the multiplier for macOS and Windows runners and is not rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://help.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
        /// 
        /// You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`. Anyone with read access to the repository can use this endpoint. If the repository is private you must use an access token with the `repo` scope. GitHub Apps must have the `actions:read` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#get-workflow-usage)
        public var get: Request<OctoKit.WorkflowUsage> {
            Request(method: "GET", url: path, id: "actions/get-workflow-usage")
        }
    }
}
