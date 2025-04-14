//
//  TabBarView.swift
//  Phontura
//
//  Created by Jaimin Raval on 14/04/25.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: TabItem
    var tabs: [TabItem] = [.home, .library, .settings]
    var cornerRadius: CGFloat = 55
    var glassOpacity: Double = 0.7
    var glassBlur: CGFloat = 20
    var backgroundColor: Color = .white
    var selectedColor: Color = .blue
    var unselectedColor: Color = .gray
    var showTabLabels: Bool = true
    var height: CGFloat = 80
    var bottomPadding: CGFloat = 10
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var adaptiveBackgroundColor: Color {
        colorScheme == .dark ?
            Color.black.opacity(glassOpacity) :
            backgroundColor.opacity(glassOpacity)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
                Spacer(minLength: 15)
                ForEach(tabs, id:\.rawValue) { tab in
                    TabButton(
                        tab: tab,
                        isSelected: selectedTab == tab,
                        selectedColor: selectedColor,
                        unselectedColor: unselectedColor,
                        showLable: showTabLabels,
                        action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                    )
                    if tab != tabs.last {
                        Spacer()
                    }
                }
                Spacer(minLength: 15)
            }
            .frame(height: height)
            .background(
                ZStack {
                    
                }
            )
            .cornerRadius(cornerRadius)
            .padding(.horizontal, 20)
            .padding(.bottom, bottomPadding)
            
        }
    }
}

//#Preview {
//    TabBarView()
//}

struct TabButton: View {
    
    let tab: TabItem
    let isSelected: Bool
    let selectedColor: Color
    let unselectedColor: Color
    let showLable: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(CustomTabButtonStyle())
    }
}


struct CustomTabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


enum TabItem: String, CaseIterable {
    case home
    case library
    case settings
    
    var title: String {
        rawValue.capitalized
    }
    
    var iconName: String {
        
        switch self {
        case .home:
            return "house"
        case .library:
            return "books.vertical"
        case .settings:
            return "gearshape"
            
        }
        
    }

    
}

