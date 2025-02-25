//
//  ContentView.swift
//  ReOrderingGridV2
//
//  Created by Sukumar.Sukumaran on 25/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, . black, .indigo, .cyan, .brown, .mint, .orange]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                            .frame(height: 100)
                    }
                    
                }
                .padding(15)
            }
            .navigationTitle("Movable Grid")
        }
    }
}

#Preview {
    ContentView()
}
