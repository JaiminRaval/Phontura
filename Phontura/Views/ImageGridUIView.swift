//
//  ImageGridUIView.swift
//  Phontura
//
//  Created by Jaimin Raval on 09/05/25.
//

import SwiftUI

struct ImageGridUIView: View {
    var body: some View{
        ZStack {
            LinearGradient(
                           gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                           startPoint: .top,
                           endPoint: .bottom
                       )
                       .ignoresSafeArea()
        }
    }
    
}

#Preview {
    ImageGridUIView()
}
