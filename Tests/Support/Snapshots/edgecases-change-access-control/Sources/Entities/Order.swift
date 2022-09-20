// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct Order: Codable {
    var id: Int64?
    var petID: Int64?
    var quantity: Int32?
    var shipDate: Date?
    /// Order Status
    var status: Status?
    var isComplete: Bool

    /// Order Status
    enum Status: String, Codable, CaseIterable {
        case placed
        case approved
        case delivered
    }

    init(id: Int64? = nil, petID: Int64? = nil, quantity: Int32? = nil, shipDate: Date? = nil, status: Status? = nil, isComplete: Bool? = nil) {
        self.id = id
        self.petID = petID
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
        self.isComplete = isComplete ?? false
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int64.self, forKey: "id")
        self.petID = try values.decodeIfPresent(Int64.self, forKey: "petId")
        self.quantity = try values.decodeIfPresent(Int32.self, forKey: "quantity")
        self.shipDate = try values.decodeIfPresent(Date.self, forKey: "shipDate")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
        self.isComplete = try values.decodeIfPresent(Bool.self, forKey: "complete") ?? false
    }

    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(petID, forKey: "petId")
        try values.encodeIfPresent(quantity, forKey: "quantity")
        try values.encodeIfPresent(shipDate, forKey: "shipDate")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(isComplete, forKey: "complete")
    }
}
