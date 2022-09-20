// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths.Form {
    public var testObject: TestObject {
        TestObject(path: path + "/test-object")
    }

    public struct TestObject {
        /// Path: `/form/test-object`
        public let path: String

        /// Form Object Explode True
        public func get(type: `Type`) -> Request<Void> {
            Request(method: "GET", url: path, query: makeGetQuery(type))
        }

        private func makeGetQuery(_ type: `Type`) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            return encoder.items
        }

        public struct `Type`: Codable {
            public var id: String
            public var name: String?

            public init(id: String, name: String? = nil) {
                self.id = id
                self.name = name
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(id, forKey: "id")
                encoder.encode(name, forKey: "name")
                return encoder.items
            }
        }

        /// Form Object Explode False
        public func post(type: `Type`) -> Request<Void> {
            Request(method: "POST", url: path, query: makePostQuery(type))
        }

        private func makePostQuery(_ type: `Type`) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type", explode: false)
            return encoder.items
        }
    }
}
