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
    @State private var showingFilters = false
    var eventHandler: FlagEventHandler


    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    Image(systemName: "slider.horizontal.3")
                    Button("Filters") {
                        showingFilters.toggle()
                    }
                    .sheet(isPresented: $showingFilters) {
                        FilterView(colors: flagsViewModel.colors)
                    }
                }
                .frame(width: 80, height: 40, alignment: .center)
                .background(Color(red: 242/255, green: 242/255, blue: 247/255))
                .cornerRadius(10)
                .padding()
                .foregroundColor(.black)

                NavigationLink(destination: Text("More info about the country.")) {
                    List(flagsViewModel.selectedFlags) { flag in
                        Text("\(flag.country)")
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
        func flags(withColors colors: [String]) -> [FlagViewModel] {
            return []
        }

        func onColorsSelected(_ colors: [String]) {

        }
    }

    static var previews: some View {
        let flagsViewModel = FlagsViewModel(flags: [])
        FlagView(flagsViewModel: flagsViewModel,
                 eventHandler: DummyEventHandler())
    }
}

