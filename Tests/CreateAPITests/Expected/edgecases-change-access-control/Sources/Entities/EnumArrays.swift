// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct EnumArrays: Codable {
    var justSymbol: JustSymbol?
    var arrayEnum: [ArrayEnumItem]?

    enum JustSymbol: String, Codable, CaseIterable {
        case greaterThanOrEqualTo = ">="
        case dollar = "$"
    }

    enum ArrayEnumItem: String, Codable, CaseIterable {
        case fish
        case crab
    }

    init(justSymbol: JustSymbol? = nil, arrayEnum: [ArrayEnumItem]? = nil) {
        self.justSymbol = justSymbol
        self.arrayEnum = arrayEnum
    }

    private enum CodingKeys: String, CodingKey {
        case justSymbol = "just_symbol"
        case arrayEnum = "array_enum"
    }
}
