//
//  ContentView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let flagViewModels: [FlagViewModel] = FlagData().flags.map { FlagViewModel(flag: $0) }
        FlagView(flags: flagViewModels)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
