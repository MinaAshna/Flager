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

    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]

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
                                VStack(alignment: .leading, spacing: 16) {
                                    Text("Does it have a symbol")
                                    Picker("Symbol", selection: $flagsListViewModel.symbol) {
                                        ForEach(SelectionValue.allCases) { value in
                                            Text(value.description)
                                                .tag(value)
                                        }
                                    }
                                    .pickerStyle(.segmented)
                                }
                                .padding([.top, .leading, .trailing], 16)
                            }

                            VStack(alignment: .leading, spacing: 16) {
                                Text("Does it have a text")
                                Picker("Text", selection: $flagsListViewModel.text) {
                                    ForEach(SelectionValue.allCases) { value in
                                        Text(value.description)
                                            .tag(value)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                            .padding(16)

                            VStack(alignment: .leading) {
                                Text("Colors")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
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
                                                ZStack {
                                                    Circle()
                                                        .stroke(colorScheme == .light ? Color.black : .white,
                                                                lineWidth: 3)
                                                        .background(Circle().fill(Color("\(item.components(separatedBy: ".")[1])").opacity(1)))
                                                        .frame(width: 48, height: 48)
                                                    if flagsListViewModel.colors.contains(item) {
                                                        Image(systemName: "checkmark")
                                                            .resizable()
                                                            .tint(.green)
                                                            .font(Font.title.weight(.medium))
                                                            .frame(width: 20, height: 20, alignment: .center)
                                                    }
                                                }
                                            }
                                            .padding()
                                        }
                                    }
                                    .padding(.trailing, 0)
                                }
                                .frame(height: 55)
                            }

                            if showMore {
                                Group {
                                    VStack(alignment: .leading) {
                                        Text("Number of bars")
                                            .padding([.top, .bottom], 8)
                                        TextField("Bars", text: $numberOfBars)
                                            .onChange(of: numberOfBars) { newValue in
                                                flagsListViewModel.bars = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }
                                    VStack(alignment: .leading) {
                                        Text("Number of stripes")
                                            .padding([.top, .bottom], 8)
                                        TextField("Stripes", text: $numberOfStripes)
                                            .onChange(of: numberOfStripes) { newValue in
                                                flagsListViewModel.stripes = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : .gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
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
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of crosses")
                                            .padding([.top, .bottom], 8)
                                        TextField("Crosses", text: $numberOfCrosses)
                                            .onChange(of: numberOfCrosses) { newValue in
                                                flagsListViewModel.crosses = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of Saltires")
                                            .padding([.top, .bottom], 8)
                                        TextField("Saltires", text: $numberOfSaltires)
                                            .onChange(of: numberOfSaltires) { newValue in
                                                flagsListViewModel.saltires = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of Quarters")
                                            .padding([.top, .bottom], 8)
                                        TextField("Quarters", text: $numberOfQuarters)
                                            .onChange(of: numberOfQuarters) { newValue in
                                                flagsListViewModel.quarters = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of Sunstars")
                                            .padding([.top, .bottom], 8)
                                        TextField("Sunstars", text: $numberOfSunstars)
                                            .onChange(of: numberOfSunstars) { newValue in
                                                flagsListViewModel.sunstars = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of Triangles")
                                            .padding([.top, .bottom], 8)
                                        TextField("Quarters", text: $numberOfTraingle)
                                            .onChange(of: numberOfTraingle) { newValue in
                                                flagsListViewModel.triangle = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
                                    }

                                    VStack(alignment: .leading) {
                                        Text("Number of Crescent")
                                            .padding([.top, .bottom], 8)
                                        TextField("Quarters", text: $numberOfCrescent)
                                            .onChange(of: numberOfCrescent) { newValue in
                                                flagsListViewModel.crescent = Int(newValue)
                                            }
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                                                    .keyboardType(.numberPad)
                                            )
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
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {

        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])

        FilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
    }
}
