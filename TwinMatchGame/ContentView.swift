//
//  ContentView.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 25/1/25.
//

import SwiftUI

struct ContentView: View {
    
    let allEmoji = Array("😎🥹🥰😔😂😳🧐🙂😇😅😆😙😬🙃😍🥸😣😶🙄🤨😩😉🥲😋😛🤓😏😭😯😵😐😘😢😠").map(String.init)
    
    @State private var currentEmoji = [String]()
    @State private var leftCard = [String]()
    @State private var rightCard = [String]()
    
    
    var body: some View {
        VStack {
           
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
