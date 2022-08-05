// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Search {
    public var code: Code {
        Code(path: path + "/code")
    }

    public struct Code {
        /// Path: `/search/code`
        public let path: String

        /// Search code
        ///
        /// Searches for query terms inside of a file. This method returns up to 100 results [per page](https://docs.github.com/rest/overview/resources-in-the-rest-api#pagination).
        /// 
        /// When searching for code, you can get text match metadata for the file **content** and file **path** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/reference/search#text-match-metadata).
        /// 
        /// For example, if you want to find the definition of the `addClass` function inside [jQuery](https://github.com/jquery/jquery) repository, your query would look something like this:
        /// 
        /// `q=addClass+in:file+language:js+repo:jquery/jquery`
        /// 
        /// This query searches for the keyword `addClass` within a file's contents. The query limits the search to files where the language is JavaScript in the `jquery/jquery` repository.
        /// 
        /// #### Considerations for code search
        /// 
        /// Due to the complexity of searching code, there are a few restrictions on how searches are performed:
        /// 
        /// *   Only the _default branch_ is considered. In most cases, this will be the `master` branch.
        /// *   Only files smaller than 384 KB are searchable.
        /// *   You must always include at least one search term when searching source code. For example, searching for [`language:go`](https://github.com/search?utf8=%E2%9C%93&q=language%3Ago&type=Code) is not valid, while [`amazing
        /// language:go`](https://github.com/search?utf8=%E2%9C%93&q=amazing+language%3Ago&type=Code) is.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/search#search-code)
        public func get(parameters: GetParameters) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: parameters.asQuery, id: "search/code")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var isIncompleteResults: Bool
            public var items: [OctoKit.CodeSearchResultItem]

            public init(totalCount: Int, isIncompleteResults: Bool, items: [OctoKit.CodeSearchResultItem]) {
                self.totalCount = totalCount
                self.isIncompleteResults = isIncompleteResults
                self.items = items
            }

            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case isIncompleteResults = "incomplete_results"
                case items
            }
        }

        public struct GetParameters {
            public var q: String
            public var sort: Sort?
            public var order: Order?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, Codable, CaseIterable {
                case indexed
            }

            public enum Order: String, Codable, CaseIterable {
                case desc
                case asc
            }

            public init(q: String, sort: Sort? = nil, order: Order? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.q = q
                self.sort = sort
                self.order = order
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(q, forKey: "q")
                encoder.encode(sort, forKey: "sort")
                encoder.encode(order, forKey: "order")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
