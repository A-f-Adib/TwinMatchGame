//
//  TwinMatchGameApp.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 25/1/25.
//

import SwiftUI

@main
struct TwinMatchGameApp: App {
    var body: some Scene {
        WindowGroup {
           MenuView()
                .preferredColorScheme(.light)
        }
    }
}
