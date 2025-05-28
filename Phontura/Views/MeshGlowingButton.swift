//
//  MeshGlowingButton.swift
//  Phontura
//
//  Created by Jaimin Raval on 28/05/25.
//

import SwiftUI

struct MeshGlowingButton: View {
    @State private var isAnimating = false
    var btnTitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 55, style: .continuous)
                .fill(AngularGradient(colors: [.orange, .teal, .pink, .cyan, .orange,], center: .center, angle: .degrees(isAnimating ?  360 : 0)))
                .frame(width: 255, height: 55)
                .blur(radius: 20)
                .onAppear {
                    withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
            Button {
                // logic code
            } label: {
                Text(btnTitle)
                    .bold()
                    .font(.title3)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.black)
                    .frame(width: 255, height: 55)
                    .background(.orange, in: .rect(cornerRadius: 55, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 55, style: .continuous)
                            .stroke(.gray.opacity(0.5), lineWidth: 1.55)
                    }
                
            }

        }
    }
}

#Preview {
    MeshGlowingButton(btnTitle: "Get Premium")
}
