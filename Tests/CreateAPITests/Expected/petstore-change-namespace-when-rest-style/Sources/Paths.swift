// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Namespace {
    public static var pets: Pets {
        Pets(path: "/pets")
    }

    public struct Pets {
        /// Path: `/pets`
        public let path: String

        /// List all pets
        public func get(limit: Int? = nil) -> Request<[petstore_change_namespace_when_rest_style.Pet]> {
            .get(path, query: makeGetQuery(limit))
        }

        public enum GetResponseHeaders {
            /// A link to the next page of responses
            public static let next = HTTPHeader<String>(field: "x-next")
        }

        private func makeGetQuery(_ limit: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            return encoder.items
        }

        /// Create a pet
        public var post: Request<Void> {
            .post(path)
        }
    }
}

extension Namespace.Pets {
    public func petID(_ petID: String) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    public struct WithPetID {
        /// Path: `/pets/{petId}`
        public let path: String

        /// Info for a specific pet
        public var get: Request<petstore_change_namespace_when_rest_style.Pet> {
            .get(path)
        }
    }
}

public enum Namespace {}
