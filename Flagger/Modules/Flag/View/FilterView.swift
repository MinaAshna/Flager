//
//  FilterView.swift
//  Flagger
//
//  Created by Mina Ashna on 29/01/2022.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var hasSymbol = false
    @State private var hasText = false
    @State private var colorIsTapped: Bool = false


    @State private var numberOfBars: String = ""
    @State private var numberOfStripes: String = ""
    @State private var numberOfCircles: String = ""
    @State private var numberOfCrosses: String = ""
    @State private var numberOfSaltires: String = ""
    @State private var numberOfQuarters: String = ""
    @State private var numberOfSunstars: String = ""
    @State private var numberOfCrescent: String = ""
    @State private var numberOfTraingle: String = ""

    @ObservedObject var flagsListViewModel: FlagsListViewModel

    var eventHandler: FlagEventHandler

    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Tell us about the flag that you're looking for :) ")
                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                            .padding()
                            .font(.title)

                        Toggle("Does it have a symbol", isOn: $hasSymbol)
                            .onChange(of: hasSymbol) { _ in
                                flagsListViewModel.symbol = hasSymbol
                            }
                            .padding([.top, .leading, .trailing], 16)

                        Divider()

                        Toggle("Does it have a text", isOn: $hasText)
                            .onChange(of: hasText) { _ in
                                flagsListViewModel.text = hasText
                            }
                            .padding([.top, .leading, .trailing], 16)

                        Divider()
                        Text("Colors")
                            .foregroundColor(Color.black)
                            .padding(.leading, 16)

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: columns, spacing: 10) {
                                ForEach(Array(flagsListViewModel.availableColors), id: \.self) { item in
                                    Button {
                                        colorIsTapped.toggle()
                                        if flagsListViewModel.colors.contains(item) == true {
                                            flagsListViewModel.colors.remove(item)
                                        } else {
                                            flagsListViewModel.colors.insert(item)
                                        }
                                    } label: {
                                        Text(item)
                                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                                    }
                                    .padding()
                                    .border(Color.gray.opacity(0.3))
                                    .border(flagsListViewModel.colors.contains(item) == true ? (colorScheme == .light ? Color.black : .white) : (colorScheme == .dark ? Color.clear : Color.gray))
                                    .cornerRadius(12)
                                    .clipped()
                                }
                            }
                            .padding(.trailing, 0)
                        }

                        Divider()

                        Group {
                            VStack(alignment: .leading) {
                                Text("Number of bars")
                                    .padding([.top, .bottom], 8)
                                TextField("Bars", text: $numberOfBars)
                                    .onChange(of: numberOfBars) { newValue in
                                        flagsListViewModel.bars = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }
                            VStack(alignment: .leading) {
                                Text("Number of stripes")
                                    .padding([.top, .bottom], 8)
                                TextField("Stripes", text: $numberOfStripes)
                                    .onChange(of: numberOfStripes) { newValue in
                                        flagsListViewModel.stripes = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }
                        }
                        .padding(.top, 0)
                        .padding([.leading, .trailing], 16)

                        Group {
                            VStack(alignment: .leading) {
                                Text("Number of circles")
                                    .padding([.top, .bottom], 8)
                                TextField("Circles", text: $numberOfCircles)
                                    .onChange(of: numberOfCircles) { newValue in
                                        flagsListViewModel.circles = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }

                            VStack(alignment: .leading) {
                                Text("Number of crosses")
                                    .padding([.top, .bottom], 8)
                                TextField("Crosses", text: $numberOfCrosses)
                                    .onChange(of: numberOfCrosses) { newValue in
                                        flagsListViewModel.crosses = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }

                            VStack(alignment: .leading) {
                                Text("Number of Saltires")
                                    .padding([.top, .bottom], 8)
                                TextField("Saltires", text: $numberOfSaltires)
                                    .onChange(of: numberOfSaltires) { newValue in
                                        flagsListViewModel.saltires = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }

                            VStack(alignment: .leading) {
                                Text("Number of Quarters")
                                    .padding([.top, .bottom], 8)
                                TextField("Quarters", text: $numberOfQuarters)
                                    .onChange(of: numberOfCrosses) { newValue in
                                        flagsListViewModel.quarters = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }

                            VStack(alignment: .leading) {
                                Text("Number of Sunstars")
                                    .padding([.top, .bottom], 8)
                                TextField("Sunstars", text: $numberOfSunstars)
                                    .onChange(of: numberOfSunstars) { newValue in
                                        flagsListViewModel.sunstars = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }

                            VStack(alignment: .leading) {
                                Text("Number of Quarters")
                                    .padding([.top, .bottom], 8)
                                TextField("Quarters", text: $numberOfCrescent)
                                    .onChange(of: numberOfCrescent) { newValue in
                                        flagsListViewModel.crescent = Int(newValue)
                                    }
                                    .padding()
                                    .border(Color.black.opacity(0.3), width: 1)
                                    .keyboardType(.numberPad)
                            }
                        }
                        .padding(.top, 0)
                        .padding([.leading, .trailing], 16)
                    }

                    NavigationLink("Find", destination: FlagView(flagsListViewModel: flagsListViewModel, eventHandler: eventHandler))
                }
                .padding([.leading, .trailing], 0)
            }
            .padding(.trailing, 0)
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
            .navigationTitle("Flagger")

        }

    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, traingle: 1, text: false, symbol: true, imageName: "DK")
        let flagsListViewModel = FlagsListViewModel(flagsList: [flag])

        FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }
}
