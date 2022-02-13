//
//  FlagView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var flagsListViewModel: FlagsListViewModel
    var eventHandler: FlagEventHandler


    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List(flagsListViewModel.filteredFlagsList, id: \.country) { flag in
                NavigationLink(destination: FlagDetailsView(flag: flag)) {
                    HStack {
                        Image(flag.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 40, alignment: .leading)

                        Text("\(flag.country.countryName)")
                    }
                }
            }
        }
        .padding(0)
        .navigationTitle("")
    }
}

struct FlagView_Previews: PreviewProvider {
    class DummyEventHandler: FlagEventHandler {
        func filterFlags() {
            
        }
    }

    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])
        
        FlagView(flagsListViewModel: flagsListViewModel,
                 eventHandler: DummyEventHandler())
    }
}

