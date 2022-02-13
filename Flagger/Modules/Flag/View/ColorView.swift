//
//  ColorView.swift
//  Flagger
//
//  Created by Mina Ashna on 13/02/2022.
//

import SwiftUI

struct ColorView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var flagsListViewModel: FlagsListViewModel
    @State private var colorIsTapped: Bool = false

    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]

    var body: some View {
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
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        let flagViewModel = FlagViewModel(flag: flag)
        let flagsListViewModel = FlagsListViewModel(flagsList: [flagViewModel])

        Group {
            ColorView(flagsListViewModel: flagsListViewModel)
                .preferredColorScheme(.light)
            
            ColorView(flagsListViewModel: flagsListViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
