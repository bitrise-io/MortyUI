//
//  MortyUIApp.swift
//  MortyUI
//
//  Created by Thomas Ricouard on 18/12/2020.
//

import SwiftUI
import UIKit

@main
struct MortyUIApp: App {
    
    // MARK: - Property
    
    let applicationSupport: String = {
        let root = NSSearchPathForDirectoriesInDomains(
            .applicationSupportDirectory,
            .userDomainMask, true
        )[0]
        
        print(root)
        
        return root
    }()
    
    // MARK: - Scene
    
    var body: some Scene {
        return WindowGroup {
            TabbarView()
        }
    }
}
