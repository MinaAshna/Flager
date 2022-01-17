//
//  FlagViewModel.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagViewModel: ObservableObject, Identifiable {
    init(flag: Flag) {
        country = flag.country
        continent = flag.continent
        zone = flag.zone
        bars = flag.bars
        stripes = flag.stripes
        colors = flag.colors
        circles = flag.circles
        crosses = flag.crosses
        text = flag.text
        symbol = flag.symbol
        imageName = flag.imageName
    }
    
    let id = UUID()

    @Published var country: String
    @Published var continent: String
    @Published var zone: String
    @Published var bars: Int
    @Published var stripes: Int
    @Published var colors: [String]
    @Published var circles: Int
    @Published var crosses: Int
    @Published var text: Bool
    @Published var symbol: Bool
    @Published var imageName: String
}

class FlagsViewModel: ObservableObject, Identifiable {
    @Published var flags: [FlagViewModel] = []
    @Published var selectedFlags: [FlagViewModel] = []
    var colors: Set<String> = []

    init(flags: [Flag]) {
        self.flags = flags.map {
            colors = colors.union($0.colors)
            return FlagViewModel(flag: $0)
        }
        self.selectedFlags = self.flags
    }
}
