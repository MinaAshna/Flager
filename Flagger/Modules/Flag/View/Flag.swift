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
    var colors: [String]
    let circles: Int
    let crosses: Int
    var text: Bool
    var symbol: Bool
    let imageName: String
}
