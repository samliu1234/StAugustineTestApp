//
//  Settings.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2021-03-06.
//

import Foundation

class Settings: ObservableObject {
    
    @Published var counter: Int = 0
    
    func incrementCounter() -> Int {
        counter += 1
        if (counter > 2) {
            return 0
        }
        return counter
    }
    
}
