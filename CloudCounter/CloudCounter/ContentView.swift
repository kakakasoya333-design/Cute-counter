//
//  ContentView.swift
//  CloudCounter
//
//  Created by Surasak Phetmanee on 17/02/2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model: CounterModel = CounterModel()
    
    var body: some View {
        ZStack{
            WaterBackground()
            
            VStack(spacing: 16) {
                
                Text("Cute Counter")
                    .font(.title)
                    .bold()
                
                Text("\(model.value)")
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                
                Text(model.isEven() ? "Even 🐶✨" : "Odd 🐥🌸")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(model.isEven() ? Color.blue.opacity(0.2) : Color.yellow.opacity(0.25))
                    .cornerRadius(20)
                
                HStack(spacing: 12) {
                    
                    Button("−1") {
                        model.decrement()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("+1") {
                        model.increment()
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Button("Reset") {
                    model.reset()
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}
        
