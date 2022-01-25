//
//  FlagViewModel.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagsListViewModel: ObservableObject, Identifiable {
    @Published var flagsList: [Flag] = []
    @Published var filteredFlagsList: [Flag] = []

    @Published var country: String
    @Published var continent: String
    @Published var zone: String
    @Published var bars: Int
    @Published var stripes: Int
    @Published var colors: Set<String> {
        didSet {
            updateFlags()
        }
    }
    @Published var circles: Int
    @Published var crosses: Int
    @Published var text: Bool {
        didSet {
            updateFlags()
        }
    }
    @Published var symbol: Bool {
        didSet {
            updateFlags()
        }
    }
    @Published var imageName: String

    lazy var availableColors: Set<String> = {
        return extractColors()
    }()

    init(flag: Flag, flagsList: [Flag]) {
        self.flagsList = flagsList
        self.filteredFlagsList = flagsList
        
        self.country = flag.country
        self.continent = flag.continent
        self.zone = flag.zone
        self.bars = flag.bars
        self.stripes = flag.stripes
        self.colors = Set(flag.colors)
        self.circles = flag.circles
        self.crosses = flag.crosses
        self.text = flag.text
        self.symbol = flag.symbol
        self.imageName = flag.imageName
    }

    private func extractColors() -> Set<String> {
        var colors: Set<String> = []
        flagsList.forEach { colors = colors.union($0.colors) }

        return colors
    }

    private func updateFlags() {
        filteredFlagsList = flagsList.filter {
            $0.text == self.text && $0.symbol == self.symbol
        }
    }
}

//func filterFlags() {
//        var filteredFlags = [FlagViewModel]()
//
//        if let filteredFlag = self.flagsListViewModel?.filteredFlag, let flags = self.flagsListViewModel?.flagsList {
//            flags.forEach {
//                if $0.symbol == filteredFlag.symbol && $0.text == filteredFlag.text && $0.colors.isSubset(of: filteredFlag.colors) {
//                    filteredFlags.append($0)
//                }
//            }
//        } else {
//            filteredFlags = self.flagsListViewModel?.flagsList ?? []
//        }
//
//        flagsListViewModel?.filteredFlags = filteredFlags
//}
