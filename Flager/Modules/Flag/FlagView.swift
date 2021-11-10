//
//  FlagView.swift
//  Flager
//
//  Created by Mina Ashna on 08/11/2021.
//

import SwiftUI

struct FlagView: View {
    var flags: [FlagViewModel]

    var body: some View {
        List(flags) { flag in
            Text(flag.countryCode)
        }
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        let flagViewModels = [FlagViewModel(flag: Flag(countryCode: "DK", colors: [.red, .white], hasSymbol: false))]
        FlagView(flags: flagViewModels)
    }
}
