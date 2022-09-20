// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Actions.Runners.WithRunnerID {
    public var labels: Labels {
        Labels(path: path + "/labels")
    }

    public struct Labels {
        /// Path: `/orgs/{org}/actions/runners/{runner_id}/labels`
        public let path: String

        /// List labels for a self-hosted runner for an organization
        ///
        /// Lists all labels for a self-hosted runner configured in an organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-labels-for-a-self-hosted-runner-for-an-organization)
        public var get: Request<GetResponse> {
            Request(method: "GET", url: path, id: "actions/list-labels-for-self-hosted-runner-for-org")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var labels: [OctoKit.RunnerLabel]

            public init(totalCount: Int, labels: [OctoKit.RunnerLabel]) {
                self.totalCount = totalCount
                self.labels = labels
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.labels = try values.decode([OctoKit.RunnerLabel].self, forKey: "labels")
            }
        }

        /// Add custom labels to a self-hosted runner for an organization
        ///
        /// Add custom labels to a self-hosted runner configured in an organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#add-custom-labels-to-a-self-hosted-runner-for-an-organization)
        public func post(labels: [String]) -> Request<PostResponse> {
            Request(method: "POST", url: path, body: ["labels": labels], id: "actions/add-custom-labels-to-self-hosted-runner-for-org")
        }

        public struct PostResponse: Decodable {
            public var totalCount: Int
            public var labels: [OctoKit.RunnerLabel]

            public init(totalCount: Int, labels: [OctoKit.RunnerLabel]) {
                self.totalCount = totalCount
                self.labels = labels
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.labels = try values.decode([OctoKit.RunnerLabel].self, forKey: "labels")
            }
        }

        /// Set custom labels for a self-hosted runner for an organization
        ///
        /// Remove all previous custom labels and set the new custom labels for a specific
        /// self-hosted runner configured in an organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#set-custom-labels-for-a-self-hosted-runner-for-an-organization)
        public func put(labels: [String]) -> Request<PutResponse> {
            Request(method: "PUT", url: path, body: ["labels": labels], id: "actions/set-custom-labels-for-self-hosted-runner-for-org")
        }

        public struct PutResponse: Decodable {
            public var totalCount: Int
            public var labels: [OctoKit.RunnerLabel]

            public init(totalCount: Int, labels: [OctoKit.RunnerLabel]) {
                self.totalCount = totalCount
                self.labels = labels
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.labels = try values.decode([OctoKit.RunnerLabel].self, forKey: "labels")
            }
        }

        /// Remove all custom labels from a self-hosted runner for an organization
        ///
        /// Remove all custom labels from a self-hosted runner configured in an
        /// organization. Returns the remaining read-only labels from the runner.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#remove-all-custom-labels-from-a-self-hosted-runner-for-an-organization)
        public var delete: Request<DeleteResponse> {
            Request(method: "DELETE", url: path, id: "actions/remove-all-custom-labels-from-self-hosted-runner-for-org")
        }

        public struct DeleteResponse: Decodable {
            public var totalCount: Int
            public var labels: [OctoKit.RunnerLabel]

            public init(totalCount: Int, labels: [OctoKit.RunnerLabel]) {
                self.totalCount = totalCount
                self.labels = labels
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.labels = try values.decode([OctoKit.RunnerLabel].self, forKey: "labels")
            }
        }
    }
}
