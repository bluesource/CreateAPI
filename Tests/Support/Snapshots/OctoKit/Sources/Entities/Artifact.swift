// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// An artifact
public struct Artifact: Codable {
    public var id: Int
    /// Example: "MDEwOkNoZWNrU3VpdGU1"
    public var nodeID: String
    /// The name of the artifact.
    ///
    /// Example: "AdventureWorks.Framework"
    public var name: String
    /// The size in bytes of the artifact.
    ///
    /// Example: 12345
    public var sizeInBytes: Int
    /// Example: "https://api.github.com/repos/github/hello-world/actions/artifacts/5"
    public var url: String
    /// Example: "https://api.github.com/repos/github/hello-world/actions/artifacts/5/zip"
    public var archiveDownloadURL: String
    /// Whether or not the artifact has expired.
    public var isExpired: Bool
    public var createdAt: Date?
    public var expiresAt: Date?
    public var updatedAt: Date?

    public init(id: Int, nodeID: String, name: String, sizeInBytes: Int, url: String, archiveDownloadURL: String, isExpired: Bool, createdAt: Date? = nil, expiresAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.sizeInBytes = sizeInBytes
        self.url = url
        self.archiveDownloadURL = archiveDownloadURL
        self.isExpired = isExpired
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.updatedAt = updatedAt
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.name = try values.decode(String.self, forKey: "name")
        self.sizeInBytes = try values.decode(Int.self, forKey: "size_in_bytes")
        self.url = try values.decode(String.self, forKey: "url")
        self.archiveDownloadURL = try values.decode(String.self, forKey: "archive_download_url")
        self.isExpired = try values.decode(Bool.self, forKey: "expired")
        self.createdAt = try values.decodeIfPresent(Date.self, forKey: "created_at")
        self.expiresAt = try values.decodeIfPresent(Date.self, forKey: "expires_at")
        self.updatedAt = try values.decodeIfPresent(Date.self, forKey: "updated_at")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(name, forKey: "name")
        try values.encode(sizeInBytes, forKey: "size_in_bytes")
        try values.encode(url, forKey: "url")
        try values.encode(archiveDownloadURL, forKey: "archive_download_url")
        try values.encode(isExpired, forKey: "expired")
        try values.encodeIfPresent(createdAt, forKey: "created_at")
        try values.encodeIfPresent(expiresAt, forKey: "expires_at")
        try values.encodeIfPresent(updatedAt, forKey: "updated_at")
    }
}
