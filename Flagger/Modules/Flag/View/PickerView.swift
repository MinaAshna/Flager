//
//  PickerView.swift
//  Flagger
//
//  Created by Mina Ashna on 13/02/2022.
//

import SwiftUI

struct PickerView<T>: View where T : Hashable {
    @ObservedObject var flagsListViewModel: FlagsListViewModel
    var title: String
    var placeholder: String
    @Binding var value: T

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
            Picker(placeholder, selection: $value) {
                ForEach(SelectionValue.allCases) { value in
                    Text(value.description)
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])

        Group {
            PickerView(flagsListViewModel: flagsListViewModel, title: "Does it have a symbol", placeholder: "Symbol", value: .constant(SelectionValue.maybe))
                .preferredColorScheme(.light)

            PickerView(flagsListViewModel: flagsListViewModel, title: "Does it have a symbol", placeholder: "Symbol", value: .constant(SelectionValue.maybe))
                .preferredColorScheme(.dark)
        }
    }
}
