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
        
        if isGameActive {
            ContentView(itemCount: items, ansTime: timeOut, isGameActive: $isGameActive)
        } else {
            VStack(spacing: 10) {
                Text("Twin Match Game")
                    .frame(maxWidth: 400)
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .frame(height: 20)
                    .font(.largeTitle.bold())
                    .fontDesign(.rounded)
                    .padding()
                    .padding(.top, 28)
                
                Text("Answer Time")
                    .font(.title2)
                    .padding(.top)
                
                Picker("Timeout", selection: $timeOut) {
                    Text("Slow").tag(3.0)
                    Text("Medium").tag(2.0)
                    Text("Fast").tag(1.0)
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                Text("Difficulty")
                    .font(.title3)
              
            }
        }
    }
}

#Preview {
    MenuView()
}
