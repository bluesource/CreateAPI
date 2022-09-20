// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Teams.WithTeamSlug.Discussions.WithDiscussionNumber.Comments {
    public func commentNumber(_ commentNumber: Int) -> WithCommentNumber {
        WithCommentNumber(path: "\(path)/\(commentNumber)")
    }

    public struct WithCommentNumber {
        /// Path: `/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}`
        public let path: String

        /// Get a discussion comment
        ///
        /// Get a specific comment on a team discussion. OAuth access tokens require the `read:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#get-a-discussion-comment)
        public var get: Request<OctoKit.TeamDiscussionComment> {
            Request(method: "GET", url: path, id: "teams/get-discussion-comment-in-org")
        }

        /// Update a discussion comment
        ///
        /// Edits the body text of a discussion comment. OAuth access tokens require the `write:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#update-a-discussion-comment)
        public func patch(body: String) -> Request<OctoKit.TeamDiscussionComment> {
            Request(method: "PATCH", url: path, body: ["body": body], id: "teams/update-discussion-comment-in-org")
        }

        /// Delete a discussion comment
        ///
        /// Deletes a comment on a team discussion. OAuth access tokens require the `write:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#delete-a-discussion-comment)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "teams/delete-discussion-comment-in-org")
        }
    }
}
