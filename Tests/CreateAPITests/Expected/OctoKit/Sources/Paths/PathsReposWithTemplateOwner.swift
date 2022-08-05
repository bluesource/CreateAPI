// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos {
    public func templateOwner(_ templateOwner: String) -> WithTemplateOwner {
        WithTemplateOwner(path: "\(path)/\(templateOwner)")
    }

    public struct WithTemplateOwner {
        /// Path: `/repos/{template_owner}`
        public let path: String
    }
}
