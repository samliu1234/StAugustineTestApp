//
//  StAugustineTestAppApp.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI

@main
struct StAugustineTestAppApp: App {
    let persistenceController = PersistenceController.shared
    
    // @StateObject private var database = Database()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            //AppView().environmentObject(database)
        }
    }
}
