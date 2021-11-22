//
//  Flag.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import SwiftUI

struct Flag: Decodable {
    let name: String
    let code: String
    let colors: [FlagColors]
    let hasSymbol: Bool
}

enum FlagColors: String, Decodable, CaseIterable {
    case white
    case red
    case yellow
    case blue
    case black
    case green
    case clear

    var color: UIColor {
        switch self {
        case .white: return UIColor.white
        case .red: return UIColor.red
        case .yellow: return UIColor.yellow
        case .blue: return UIColor.blue
        case .black: return UIColor.black
        case .green: return UIColor.green
        case .clear: return UIColor.clear
        }
    }
}
