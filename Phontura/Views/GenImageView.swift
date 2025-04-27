//
//  GenImageView.swift
//  Phontura
//
//  Created by Jaimin Raval on 27/04/25.
//

import SwiftUI

struct GenImageView: View {
    var body: some View {
        CenteredHidableImageView()
    }
}


struct CenteredHidableImageView: View {
    // State to track whether the image is visible
    @State private var isImageVisible = true
    
    // You can customize these properties
    var imageName: String = "example-image"
    var imageSize: CGFloat = 200
    
    var body: some View {
        ZStack {
            // Your background content here
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                // Button to toggle image visibility
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isImageVisible.toggle()
                    }
                }) {
                    Text(isImageVisible ? "Hide Image" : "Show Image")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 40)
                
                Spacer()
                
                // Centered image that can be hidden
                if isImageVisible {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                        .transition(.opacity.combined(with: .scale))
                }
                
                Spacer()
            }
        }
    }
}

// Example usage with SF Symbol instead of asset image
struct CenteredSFSymbolView: View {
    @State private var isImageVisible = true
    var symbolName: String = "photo"
    var symbolSize: CGFloat = 100
    var symbolColor: Color = .blue
    
    var body: some View {
        ZStack {
            // Background
            Color.white.ignoresSafeArea()
            
            VStack {
                // Toggle button
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        isImageVisible.toggle()
                    }
                }) {
                    Text(isImageVisible ? "Hide Image" : "Show Image")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 40)
                
                Spacer()
                
                // Centered SF Symbol with animation
                if isImageVisible {
                    Image(systemName: symbolName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: symbolSize, height: symbolSize)
                        .foregroundColor(symbolColor)
                        .transition(.scale(scale: 0.1, anchor: .center).combined(with: .opacity))
                }
                
                Spacer()
            }
        }
    }
}



#Preview {
    GenImageView()
}
