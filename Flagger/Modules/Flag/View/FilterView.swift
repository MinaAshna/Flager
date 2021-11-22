//
//  FilterView.swift
//  Flager
//
//  Created by Mina Ashna on 13/11/2021.
//

import SwiftUI

struct FilterView: View {
    @State private var hasSymbol = false
    var colors = FlagColors.allCases
    var items = [GridItem(.adaptive(minimum: 40))]
    @State var colorStatus: [FlagColors: Bool] = [.black: false, .green: false, .blue: false, .red: false, .white: false, .yellow: false, .clear: false]
    var eventHandler: FlagEventHandler
    @State var selectedColors = [FlagColors]() {
        didSet {
            eventHandler.onColorsSelected(selectedColors)
        }
    }

    var body: some View {
        ScrollView {
            Text("Choose your filters here!")
            ScrollView(.horizontal) {
                LazyHGrid(rows: items, spacing: 12) {
                    ForEach(colors, id: \.self) { color in
                        Button(color.rawValue) {
                            print("selected")
                            colorStatus[color]?.toggle()
                            if selectedColors.contains(color) {
                                selectedColors = selectedColors.filter { $0 != color}
                            } else {
                                selectedColors.append(color)
                            }
                        }
                        .background(Color(color.color))
                        .frame(width: 48, height: 48)
                        .border(colorStatus[color]! ? Color.black : Color.clear, width: 5)
                    }
                }
            }
            Toggle("Does your flag has a symbol? ", isOn: $hasSymbol)
                .padding()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(eventHandler: FlagPresenter(viewModel: FlagsViewModel(flags: [])))
    }
}
