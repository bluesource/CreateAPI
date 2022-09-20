// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var contributors: Contributors {
        Contributors(path: path + "/contributors")
    }

    public struct Contributors {
        /// Path: `/repos/{owner}/{repo}/contributors`
        public let path: String

        /// List repository contributors
        ///
        /// Lists contributors to the specified repository and sorts them by the number of commits per contributor in descending order. This endpoint may return information that is a few hours old because the GitHub REST API v3 caches contributor data to improve performance.
        /// 
        /// GitHub identifies contributors by author email address. This endpoint groups contribution counts by GitHub user, which includes all associated email addresses. To improve performance, only the first 500 author email addresses in the repository link to GitHub users. The rest will appear as anonymous contributors without associated GitHub user information.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-repository-contributors)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Contributor]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "repos/list-contributors")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var anon: String?
            public var perPage: Int?
            public var page: Int?

            public init(anon: String? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.anon = anon
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(anon, forKey: "anon")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
