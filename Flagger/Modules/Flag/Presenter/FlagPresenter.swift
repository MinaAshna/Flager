//
//  FlagPresenter.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagPresenter {
    weak var flagsViewModel: FlagsViewModel?

    init(viewModel: FlagsViewModel) {
        flagsViewModel = viewModel
    }
}

extension FlagPresenter {
    func flags(withColors colors: [FlagColors]) -> [FlagViewModel] {
        return flagsViewModel?.flags.filter { $0.colors.contains(colors) } ?? []
    }

    func onColorsSelected(_ colors: [FlagColors]) {
        flagsViewModel?.selectedFlags = flags(withColors: colors)
    }
}

extension FlagPresenter: FlagEventHandler {
    
}

public extension Sequence where Element : Hashable {
    func contains(_ elements: [Element]) -> Bool {
        return Set(elements).isSubset(of:Set(self))
    }
}
