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
    
    var itemCount: Int
    
    var body: some View {
        VStack {
           
            
        }
        .padding()
    }
    
    func createLevel() {
        currentEmoji = allEmoji.shuffled()
        
        withAnimation(.spring(duration: 0.75)) {
            leftCard = Array(currentEmoji[0..<itemCount]).shuffled()
            rightCard = Array(currentEmoji[itemCount + 1..<itemCount + itemCount])
        }
    }
}

#Preview {
    ContentView(itemCount: 9)
}
