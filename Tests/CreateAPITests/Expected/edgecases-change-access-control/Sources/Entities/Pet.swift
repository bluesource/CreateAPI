// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct Pet: Codable {
    var id: Int?
    var category: Category?
    /// Example: "doggie"
    var name: String
    var photoURLs: [String]
    var tags: [Tag]?
    /// Pet status in the store
    var status: Status?

    /// Pet status in the store
    enum Status: String, Codable, CaseIterable {
        case available
        case pending
        case sold
    }

    init(id: Int? = nil, category: Category? = nil, name: String, photoURLs: [String], tags: [Tag]? = nil, status: Status? = nil) {
        self.id = id
        self.category = category
        self.name = name
        self.photoURLs = photoURLs
        self.tags = tags
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case category
        case name
        case photoURLs = "photoUrls"
        case tags
        case status
    }
}
