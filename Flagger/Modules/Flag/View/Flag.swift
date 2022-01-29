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
    let saltires: Int
    let quarters: Int
    let sunstars: Int
    let crescent: Int
    let traingle: Int
    var text: Bool
    var symbol: Bool
    let imageName: String
}

class FlagViewModel: ObservableObject {
    @Published var country: String?
    @Published var continent: String?
    @Published var zone: String?
    @Published var bars: Int?
    @Published var stripes: Int?
    @Published var colors: Set<String>?
    @Published var circles: Int?
    @Published var crosses: Int?
    @Published var saltires: Int?
    @Published var quarters: Int?
    @Published var sunstars: Int?
    @Published var crescent: Int?
    @Published var traingle: Int?
    @Published var text: Bool?
    @Published var symbol: Bool?
    @Published var imageName: String?
}
