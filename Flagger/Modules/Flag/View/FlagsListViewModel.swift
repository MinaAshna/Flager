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

    @Published var country: String?
    @Published var continent: String?
    @Published var zone: String?
    @Published var bars: Int? {
        didSet {
            updateFlags()
        }
    }
    @Published var stripes: Int = 0 {
        didSet {
            updateFlags()
        }
    }
    @Published var saltires: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var quarters: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var sunstars: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var crescent: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var triangle: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var colors: Set<String> = [] {
        didSet {
            updateFlags()
        }
    }
    @Published var circles: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var crosses: Int = 0  {
        didSet {
            updateFlags()
        }
    }
    @Published var text: Bool = false {
        didSet {
            updateFlags()
        }
    }
    @Published var symbol: Bool = false {
        didSet {
            updateFlags()
        }
    }
    @Published var imageName: String?

    lazy var availableColors: Set<String> = {
        return extractColors()
    }()

    init(flagsList: [Flag]) {
        self.flagsList = flagsList
        self.filteredFlagsList = flagsList
    }

    private func extractColors() -> Set<String> {
        var colors: Set<String> = []
        flagsList.forEach { colors = colors.union($0.colors) }

        return colors
    }

    private func updateFlags() {
        filteredFlagsList = flagsList.filter {
            return $0.text == self.text && $0.symbol == self.symbol && self.colors.isSubset(of: $0.colors) && $0.bars == self.bars && $0.stripes == self.stripes && $0.saltires == self.saltires && $0.quarters == self.quarters && $0.sunstars == self.sunstars && $0.crescent == self.crescent && $0.triangle == self.triangle && $0.circles == self.circles
        }
        print(flagsList.count)
        print(filteredFlagsList.count)
    }
}
