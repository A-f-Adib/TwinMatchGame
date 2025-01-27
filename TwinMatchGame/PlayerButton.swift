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
    var playerName : Int
    var onSelect: () -> Void
   
    
    var body: some View {
       
        Button(action: onSelect) {
            Rectangle()
                .fill(color)
                .frame(minWidth: 60)
                .overlay(
                    VStack {
                        Spacer()
                        Spacer()
                        Text(String(score))
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.system(size: 48).bold())
                       
                        Spacer()
                        
                       
                        Text("Player \(playerName)")
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.title.bold())
                        Spacer()
                    }
                )
        }
        .disabled(gameState != .waiting)
    }
}

#Preview {
    PlayerButton(gameState: .waiting, score: 5, color: .blue, playerName: 1) {
        
    }
}
