//
//  StAugustineTestAppApp.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI

@main
struct StAugustineTestAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    
    // @StateObject private var settings = Settings()
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView(delegate: appDelegate)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
        
    }
}
