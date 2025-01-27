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
    
    let allEmoji = Array("🚂🚃🚄🚅🚆🚇🚈🚉🚊🚝🚞🚋🚌🚍🚎🚐🚑🚒🚓🚔🚕🚖🚗🚘🚙🛻🚚🚛🚜🏎️🏍️🛵🦽🦼🛺🚲🛴").map(String.init)
    
    @State private var currentEmoji = [String]()
    @State private var leftCard = [String]()
    @State private var rightCard = [String]()
    
    @State private var gameState = GameState.waiting
    @State private var player1Score = 0
    @State private var player2Score = 0
    
    @State private var answerColor = Color.clear
    @State private var answerScale = 1.0
    @State private var answerAnchor = UnitPoint.center
    
    @State private var playerHasWon = false
    
    var itemCount: Int
    var ansTime : Double
    @Binding var isGameActive : Bool
    
    var body: some View {
       
        HStack(spacing: 0) {
            
            PlayerButton(gameState: gameState, score: player1Score, color: .cyan, playerName: 1, onSelect: selectPlayer1)
            
            ZStack {
                answerColor
                    .scaleEffect(x: answerScale, anchor: answerAnchor)
                
                VStack {
                    if leftCard.isEmpty == false {
                        HStack {
                            CardView(card: leftCard, userCanAns: gameState != .waiting, onSelect: checkAns)
                            CardView(card: rightCard, userCanAns: gameState != .waiting, onSelect: checkAns)
                        }
                        .padding(.horizontal, 10)
                    }
                    Button("< End Game") {
                        isGameActive = false
                    }
                    .offset(y: itemCount == 9 ? 20 : 2)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.mini)
                }
            }
            
            PlayerButton(gameState: gameState, score: player2Score, color: .mint, playerName: 2, onSelect: selectPlayer2)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.9))
        .persistentSystemOverlays(.hidden)
        .onAppear(perform: createLevel)
        
        .alert("Game Over", isPresented: $playerHasWon) {
            Button("Start Again") {
                isGameActive = false
            }
        } message: {
            if player1Score > player2Score {
                Text("Player 1 won \(player1Score)-\(player2Score)")
            } else {
                Text("Player 2 won \(player2Score)-\(player1Score)")
            }
        }
    }
    
    
    func createLevel() {
        currentEmoji = allEmoji.shuffled()
        
        withAnimation(.spring(duration: 0.75)) {
            leftCard = Array(currentEmoji[0..<itemCount]).shuffled()
            rightCard = Array(currentEmoji[itemCount + 1..<itemCount + itemCount] + [currentEmoji[0]]).shuffled()
        }
    }
    
    
    func selectPlayer1() {
        guard gameState == .waiting else { return }
        answerColor = .cyan
        answerAnchor = .leading
        gameState = .player1Answering
        runClock()
    }
    
    func selectPlayer2() {
        guard gameState == .waiting else { return }
        answerColor = .mint
        answerAnchor = .trailing
        gameState = .player2Answering
        runClock()
    }
    
    
    func timeOut(for emo: [String]) {
        guard currentEmoji == emo else {
            return
        }
        if gameState == .player1Answering {
            player1Score -= 1
        } else if gameState == .player2Answering {
            player2Score -= 1
        }
        gameState = .waiting
    }
    
    
    func runClock() {
        answerScale = 1
        let checkEmo = currentEmoji
        withAnimation(.linear(duration: ansTime)) {
            answerScale = 0
        } completion: {
            timeOut(for: checkEmo)
        }
    }
    
    
    func checkAns(_ string: String) {
        if string == currentEmoji[0] {
            if gameState == .player1Answering {
                player1Score += 1
            } else if gameState == .player2Answering {
                player2Score += 1
            }
            
            if player1Score == 5 || player2Score == 5 {
                 playerHasWon = true
            } else {
                createLevel()
            }
        } 
        else {
            if gameState == .player1Answering {
                player1Score -= 1
            } else if gameState == .player2Answering {
                player2Score -= 1
            }
        }
        
        answerColor = .clear
        answerScale = 0
        gameState = .waiting
    }
}

#Preview {
    ContentView(itemCount: 9, ansTime: 3, isGameActive: .constant(true))
}
