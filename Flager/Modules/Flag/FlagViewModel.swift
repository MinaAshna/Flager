//
//  FlagViewModel.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagViewModel: ObservableObject, Identifiable {
    init(flag: Flag) {
        countryCode = flag.countryCode
        colors = flag.colors
        hasSymbol = flag.hasSymbol
    }
    
    let id = UUID()
    
    @Published var countryCode: String
    @Published var colors: [FlagColors]
    @Published var hasSymbol: Bool
}

