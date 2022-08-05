// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct Cat: Codable {
    var animal: Animal
    var isDeclawed: Bool?

    init(animal: Animal, isDeclawed: Bool? = nil) {
        self.animal = animal
        self.isDeclawed = isDeclawed
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.animal = try Animal(from: decoder)
        self.isDeclawed = try values.decodeIfPresent(Bool.self, forKey: "declawed")
    }

    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(animal, forKey: "animal")
        try values.encodeIfPresent(isDeclawed, forKey: "declawed")
    }
}
