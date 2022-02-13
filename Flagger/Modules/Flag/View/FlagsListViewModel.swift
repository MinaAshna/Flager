//
//  FlagViewModel.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagsListViewModel: ObservableObject, Identifiable {
    @Published var flagsList: [FlagViewModel] = []
    @Published var filteredFlagsList: [FlagViewModel] = []

    @Published var country: Country?
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
    @Published var text: SelectionValue = .maybe {
        didSet {
            updateFlags()
        }
    }
    @Published var symbol: SelectionValue = .maybe {
        didSet {
            updateFlags()
        }
    }
    @Published var imageName: String?

    lazy var availableColors: [String] = {
        return extractColors()
    }()

    init(flagsList: [FlagViewModel]) {
        self.flagsList = flagsList
        self.filteredFlagsList = flagsList
    }

    private func extractColors() -> [String] {
        var colors: Set<String> = []
        flagsList.forEach { colors = colors.union($0.colors) }

        return Array(colors)
    }

    private func updateFlags() {
        self.filteredFlagsList = self.flagsList


        switch self.text {
        case .yes:
            filteredFlagsList = filteredFlagsList.filter { $0.text == .yes }
        case .no:
            filteredFlagsList = filteredFlagsList.filter { $0.text == .no }
        case .maybe:
            break
        }

        switch self.symbol {
        case .yes:
            filteredFlagsList = filteredFlagsList.filter { $0.symbol == .yes }
        case .no:
            filteredFlagsList = filteredFlagsList.filter { $0.symbol == .no }
        case .maybe:
            break
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
