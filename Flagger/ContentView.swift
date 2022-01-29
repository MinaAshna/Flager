//
//  ContentView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let flagsListViewModel = FlagsListViewModel(flagsList: FlagData().flags)
        FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
