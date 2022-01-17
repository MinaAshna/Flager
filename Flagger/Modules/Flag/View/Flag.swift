//
//  Flag.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import SwiftUI

struct Flag: Decodable {
    let country: String
    let continent: String
    let zone: String
    let bars: Int
    let stripes: Int
    let colors: [String]
    let circles: Int
    let crosses: Int
    let text: Bool
    let symbol: Bool
    let imageName: String
}

//enum FlagColors: String, Decodable, CaseIterable {
//    case white = "color.white"
//    case red = "color.red"
//    case yellow = "color.yellow"
//    case blue
//    case black = "color.black"
//    case green = "color.green"
//    case clear
//
//    var color: UIColor {
//        switch self {
//        case .white: return UIColor.white
//        case .red: return UIColor.red
//        case .yellow: return UIColor.yellow
//        case .blue: return UIColor.blue
//        case .black: return UIColor.black
//        case .green: return UIColor.green
//        case .clear: return UIColor.clear
//        }
//    }
//}
