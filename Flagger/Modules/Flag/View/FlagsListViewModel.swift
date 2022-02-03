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
    @Published var stripes: Int? {
        didSet {
            updateFlags()
        }
    }
    @Published var saltires: Int?  {
        didSet {
            updateFlags()
        }
    }
    @Published var quarters: Int?  {
        didSet {
            updateFlags()
        }
    }
    @Published var sunstars: Int?  {
        didSet {
            updateFlags()
        }
    }
    @Published var crescent: Int?  {
        didSet {
            updateFlags()
        }
    }
    @Published var triangle: Int?  {
        didSet {
            updateFlags()
        }
    }
    @Published var colors: Set<String> = [] {
        didSet {
            updateFlags()
        }
    }
    @Published var circles: Int? {
        didSet {
            updateFlags()
        }
    }
    @Published var crosses: Int? {
        didSet {
            updateFlags()
        }
    }
    @Published var text: Bool? {
        didSet {
            updateFlags()
        }
    }
    @Published var symbol: Bool? {
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
        self.filteredFlagsList = self.flagsList
        
        if self.text != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.text == self.text
            }
        }

        if self.symbol != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.symbol == self.symbol
            }
        }

        if self.bars != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.bars == self.bars
            }
        }

        if self.stripes != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.stripes == self.stripes
            }
        }

        if self.saltires != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.saltires == self.saltires
            }
        }

        if self.quarters != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.quarters == self.quarters
            }
        }

        if self.sunstars != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.sunstars == self.sunstars
            }
        }

        if self.crescent != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.crescent == self.crescent
            }
        }

        if self.triangle != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.triangle == self.triangle
            }
        }

        if self.circles != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.circles == self.circles
            }
        }

        if self.crosses != nil {
            filteredFlagsList = filteredFlagsList.filter {
                return $0.crosses == self.crosses
            }
        }

        if !self.colors.isEmpty {
            filteredFlagsList = filteredFlagsList.filter {
                return self.colors.isSubset(of: $0.colors)
            }
        }

        print(flagsList.count)
        print(filteredFlagsList.count)
    }
}
