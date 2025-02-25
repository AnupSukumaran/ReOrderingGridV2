//
//  ContentView.swift
//  ReOrderingGridV2
//
//  Created by Sukumar.Sukumaran on 25/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, . black, .indigo, .cyan, .brown, .mint, .orange]
    @State private var draggingItem: Color?
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(colors, id: \.self) { color in
                        GeometryReader {
                            let size = $0.size
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color.gradient)
                                /// Drag
                                .draggable(color) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 1, height: 1)
                                        .onAppear {
                                            draggingItem = color
                                        }
                                }
                                /// Drop
                                .dropDestination(for: Color.self) { items, location in
                                    draggingItem = nil
                                    return false
                                } isTargeted: { status in
                                    if let draggingItem, status, draggingItem != color {
                                        // Moving color from source to destination
                                        if let sourceIndex = colors.firstIndex(of: draggingItem), let destinationIndex = colors.firstIndex(of: color) {
                                            withAnimation {
                                                let sourceItem = colors.remove(at: sourceIndex)
                                                colors.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
                                }
                        }
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
