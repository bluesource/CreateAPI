// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Settings.Billing {
    public var advancedSecurity: AdvancedSecurity {
        AdvancedSecurity(path: path + "/advanced-security")
    }

    public struct AdvancedSecurity {
        /// Path: `/enterprises/{enterprise}/settings/billing/advanced-security`
        public let path: String

        /// Get GitHub Advanced Security active committers for an enterprise
        ///
        /// Gets the GitHub Advanced Security active committers for an enterprise per repository.
        /// Each distinct user login across all repositories is counted as a single Advanced Security seat, so the total_advanced_security_committers is not the sum of active_users for each repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/billing#export-advanced-security-active-committers-data-for-enterprise)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<OctoKit.AdvancedSecurityActiveCommitters> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "billing/get-github-advanced-security-billing-ghe")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
