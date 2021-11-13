//
//  ContentView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        let flagsViewModel = FlagsViewModel(flags: FlagData().flags)
        FlagView(flagsViewModel: flagsViewModel,
                 eventHandler: FlagPresenter(viewModel: flagsViewModel))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
