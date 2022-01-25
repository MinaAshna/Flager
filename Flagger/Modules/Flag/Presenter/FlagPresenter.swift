//
//  FlagPresenter.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation


class FlagPresenter {
    weak var flagsListViewModel: FlagsListViewModel?

    init(viewModel: FlagsListViewModel) {
        flagsListViewModel = viewModel
    }

}

extension FlagPresenter: FlagEventHandler {
}

public extension Sequence where Element : Hashable {
    func contains(_ elements: [Element]) -> Bool {
        return Set(elements).isSubset(of:Set(self))
    }
}
