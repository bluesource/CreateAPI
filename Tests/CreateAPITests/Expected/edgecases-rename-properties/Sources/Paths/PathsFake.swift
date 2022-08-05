// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var fake: Fake {
        Fake(path: "/fake")
    }

    public struct Fake {
        /// Path: `/fake`
        public let path: String

        /// To test enum parameters
        public func get(parameters: GetParameters? = nil) -> Request<Void> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "testEnumParameters")
        }

        public struct GetParameters {
            public var enumQueryStringArray: [EnumQueryStringArray]?
            public var enumQueryString: EnumQueryString?
            public var enumQueryInteger: Int?

            public enum EnumQueryStringArray: String, Codable, CaseIterable {
                case greaterThan = ">"
                case dollar = "$"
            }

            public enum EnumQueryString: String, Codable, CaseIterable {
                case abc = "_abc"
                case minusefg = "-efg"
                case xyz = "(xyz)"
            }

            public init(enumQueryStringArray: [EnumQueryStringArray]? = nil, enumQueryString: EnumQueryString? = nil, enumQueryInteger: Int? = nil) {
                self.enumQueryStringArray = enumQueryStringArray
                self.enumQueryString = enumQueryString
                self.enumQueryInteger = enumQueryInteger
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(enumQueryStringArray, forKey: "enum_query_string_array")
                encoder.encode(enumQueryString, forKey: "enum_query_string")
                encoder.encode(enumQueryInteger, forKey: "enum_query_integer")
                return encoder.items
            }
        }

        /// Fake endpoint for testing various parameters
        public func post(_ body: PostRequest? = nil) -> Request<Void> {
            Request(method: "POST", url: path, body: body.map(URLQueryEncoder.encode)?.percentEncodedQuery, id: "testEndpointParameters")
        }

        public struct PostRequest: Encodable {
            /// None
            public var integer: Int?
            /// None
            public var int32: Int?
            /// None
            public var int64: Int?
            /// None
            public var number: Double
            /// None
            public var float: Double?
            /// None
            public var double: Double
            /// None
            public var string: String?
            /// None
            public var patternWithoutDelimiter: String
            /// None
            public var byte: Data
            /// None
            public var binary: String?
            /// None
            public var date: NaiveDate?
            /// None
            public var dateTime: Date?
            /// None
            public var password: String?
            /// None
            public var callback: String?

            public init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Double? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: Data, binary: String? = nil, date: NaiveDate? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
                self.integer = integer
                self.int32 = int32
                self.int64 = int64
                self.number = number
                self.float = float
                self.double = double
                self.string = string
                self.patternWithoutDelimiter = patternWithoutDelimiter
                self.byte = byte
                self.binary = binary
                self.date = date
                self.dateTime = dateTime
                self.password = password
                self.callback = callback
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(integer, forKey: "integer")
                encoder.encode(int32, forKey: "int32")
                encoder.encode(int64, forKey: "int64")
                encoder.encode(number, forKey: "number")
                encoder.encode(float, forKey: "float")
                encoder.encode(double, forKey: "double")
                encoder.encode(string, forKey: "string")
                encoder.encode(patternWithoutDelimiter, forKey: "pattern_without_delimiter")
                encoder.encode(byte, forKey: "byte")
                encoder.encode(binary, forKey: "binary")
                encoder.encode(date, forKey: "date")
                encoder.encode(dateTime, forKey: "dateTime")
                encoder.encode(password, forKey: "password")
                encoder.encode(callback, forKey: "callback")
                return encoder.items
            }
        }

        /// To test "client" model
        public func patch(_ body: edgecases_rename_properties.Client) -> Request<edgecases_rename_properties.Client> {
            Request(method: "PATCH", url: path, body: body, id: "testClientModel")
        }
    }
}
