//
//  FlagView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var flagsViewModel: FlagsViewModel
    @State private var isShowingDetailView = false
    var eventHandler: FlagEventHandler

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {

                FilterView(eventHandler: eventHandler)
                    .frame(width: 300, height: 200, alignment: .center)

                NavigationLink(destination: Text("More info about the country.")) {
                    List(flagsViewModel.selectedFlags) { flag in
                        Text("\(flag.name) - \(flag.code)")
                    }
                }
            }
            .navigationTitle("Flagger")
        }
        .background(Color.yellow)
    }
}

struct FlagView_Previews: PreviewProvider {
    class DummyEventHandler: FlagEventHandler {
        func flags(withColors colors: [FlagColors]) -> [FlagViewModel] {
            return []
        }

        func onColorsSelected(_ colors: [FlagColors]) {
            
        }
    }

    static var previews: some View {
        let flagsViewModel = FlagsViewModel(flags: [Flag(name: "Denmark", code: "DK", colors: [.red, .white], hasSymbol: false)])
        FlagView(flagsViewModel: flagsViewModel,
                 eventHandler: DummyEventHandler())
    }
}

