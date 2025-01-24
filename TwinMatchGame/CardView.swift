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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardView(card: <#[String]#>)
}
