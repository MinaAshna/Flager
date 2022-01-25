//
//  FilterView.swift
//  Flager
//
//  Created by Mina Ashna on 13/11/2021.
//

import SwiftUI

struct FilterView: View {
    @State private var hasSymbol = false
    @State private var hasText = false

    @ObservedObject var flagsListViewModel: FlagsListViewModel

    var eventHandler: FlagEventHandler

    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]


    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Toggle("Does it have a symbol?", isOn: $hasSymbol)
                        .onChange(of: hasSymbol) { _ in
                            flagsListViewModel.symbol = hasSymbol
                        }
                        .padding(.trailing, 8)

                    Divider()

                    Toggle("Does it have a text?", isOn: $hasText)
                        .onChange(of: hasText) { _ in
                            flagsListViewModel.text = hasText
                        }
                        .padding(.trailing, 8)

                    Divider()
                    Text("Colors")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: columns, spacing: 10) {
                            ForEach(Array(flagsListViewModel.availableColors), id: \.self) { item in
                                Button(item) {
                                    if flagsListViewModel.colors.contains(item) == true {
                                        flagsListViewModel.colors.remove(item)
                                    } else {
                                        flagsListViewModel.colors.insert(item)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Divider()


                }

            }
            .padding()
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 0, stripes: 0, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 0, crosses: 0, text: false, symbol: false, imageName: "")
        let flagsListViewModel = FlagsListViewModel(flag: flag, flagsList: [flag])
        FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }
}

