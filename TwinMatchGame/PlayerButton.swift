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
       
        Button(action: onSelect) {
            Rectangle()
                .fill(color)
                .frame(minWidth: 60)
                .overlay(
                    Text(String(score))
                        .fixedSize()
                        .foregroundColor(.white)
                        .font(.system(size: 48).bold())
                )
        }
        .disabled(gameState != .waiting)
    }
}

#Preview {
    PlayerButton(gameState: .waiting, score: 5, color: .blue) {
        
    }
}
