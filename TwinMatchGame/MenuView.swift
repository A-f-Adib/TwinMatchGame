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
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .frame(height: 20)
                    .font(.largeTitle.bold())
                    .fontDesign(.rounded)
                    .padding()
                    .padding(.top, 15)
                
                Text("Answer Time")
                    .foregroundStyle(Color.white)
                    .font(.title2.bold())
                    .padding(.top)
                
                Picker("Timeout", selection: $timeOut) {
                    Text("Slow").tag(3.0)
                    Text("Medium").tag(2.0)
                    Text("Fast").tag(1.0)
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                Text("Difficulty")
                    .foregroundStyle(Color.white)
                    .font(.title2.bold())
                
                Picker("Difficulty", selection: $items) {
                    Text("Easy").tag(9)
                    Text("Hard").tag(12)
                }
                .pickerStyle(.segmented)
                
                Button("Start Game >") {
                    isGameActive = true
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 25)
            }
            .padding()
            .background(Color.cyan.opacity(0.9))
            .clipShape(.rect(cornerRadius: 20))
            .padding(.top, 20)
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.mint.opacity(0.4))
        }
    }
}

#Preview {
    MenuView()
}
