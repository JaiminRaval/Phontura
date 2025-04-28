//
//  HomeView.swift
//  Phontura
//
//  Created by Jaimin Raval on 06/04/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentTab: TabItem = .home
    
    var body: some View {
        ZStack {
            
            CoolGradientView()
            
            TabBarView(selectedTab: $currentTab, showTabLabels: false)
            GenImageView()
        }
    }
}

#Preview {
    HomeView()
}


struct CoolGradientView: View {
    
    var gradientColorArr: [Color] = [.blue, .purple, .pink, .orange]
    var animationDuration: Double = 8.0
    var blurRadius: CGFloat = 30
    
    @State private var isGradientAnimating: Bool = false
    
    var body: some View {
        LinearGradient(colors: gradientColorArr,
                       startPoint: isGradientAnimating ? .topLeading : .bottomTrailing,
                       endPoint: isGradientAnimating ? .bottomTrailing : .topLeading
        )
        .blur(radius: blurRadius)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                Animation
                    .easeInOut(duration: animationDuration)
                    .repeatForever(autoreverses: true)) {
                        isGradientAnimating.toggle()
                    }
            
        }
    }
}


