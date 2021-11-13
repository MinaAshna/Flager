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
                NavigationLink(destination: FilterView()) {
                    HStack(spacing: 2) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.black)
                        Text("Filters")
                            .foregroundColor(.black)
                    }
                    .padding(8)
                    .background(Color(red: 230/255, green: 230/255, blue: 218/233)).cornerRadius(18)
                }
                .padding()
                .frame(width: .infinity, height: 50, alignment: .leading)

                List(flagsViewModel.flags) { flag in
                    Text(flag.countryCode)
                }
            }
            .navigationTitle("Flager")
        }
        .background(Color.yellow)
    }
}

struct FlagView_Previews: PreviewProvider {
    class DummyEventHandler: FlagEventHandler {
    }

    static var previews: some View {
        let flagsViewModel = FlagsViewModel(flags: [Flag(countryCode: "DK", colors: [.red, .white], hasSymbol: false)])
        FlagView(flagsViewModel: flagsViewModel,
                 eventHandler: DummyEventHandler())
    }
}

