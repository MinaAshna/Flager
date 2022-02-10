//
//  FlagDetailsView.swift
//  Flagger
//
//  Created by Mina Ashna on 10/02/2022.
//

import SwiftUI

struct FlagDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    var flag: FlagViewModel

    var body: some View {
        VStack(spacing: 8) {
            Image(flag.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: colorScheme == .light ? .black : .white, radius: 4)
                .padding()

            Text("\(flag.country.countryName)")
                .font(.title)

            Spacer()
        }
    }
}

struct FlagDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")
        FlagDetailsView(flag: FlagViewModel(flag: flag))
    }
}
