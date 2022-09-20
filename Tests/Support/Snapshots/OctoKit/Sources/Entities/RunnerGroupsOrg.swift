// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct RunnerGroupsOrg: Codable {
    public var id: Double
    public var name: String
    public var visibility: String
    public var isDefault: Bool
    /// Link to the selected repositories resource for this runner group. Not present unless visibility was set to `selected`
    public var selectedRepositoriesURL: String?
    public var runnersURL: String
    public var isInherited: Bool
    public var inheritedAllowsPublicRepositories: Bool?
    public var allowsPublicRepositories: Bool

    public init(id: Double, name: String, visibility: String, isDefault: Bool, selectedRepositoriesURL: String? = nil, runnersURL: String, isInherited: Bool, inheritedAllowsPublicRepositories: Bool? = nil, allowsPublicRepositories: Bool) {
        self.id = id
        self.name = name
        self.visibility = visibility
        self.isDefault = isDefault
        self.selectedRepositoriesURL = selectedRepositoriesURL
        self.runnersURL = runnersURL
        self.isInherited = isInherited
        self.inheritedAllowsPublicRepositories = inheritedAllowsPublicRepositories
        self.allowsPublicRepositories = allowsPublicRepositories
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Double.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.visibility = try values.decode(String.self, forKey: "visibility")
        self.isDefault = try values.decode(Bool.self, forKey: "default")
        self.selectedRepositoriesURL = try values.decodeIfPresent(String.self, forKey: "selected_repositories_url")
        self.runnersURL = try values.decode(String.self, forKey: "runners_url")
        self.isInherited = try values.decode(Bool.self, forKey: "inherited")
        self.inheritedAllowsPublicRepositories = try values.decodeIfPresent(Bool.self, forKey: "inherited_allows_public_repositories")
        self.allowsPublicRepositories = try values.decode(Bool.self, forKey: "allows_public_repositories")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(visibility, forKey: "visibility")
        try values.encode(isDefault, forKey: "default")
        try values.encodeIfPresent(selectedRepositoriesURL, forKey: "selected_repositories_url")
        try values.encode(runnersURL, forKey: "runners_url")
        try values.encode(isInherited, forKey: "inherited")
        try values.encodeIfPresent(inheritedAllowsPublicRepositories, forKey: "inherited_allows_public_repositories")
        try values.encode(allowsPublicRepositories, forKey: "allows_public_repositories")
    }
}
