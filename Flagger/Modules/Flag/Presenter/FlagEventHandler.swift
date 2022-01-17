//
//  FlagEventHandler.swift
//  Flager
//
//  Created by Mina Ashna on 10/11/2021.
//

import Foundation

protocol FlagEventHandler {
    func flags(withColors colors: [String]) -> [FlagViewModel]
    func onColorsSelected(_ colors: [String])
}
