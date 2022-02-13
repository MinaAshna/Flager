//
//  NumberFieldView.swift
//  Flagger
//
//  Created by Mina Ashna on 13/02/2022.
//

import SwiftUI

struct NumberFieldView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var flagsListViewModel: FlagsListViewModel
    var title: String
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding([.top, .bottom], 8)
            TextField(placeholder, text: $value)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(colorScheme == .light ? .black.opacity(0.2) : Color.gray, lineWidth: 1)
                        .keyboardType(.numberPad)
                )
        }
    }
}

struct NumberFieldView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])

        Group {
            NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of bars", placeholder: "Bars", value: .constant("11"))
                .preferredColorScheme(.light)

            NumberFieldView(flagsListViewModel: flagsListViewModel, title: "Number of bars", placeholder: "Bars", value: .constant("11"))
                .preferredColorScheme(.dark)
        }
    }
}
