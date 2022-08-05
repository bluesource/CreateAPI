// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID {
    public var artifacts: Artifacts {
        Artifacts(path: path + "/artifacts")
    }

    public struct Artifacts {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/artifacts`
        public let path: String

        /// List workflow run artifacts
        ///
        /// Lists artifacts for a workflow run. Anyone with read access to the repository can use this endpoint. If the repository is private you must use an access token with the `repo` scope. GitHub Apps must have the `actions:read` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-workflow-run-artifacts)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "actions/list-workflow-run-artifacts")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var artifacts: [OctoKit.Artifact]

            public init(totalCount: Int, artifacts: [OctoKit.Artifact]) {
                self.totalCount = totalCount
                self.artifacts = artifacts
            }

            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case artifacts
            }
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
