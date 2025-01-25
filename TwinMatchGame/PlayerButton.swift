//
//  PlayerButton.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 26/1/25.
//

import SwiftUI

struct PlayerButton: View {
    
    var gameState : GameState
    var score: Int
    var color: Color
    var onSelect: () -> Void
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PlayerButton(gameState: .waiting, score: 5, color: .blue) {
        
    }
}
