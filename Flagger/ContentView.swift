//
//  ContentView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        let flagsListViewModel = FlagsListViewModel(flagsList: createFlagViewModel(from: FlagData().flags))
        FilterView(flagsListViewModel: flagsListViewModel,
                   eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }

    private func createFlagViewModel(from flags: [Flag]) -> [FlagViewModel] {
        var flagViewModelList: [FlagViewModel] = []
        flags.forEach { flagViewModelList.append(FlagViewModel(flag: $0)) }

        return flagViewModelList
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
