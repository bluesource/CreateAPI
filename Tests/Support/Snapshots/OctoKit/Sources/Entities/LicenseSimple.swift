// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct LicenseSimple: Codable {
    /// Example: "mit"
    public var key: String
    /// Example: "MIT License"
    public var name: String
    /// Example: "https://api.github.com/licenses/mit"
    public var url: URL?
    /// Example: "MIT"
    public var spdxID: String?
    /// Example: "MDc6TGljZW5zZW1pdA=="
    public var nodeID: String
    public var htmlURL: URL?

    public init(key: String, name: String, url: URL? = nil, spdxID: String? = nil, nodeID: String, htmlURL: URL? = nil) {
        self.key = key
        self.name = name
        self.url = url
        self.spdxID = spdxID
        self.nodeID = nodeID
        self.htmlURL = htmlURL
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.key = try values.decode(String.self, forKey: "key")
        self.name = try values.decode(String.self, forKey: "name")
        self.url = try values.decodeIfPresent(URL.self, forKey: "url")
        self.spdxID = try values.decodeIfPresent(String.self, forKey: "spdx_id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(key, forKey: "key")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(spdxID, forKey: "spdx_id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
    }
}
