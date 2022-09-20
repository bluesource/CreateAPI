// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct PorterLargeFile: Codable {
    public var refName: String
    public var path: String
    public var oid: String
    public var size: Int

    public init(refName: String, path: String, oid: String, size: Int) {
        self.refName = refName
        self.path = path
        self.oid = oid
        self.size = size
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.refName = try values.decode(String.self, forKey: "ref_name")
        self.path = try values.decode(String.self, forKey: "path")
        self.oid = try values.decode(String.self, forKey: "oid")
        self.size = try values.decode(Int.self, forKey: "size")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(refName, forKey: "ref_name")
        try values.encode(path, forKey: "path")
        try values.encode(oid, forKey: "oid")
        try values.encode(size, forKey: "size")
    }
}
