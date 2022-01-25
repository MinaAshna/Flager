//
//  ContentView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 0, stripes: 0, colors: [], circles: 0, crosses: 0, text: false, symbol: false, imageName: "")
        let flagsListViewModel = FlagsListViewModel(flag: flag, flagsList: FlagData().flags)
        FlagView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
