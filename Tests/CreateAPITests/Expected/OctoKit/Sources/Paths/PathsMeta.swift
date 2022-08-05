// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var meta: Meta {
        Meta(path: "/meta")
    }

    public struct Meta {
        /// Path: `/meta`
        public let path: String

        /// Get GitHub meta information
        ///
        /// Returns meta information about GitHub, including a list of GitHub's IP addresses. For more information, see "[About GitHub's IP addresses](https://help.github.com/articles/about-github-s-ip-addresses/)."
        /// 
        /// **Note:** The IP addresses shown in the documentation's response are only example values. You must always query the API directly to get the latest list of IP addresses.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/meta#get-github-meta-information)
        public var get: Request<OctoKit.APIOverview> {
            Request(method: "GET", url: path, id: "meta/get")
        }
    }
}
