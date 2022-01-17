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

    var colors: Set<String>
    let columns = [
           GridItem(.adaptive(minimum: 90))
       ]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Toggle("Does it have a symbol?", isOn: $hasSymbol)
                    Divider()

                    Toggle("Does it have a text?", isOn: $hasText)

                    Divider()
                    Text("Colors")
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(Array(colors), id: \.self) { item in
                            Text(item)
                        }
                    }
                    .padding(.horizontal)

                    Divider()


                }

            }
            .padding()

            Button("Apply Filters") {

            }
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
//        FilterView(eventHandler: FlagPresenter(viewModel: FlagsViewModel(flags: [])))
        FilterView(colors: ["red", "green", "blue"])
    }
}

