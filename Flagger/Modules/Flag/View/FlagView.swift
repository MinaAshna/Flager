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
    @State private var allFilteresTapped = false
    var eventHandler: FlagEventHandler


    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
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
        .padding(0)
        .sheet(isPresented: $allFilteresTapped) {
            FilterView(flagsListViewModel: flagsListViewModel,
                       eventHandler: eventHandler)
        }
    }
}

struct FlagView_Previews: PreviewProvider {
    class DummyEventHandler: FlagEventHandler {
        func filterFlags() {
            
        }
    }

    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, traingle: 1, text: false, symbol: true, imageName: "DK")
        let flagsListViewModel = FlagsListViewModel(flagsList: [flag])
        FlagView(flagsListViewModel: flagsListViewModel,
                 eventHandler: DummyEventHandler())
    }
}

