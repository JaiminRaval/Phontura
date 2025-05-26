//
//  MesmerizingMeshView.swift
//  Phontura
//
//  Created by Jaimin Raval on 26/05/25.
//

import SwiftUI

@available(iOS 18.0, *)
struct MesmerizingMeshView: View {
    @State private var animateGradient = false
    
    var body: some View {
        ZStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                colors: [
                    .purple, .indigo, .blue,
                    .pink, .mint, .cyan,
                    .orange, .yellow, .green
                ]
            )
            .ignoresSafeArea()
            
            MeshGradient(
                width: 2,
                height: 2,
                points: [
                    [0.0, 0.0], [1.0, 0.0],
                    [0.0, 1.0], [1.0, 1.0]
                ],
                colors: [
                    .white.opacity(0.3),
                    .clear,
                    .clear,
                    .white.opacity(0.2)
                ]
            )
            .ignoresSafeArea()
            .scaleEffect(animateGradient ? 1.2 : 0.8)
            .rotationEffect(.degrees(animateGradient ? 45 : -45))
            .animation(
                .easeInOut(duration: 4.0)
                .repeatForever(autoreverses: true),
                value: animateGradient
            )
            
            // Content overlay
            VStack {
                Spacer()
                
                Text("Mesmerizing")
                    .font(.system(size: 48, weight: .ultraLight, design: .rounded))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Text("Mesh Gradient")
                    .font(.system(size: 24, weight: .light, design: .rounded))
                    .foregroundStyle(.white.opacity(0.8))
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                
                Spacer()
            }
        }
        .onAppear {
            animateGradient = true
        }
    }
}

// Alternative mesh gradient with different color scheme
@available(iOS 18.0, *)
struct CosmicMeshGradientView: View {
    var body: some View {
        MeshGradient(
            width: 4,
            height: 4,
            points: [
                // Row 1
                [0.0, 0.0], [0.33, 0.0], [0.66, 0.0], [1.0, 0.0],
                // Row 2
                [0.0, 0.33], [0.33, 0.33], [0.66, 0.33], [1.0, 0.33],
                // Row 3
                [0.0, 0.66], [0.33, 0.66], [0.66, 0.66], [1.0, 0.66],
                // Row 4
                [0.0, 1.0], [0.33, 1.0], [0.66, 1.0], [1.0, 1.0]
            ],
            colors: [
                .black, .purple, .indigo, .blue,
                .purple, .pink, .cyan, .teal,
                .red, .orange, .yellow, .green,
                .brown, .orange, .yellow, .white
            ]
        )
        .ignoresSafeArea()
    }
}

// Ocean-themed mesh gradient
@available(iOS 18.0, *)
struct OceanMeshGradientView: View {
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
            ],
            colors: [
                .blue, .cyan, .teal,
                .indigo, .mint, .green,
                .purple, .blue, .cyan
            ]
        )
        .ignoresSafeArea()
    }
}
