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

extension FlagPresenter: FlagEventHandler {
    
}
