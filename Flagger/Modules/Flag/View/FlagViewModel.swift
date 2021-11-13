//
//  FlagViewModel.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

class FlagViewModel: ObservableObject, Identifiable {
    init(flag: Flag) {
        name = flag.name
        code = flag.code
        colors = flag.colors
        hasSymbol = flag.hasSymbol
    }
    
    let id = UUID()

    @Published var name: String
    @Published var code: String
    @Published var colors: [FlagColors]
    @Published var hasSymbol: Bool
}

class FlagsViewModel: ObservableObject, Identifiable {
    @Published var flags: [FlagViewModel] = []

    init(flags: [Flag]) {
        self.flags = flags.map { FlagViewModel(flag: $0) }
    }
}
