//
//  FilterView.swift
//  Flager
//
//  Created by Mina Ashna on 13/11/2021.
//

import SwiftUI

struct QuickFilterView: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var hasSymbol = false
    @State private var hasText = false
    @State private var colorIsTapped: Bool = false
    
    @ObservedObject var flagsListViewModel: FlagsListViewModel

    var eventHandler: FlagEventHandler

    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]


    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Toggle("Symbol", isOn: $hasSymbol)
                            .onChange(of: hasSymbol) { _ in
                                flagsListViewModel.symbol = hasSymbol
                            }
                            .padding(.trailing, 8)
                            .padding([.top, .leading], 16)

                        Divider()

                        Toggle("Text", isOn: $hasText)
                            .onChange(of: hasText) { _ in
                                flagsListViewModel.text = hasText
                            }
                            .padding([.top, .leading, .trailing], 16)
                    }
                    Divider()
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
                }

            }
            .padding([.leading, .trailing], 0)
        }
        .padding(.trailing, 0)
    }
}
//
//struct QuickFilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        let flag = Flag(country: "", continent: "", zone: "", bars: 0, stripes: 0, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 0, crosses: 0, text: false, symbol: false, imageName: "")
//        let flagsListViewModel = FlagsListViewModel(flagsList: [flag])
//        QuickFilterView(flagsListViewModel: flagsListViewModel, eventHandler: FlagPresenter(viewModel: flagsListViewModel))
//    }
//}
//
