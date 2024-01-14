//
//  Top5App.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI

@main
struct TheTopFiveApp: App {
    
    /*
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    if launchedBefore {
        NavigationStack {
            ContentView()
        }
    } else {
        OverallPickRanking()
    }
     */
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
