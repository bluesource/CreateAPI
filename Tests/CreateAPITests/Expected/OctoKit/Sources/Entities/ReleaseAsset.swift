// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Data related to a release.
public struct ReleaseAsset: Codable {
    public var url: URL
    public var browserDownloadURL: URL
    public var id: Int
    public var nodeID: String
    /// The file name of the asset.
    ///
    /// Example: "Team Environment"
    public var name: String
    public var label: String?
    /// State of the release asset.
    public var state: State
    public var contentType: String
    public var size: Int
    public var downloadCount: Int
    public var createdAt: Date
    public var updatedAt: Date
    /// Simple User
    public var uploader: SimpleUser?

    /// State of the release asset.
    public enum State: String, Codable, CaseIterable {
        case uploaded
        case `open`
    }

    public init(url: URL, browserDownloadURL: URL, id: Int, nodeID: String, name: String, label: String? = nil, state: State, contentType: String, size: Int, downloadCount: Int, createdAt: Date, updatedAt: Date, uploader: SimpleUser? = nil) {
        self.url = url
        self.browserDownloadURL = browserDownloadURL
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.label = label
        self.state = state
        self.contentType = contentType
        self.size = size
        self.downloadCount = downloadCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.uploader = uploader
    }

    private enum CodingKeys: String, CodingKey {
        case url
        case browserDownloadURL = "browser_download_url"
        case id
        case nodeID = "node_id"
        case name
        case label
        case state
        case contentType = "content_type"
        case size
        case downloadCount = "download_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case uploader
    }
}
