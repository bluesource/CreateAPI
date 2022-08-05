// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// A request for a specific ref(branch,sha,tag) to be deployed
public struct Deployment: Codable {
    /// Example: "https://api.github.com/repos/octocat/example/deployments/1"
    public var url: URL
    /// Unique identifier of the deployment
    ///
    /// Example: 42
    public var id: Int
    /// Example: "MDEwOkRlcGxveW1lbnQx"
    public var nodeID: String
    /// Example: "a84d88e7554fc1fa21bcbc4efae3c782a70d2b9d"
    public var sha: String
    /// The ref to deploy. This can be a branch, tag, or sha.
    ///
    /// Example: "topic-branch"
    public var ref: String
    /// Parameter to specify a task to execute
    ///
    /// Example: "deploy"
    public var task: String
    public var payload: Payload
    /// Example: "staging"
    public var originalEnvironment: String?
    /// Name for the target deployment environment.
    ///
    /// Example: "production"
    public var environment: String
    /// Example: "Deploy request from hubot"
    public var description: String?
    /// Simple User
    public var creator: SimpleUser?
    /// Example: "2012-07-20T01:19:13Z"
    public var createdAt: Date
    /// Example: "2012-07-20T01:19:13Z"
    public var updatedAt: Date
    /// Example: "https://api.github.com/repos/octocat/example/deployments/1/statuses"
    public var statusesURL: URL
    /// Example: "https://api.github.com/repos/octocat/example"
    public var repositoryURL: URL
    /// Specifies if the given environment is will no longer exist at some point in the future. Default: false.
    ///
    /// Example: true
    public var isTransientEnvironment: Bool?
    /// Specifies if the given environment is one that end-users directly interact with. Default: false.
    ///
    /// Example: true
    public var isProductionEnvironment: Bool?
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var performedViaGithubApp: Integration?

    public enum Payload: Codable {
        case object([String: AnyJSON])
        case string(String)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode([String: AnyJSON].self) {
                self = .object(value)
            } else if let value = try? container.decode(String.self) {
                self = .string(value)
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize `oneOf`")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .object(let value): try container.encode(value)
            case .string(let value): try container.encode(value)
            }
        }
    }

    public init(url: URL, id: Int, nodeID: String, sha: String, ref: String, task: String, payload: Payload, originalEnvironment: String? = nil, environment: String, description: String? = nil, creator: SimpleUser? = nil, createdAt: Date, updatedAt: Date, statusesURL: URL, repositoryURL: URL, isTransientEnvironment: Bool? = nil, isProductionEnvironment: Bool? = nil, performedViaGithubApp: Integration? = nil) {
        self.url = url
        self.id = id
        self.nodeID = nodeID
        self.sha = sha
        self.ref = ref
        self.task = task
        self.payload = payload
        self.originalEnvironment = originalEnvironment
        self.environment = environment
        self.description = description
        self.creator = creator
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.statusesURL = statusesURL
        self.repositoryURL = repositoryURL
        self.isTransientEnvironment = isTransientEnvironment
        self.isProductionEnvironment = isProductionEnvironment
        self.performedViaGithubApp = performedViaGithubApp
    }

    private enum CodingKeys: String, CodingKey {
        case url
        case id
        case nodeID = "node_id"
        case sha
        case ref
        case task
        case payload
        case originalEnvironment = "original_environment"
        case environment
        case description
        case creator
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case statusesURL = "statuses_url"
        case repositoryURL = "repository_url"
        case isTransientEnvironment = "transient_environment"
        case isProductionEnvironment = "production_environment"
        case performedViaGithubApp = "performed_via_github_app"
    }
}