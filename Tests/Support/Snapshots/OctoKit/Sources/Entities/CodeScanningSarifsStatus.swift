// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CodeScanningSarifsStatus: Codable {
    /// `pending` files have not yet been processed, while `complete` means results from the SARIF have been stored. `failed` files have either not been processed at all, or could only be partially processed.
    public var processingStatus: ProcessingStatus?
    /// The REST API URL for getting the analyses associated with the upload.
    public var analysesURL: URL?
    /// Any errors that ocurred during processing of the delivery.
    public var errors: [String]?

    /// `pending` files have not yet been processed, while `complete` means results from the SARIF have been stored. `failed` files have either not been processed at all, or could only be partially processed.
    public enum ProcessingStatus: String, Codable, CaseIterable {
        case pending
        case complete
        case failed
    }

    public init(processingStatus: ProcessingStatus? = nil, analysesURL: URL? = nil, errors: [String]? = nil) {
        self.processingStatus = processingStatus
        self.analysesURL = analysesURL
        self.errors = errors
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.processingStatus = try values.decodeIfPresent(ProcessingStatus.self, forKey: "processing_status")
        self.analysesURL = try values.decodeIfPresent(URL.self, forKey: "analyses_url")
        self.errors = try values.decodeIfPresent([String].self, forKey: "errors")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(processingStatus, forKey: "processing_status")
        try values.encodeIfPresent(analysesURL, forKey: "analyses_url")
        try values.encodeIfPresent(errors, forKey: "errors")
    }
}
