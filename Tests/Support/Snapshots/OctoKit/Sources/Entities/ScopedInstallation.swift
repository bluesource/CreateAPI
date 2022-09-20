// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ScopedInstallation: Codable {
    /// App Permissions
    ///
    /// The permissions granted to the user-to-server access token.
    ///
    /// Example:
    ///
    /// {
    ///   "contents" : "read",
    ///   "deployments" : "write",
    ///   "issues" : "read",
    ///   "single_file" : "read"
    /// }
    public var permissions: AppPermissions
    /// Describe whether all repositories have been selected or there's a selection involved
    public var repositorySelection: RepositorySelection
    /// Example: "config.yaml"
    public var singleFileName: String?
    /// Example: true
    public var hasMultipleSingleFiles: Bool?
    /// Example: ["config.yml", ".github/issue_TEMPLATE.md"]
    public var singleFilePaths: [String]?
    /// Example: "https://api.github.com/users/octocat/repos"
    public var repositoriesURL: URL
    /// Simple User
    public var account: SimpleUser

    /// Describe whether all repositories have been selected or there's a selection involved
    public enum RepositorySelection: String, Codable, CaseIterable {
        case all
        case selected
    }

    public init(permissions: AppPermissions, repositorySelection: RepositorySelection, singleFileName: String? = nil, hasMultipleSingleFiles: Bool? = nil, singleFilePaths: [String]? = nil, repositoriesURL: URL, account: SimpleUser) {
        self.permissions = permissions
        self.repositorySelection = repositorySelection
        self.singleFileName = singleFileName
        self.hasMultipleSingleFiles = hasMultipleSingleFiles
        self.singleFilePaths = singleFilePaths
        self.repositoriesURL = repositoriesURL
        self.account = account
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.permissions = try values.decode(AppPermissions.self, forKey: "permissions")
        self.repositorySelection = try values.decode(RepositorySelection.self, forKey: "repository_selection")
        self.singleFileName = try values.decodeIfPresent(String.self, forKey: "single_file_name")
        self.hasMultipleSingleFiles = try values.decodeIfPresent(Bool.self, forKey: "has_multiple_single_files")
        self.singleFilePaths = try values.decodeIfPresent([String].self, forKey: "single_file_paths")
        self.repositoriesURL = try values.decode(URL.self, forKey: "repositories_url")
        self.account = try values.decode(SimpleUser.self, forKey: "account")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(permissions, forKey: "permissions")
        try values.encode(repositorySelection, forKey: "repository_selection")
        try values.encodeIfPresent(singleFileName, forKey: "single_file_name")
        try values.encodeIfPresent(hasMultipleSingleFiles, forKey: "has_multiple_single_files")
        try values.encodeIfPresent(singleFilePaths, forKey: "single_file_paths")
        try values.encode(repositoriesURL, forKey: "repositories_url")
        try values.encode(account, forKey: "account")
    }
}
