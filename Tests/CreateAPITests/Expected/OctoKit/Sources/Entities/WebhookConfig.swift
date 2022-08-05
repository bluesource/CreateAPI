// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Webhook Configuration
///
/// Configuration object of the webhook
public struct WebhookConfig: Codable {
    /// The URL to which the payloads will be delivered.
    ///
    /// Example: "https://example.com/webhook"
    public var url: URL?
    /// The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
    ///
    /// Example: "json"
    public var contentType: String?
    /// If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
    ///
    /// Example: "********"
    public var secret: String?
    public var insecureSSL: WebhookConfigInsecureSSL?

    public init(url: URL? = nil, contentType: String? = nil, secret: String? = nil, insecureSSL: WebhookConfigInsecureSSL? = nil) {
        self.url = url
        self.contentType = contentType
        self.secret = secret
        self.insecureSSL = insecureSSL
    }

    private enum CodingKeys: String, CodingKey {
        case url
        case contentType = "content_type"
        case secret
        case insecureSSL = "insecure_ssl"
    }
}