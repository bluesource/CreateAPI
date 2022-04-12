// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct Pet: Codable {
    public var id: Int
    public var name: String
    public var tag: String?

    public init(id: Int, name: String, tag: String? = nil) {
        self.id = id
        self.name = name
        self.tag = tag
    }
}

public struct Store: Codable {
    public var pets: [Pet]

    public init(pets: [Pet]) {
        self.pets = pets
    }
}

public struct Error: Codable {
    public var code: Int
    public var message: String

    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}

struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}
