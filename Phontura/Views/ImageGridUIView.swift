//
//  ImageGridUIView.swift
//  Phontura
//
//  Created by Jaimin Raval on 09/05/25.
//

import SwiftUI

struct ImageGridUIView: View {
    private let data: Data
    private let spacing: CGFloat
    private let columns: Int
//    private let itemContent: (Data.Element) -> ItemView
        
        @State private var size: CGSize = .zero
      var body: some View {
          GeometryReader { geometry in
              ScrollView {
                  LazyVGrid(columns: gridItems(), spacing: spacing) {
                      ForEach(data) { item in
                          itemContent(item)
                              // Set a fixed aspect ratio for consistent grid appearance
                              .aspectRatio(1, contentMode: .fill)
                              .frame(maxWidth: .infinity, maxHeight: .infinity)
                              .clipped()
                      }
                  }
                  .padding(.horizontal, spacing)
                  .onAppear {
                      size = geometry.size
                  }
                  .onChange(of: geometry.size) { newSize in
                      size = newSize
                  }
              }
          }
      }
}

#Preview {
    ImageGridUIView()
}
