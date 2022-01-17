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
}

class FlagsViewModel: ObservableObject, Identifiable {
    @Published var flags: [FlagViewModel] = []
    @Published var selectedFlags: [FlagViewModel] = []

    init(flags: [Flag]) {
        self.flags = flags.map { FlagViewModel(flag: $0) }
        self.selectedFlags = self.flags
    }
}
