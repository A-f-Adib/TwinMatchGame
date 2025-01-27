//
//  CardView.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 25/1/25.
//

import SwiftUI

struct CardView: View {
    
    var card : [String]
    var rows: Int {
        if card.count == 12 {
            4
        } else {
            3
        }
    }
    var userCanAns: Bool
    var onSelect: (String) -> Void
    
    
    var body: some View {
        
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(0..<rows, id: \.self) { i in
                GridRow {
                    ForEach(0..<3) { j in
                        let text = card[i * 3 + j]
                        
                        Button(text) {
                            onSelect(text)
                        }
                    }
                }
            }
        }
        .font(.system(size: 64))
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
        .fixedSize()
        .shadow(radius: 10)
        .disabled(userCanAns == false)
        .transition(.push(from: .top))
        .id(card)
    }
}

#Preview {
    CardView(card: ["1", "2", "3", "4", "5", "6", "7", "8", "9"], userCanAns: true) { _ in }
}
