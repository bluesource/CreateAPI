// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Git Reference
///
/// Git references within a repository
public struct GitRef: Codable {
    public var ref: String
    public var nodeID: String
    public var url: URL
    public var object: Object

    public struct Object: Codable {
        public var type: String
        /// SHA for the reference
        ///
        /// Example: "7638417db6d59f3c431d3e1f261cc637155684cd"
        public var sha: String
        public var url: URL

        public init(type: String, sha: String, url: URL) {
            self.type = type
            self.sha = sha
            self.url = url
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.type = try values.decode(String.self, forKey: "type")
            self.sha = try values.decode(String.self, forKey: "sha")
            self.url = try values.decode(URL.self, forKey: "url")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(type, forKey: "type")
            try values.encode(sha, forKey: "sha")
            try values.encode(url, forKey: "url")
        }
    }

    public init(ref: String, nodeID: String, url: URL, object: Object) {
        self.ref = ref
        self.nodeID = nodeID
        self.url = url
        self.object = object
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ref = try values.decode(String.self, forKey: "ref")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.object = try values.decode(Object.self, forKey: "object")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(ref, forKey: "ref")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(url, forKey: "url")
        try values.encode(object, forKey: "object")
    }
}