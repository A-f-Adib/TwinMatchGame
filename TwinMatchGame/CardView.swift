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
    
    
    var body: some View {
        
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(0..<rows, id: \.self) { i in
                GridRow {
                    ForEach(0..<3) { j in
                        let text = card[i * 3 * j]
                        
                        Button(text) {
                            
                        }
                    }
                }
            }
        }
        .font(.system(size: 64))
        .padding()
        .background(.white)
    }
}

#Preview {
    CardView(card: <#[String]#>)
}
