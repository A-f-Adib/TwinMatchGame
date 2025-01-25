//
//  ContentView.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 25/1/25.
//

import SwiftUI

enum GameState {
    case waiting
    case player1Answering
    case player2Answering
}


struct ContentView: View {
    
    let allEmoji = Array("😎🥹🥰😔😂😳🧐🙂😇😅😆😙😬🙃😍🥸😣😶🙄🤨😩😉🥲😋😛🤓😏😭😯😵😐😘😢😠").map(String.init)
    
    @State private var currentEmoji = [String]()
    @State private var leftCard = [String]()
    @State private var rightCard = [String]()
    
    @State private var gameState = GameState.waiting
    @State private var player1Score = 0
    @State private var player2Score = 0
    
    var itemCount: Int
    
    var body: some View {
       
        HStack(spacing: 0) {
            ZStack {
                if leftCard.isEmpty == false {
                    HStack {
                        CardView(card: leftCard)
                        CardView(card: rightCard)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.9))
        .persistentSystemOverlays(.hidden)
        .onAppear(perform: createLevel)
    }
    
    
    func createLevel() {
        currentEmoji = allEmoji.shuffled()
        
        withAnimation(.spring(duration: 0.75)) {
            leftCard = Array(currentEmoji[0..<itemCount])//.shuffled()
            rightCard = Array(currentEmoji[itemCount + 1..<itemCount + itemCount] + [currentEmoji[0]])//.shuffled()
        }
    }
}

#Preview {
    ContentView(itemCount: 9)
}
