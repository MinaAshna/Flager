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
        VStack(spacing: 0) {
            Image(flag.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: colorScheme == .light ? .black : .white, radius: 4)
                .padding()

            HStack {
                Text("Country Name: ")
                    .font(.title2)
                Spacer()
                Text("\(flag.country.countryName)")
                    .font(.body)
            }
            .padding()

            HStack {
                Text("ISO Code: ")
                    .font(.title2)
                Spacer()
                Text("\(flag.country.isoCode)")
                    .font(.body)

            }
            .padding()

            Spacer()
        }
    }
}

struct FlagDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let flag = Flag(country: "country.dk", continent: "", zone: "", bars: 2, stripes: 1, colors: ["red", "blue", "green", "white", "black", "yellow", "brown", "purple"], circles: 3, crosses: 7, saltires: 2, quarters: 1, sunstars: 3, crescent: 3, triangle: 1, text: false, symbol: true, imageName: "DK")

        Group {
            FlagDetailsView(flag: FlagViewModel(flag: flag))
                .preferredColorScheme(.light)

            FlagDetailsView(flag: FlagViewModel(flag: flag))
                .preferredColorScheme(.dark)
        }
    }
}
