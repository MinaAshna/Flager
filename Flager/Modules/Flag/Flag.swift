//
//  Flag.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import Foundation

struct Flag: Decodable {
    let countryCode: String
    let colors: [FlagColors]
    let hasSymbol: Bool
}

enum FlagColors: Decodable {
    case white
    case red
}
