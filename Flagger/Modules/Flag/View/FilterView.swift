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
    @State private var showMore = false

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

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(colorScheme == .dark ? Color.charcoal : .eggWhite)
                            .shadow(radius: 10)

                        VStack(spacing: 16) {
                            Group {
                                PickerView(flagsListViewModel: flagsListViewModel, title: "Does it have a symbol", placeholder: "Symbol", value: $flagsListViewModel.symbol)

                                PickerView(flagsListViewModel: flagsListViewModel, title: "Does it have a text", placeholder: "Text", value: $flagsListViewModel.text)
                            }
                            .padding([.top, .leading, .trailing], 16)

                            ColorView(flagsListViewModel: flagsListViewModel)

                            if showMore {
                                Group {
                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of bars", placeholder: "Bars", value: $numberOfBars)
                                        .onChange(of: numberOfBars) { newValue in
                                            flagsListViewModel.bars = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of stripes", placeholder: "Stripes", value: $numberOfStripes)
                                        .onChange(of: numberOfStripes) { newValue in
                                            flagsListViewModel.crescent = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of circles", placeholder: "Circles", value: $numberOfCircles)
                                        .onChange(of: numberOfCircles) { newValue in
                                            flagsListViewModel.circles = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of crosses", placeholder: "Crosses", value: $numberOfCrosses)
                                        .onChange(of: numberOfCrosses) { newValue in
                                            flagsListViewModel.crosses = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of saltires", placeholder: "Saltires", value: $numberOfSaltires)
                                        .onChange(of: numberOfSaltires) { newValue in
                                            flagsListViewModel.saltires = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of quarters", placeholder: "Quarters", value: $numberOfQuarters)
                                        .onChange(of: numberOfQuarters) { newValue in
                                            flagsListViewModel.quarters = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of Sunstars", placeholder: "Sunstars", value: $numberOfSunstars)
                                        .onChange(of: numberOfSunstars) { newValue in
                                            flagsListViewModel.sunstars = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of Triangles", placeholder: "Triangles", value: $numberOfTraingle)
                                        .onChange(of: numberOfTraingle) { newValue in
                                            flagsListViewModel.triangle = Int(newValue)
                                        }

                                    NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of Crescent", placeholder: "Crescent", value: $numberOfCrescent)
                                        .onChange(of: numberOfCrescent) { newValue in
                                            flagsListViewModel.crescent = Int(newValue)
                                        }
                                }
                                .padding(.top, 0)
                                .padding([.leading, .trailing], 16)
                            }

                            Button {
                                showMore.toggle()
                            } label: {
                                Text(showMore ? "Show Less" : "Show More")
                                    .foregroundColor(.secondary)
                                    .padding(20)
                            }
                        }
                        .padding(.bottom, 16)
                        .background(colorScheme == .dark ? Color.charcoal : .eggWhite)
                        .cornerRadius(12)
                    }
                    .padding(16)

                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(colorScheme == .dark ? Color.charcoal : .eggWhite)
                            .shadow(radius: 10)

                        VStack(spacing: 0) {
                            NavigationLink("Find", destination: FlagView(flagsListViewModel: flagsListViewModel, eventHandler: eventHandler))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .font(.title)
                                .frame(height: 30)
                                .padding(8)

                            Text("\(flagsListViewModel.filteredFlagsList.count)")
                                .foregroundColor(colorScheme == .light ? .gray : .secondary)
                                .font(.subheadline)
                                .frame(height: 18)
                                .padding(8)
                        }
                    }
                    .padding(.top, 8)
                    .padding([.leading, .trailing], 16)
                }
                .padding([.leading, .trailing], 0)
            }
            .padding(.top, 16)
            .padding(.trailing, 0)
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
            .navigationTitle("Flagger")
        }
        .accentColor(colorScheme == .light ? .black : .white)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {

        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])

        Group {
            FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
                .preferredColorScheme(.light)

            FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
                .preferredColorScheme(.dark)
        }
    }
}
