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
                        showLabel: showTabLabels,
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
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(adaptiveBackgroundColor)
                        .blur(radius: glassBlur)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(adaptiveBackgroundColor)
                        .blur(radius: 0.7)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke (
                            LinearGradient(
                                colors: [
                                    .white.opacity(colorScheme == .dark ? 0.1 : 0.3),
                                    .clear,
                                    .black.opacity(colorScheme == .dark ? 0.1 : 0.04)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                        lineWidth: 1
                            
                        )
                    
                }
            )
            .cornerRadius(cornerRadius)
            .padding(.horizontal, 20)
            .padding(.bottom, bottomPadding)
            
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}

struct TabButton: View {
    
    let tab: TabItem
    let isSelected: Bool
    let selectedColor: Color
    let unselectedColor: Color
    let showLabel: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .font(.system(size: 24))
                    .symbolVariant(isSelected ? .fill : .none )
                    .foregroundStyle(isSelected ? selectedColor: unselectedColor)
                    .frame(height: 30)
                    .animation(.easeInOut, value: isSelected)
                if showLabel {
                    Text(tab.title)
                        .font(.system(size: 12, weight: isSelected ? .semibold : .regular))
                        .foregroundStyle(isSelected ? selectedColor: unselectedColor)
                        .animation(.easeInOut, value: isSelected)
                    
                }
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

extension View {
    func withTabBar(selectedTab: Binding<TabItem>, customization: (TabBarView) -> TabBarView = { $0 }) -> some View {
        ZStack {
            self
            
            VStack {
                Spacer()
                customization(TabBarView(selectedTab: selectedTab))
                    .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

