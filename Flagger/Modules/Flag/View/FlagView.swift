//
//  FlagView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var flagsListViewModel: FlagsListViewModel
    @State private var isShowingDetailView = false
    @State private var showingFilters = false
    var eventHandler: FlagEventHandler


    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                FilterView(flagsListViewModel: flagsListViewModel, eventHandler: eventHandler)
                    .frame(maxHeight: 300)

                Text("\(flagsListViewModel.filteredFlagsList.count) flags found.")
                    .padding()
                NavigationLink(destination: Text("More info about the country.")) {
                    List(flagsListViewModel.filteredFlagsList, id: \.country) { flag in
                        HStack {
                            Image(flag.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 40, alignment: .leading)

                            Text("\(flag.country)")
                        }
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
        func filterFlags() {
            
        }
    }

    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 0, stripes: 0, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 0, crosses: 0, text: false, symbol: false, imageName: "")
        let flagsListViewModel = FlagsListViewModel(flag: flag, flagsList: [flag])
        FlagView(flagsListViewModel: flagsListViewModel,
                 eventHandler: DummyEventHandler())
    }
}

