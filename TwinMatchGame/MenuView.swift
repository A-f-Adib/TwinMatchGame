//
//  MenuView.swift
//  TwinMatchGame
//
//  Created by A.F. Adib on 27/1/25.
//

import SwiftUI

struct MenuView: View {
    
    @State private var timeOut = 1.0
    @State private var items = 9
    @State private var isGameActive = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MenuView()
}
