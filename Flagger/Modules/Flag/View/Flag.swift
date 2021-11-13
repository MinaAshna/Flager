//
//  Flag.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

struct Flag: Decodable {
    let name: String
    let code: String
    let colors: [FlagColors]
    let hasSymbol: Bool
}

enum FlagColors: String, Decodable {
    case white
    case red
    case yellow
    case blue
    case black
    case green
}
