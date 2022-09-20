// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct B: Codable {
    /// This is a description
    /// And it should be on multiple lines
    public var kind: String

    public init(kind: String) {
        self.kind = kind
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.kind = try values.decode(String.self, forKey: "kind")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(kind, forKey: "kind")
    }
}
