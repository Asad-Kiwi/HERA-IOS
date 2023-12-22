//
//  HeraApp.swift
//  Hera
//
//  Created by KiwiTech on 22/11/23.
//

import SwiftUI

@main
struct HeraApp: App {
    
    var body: some Scene {
        WindowGroup {
                  NavigationView {
                      ContentView()
                  }
                  .navigationBarHidden(true)
              }
    }
}
