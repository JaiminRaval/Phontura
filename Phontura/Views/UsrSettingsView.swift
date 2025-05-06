//
//  UsrSettingsView.swift
//  Phontura
//
//  Created by Jaimin Raval on 01/05/25.
//

import SwiftUI

struct UsrSettingsView: View {
    @State private var enablePushNotifications = true
    @State private var selectedTheme = "Dark"
    @State private var showAdvancedSettings = false

    let themes = ["Light", "Dark", "System"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General").foregroundColor(.gray)) {
                    Toggle("Enable Push Notifications", isOn: $enablePushNotifications)
                        .toggleStyle(SwitchToggleStyle(tint: .blue)) // Futuristic tint
                }

                Section(header: Text("Appearance").foregroundColor(.gray)) {
                    Picker("Theme", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                }

                Section {
                    Button("Advanced Settings") {
                        showAdvancedSettings.toggle()
                    }
                    .foregroundColor(.blue) // Futuristic button color
                }
                // You would navigate to a separate Advanced Settings View here
                .sheet(isPresented: $showAdvancedSettings) {
                    AdvancedSettingsView() // Create this view separately
                }
            }
            .navigationTitle("Settings")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom) // Subtle futuristic gradient background
                    .ignoresSafeArea()
            )
            .listStyle(InsetGroupedListStyle()) // Modern list style
        }
    }
//    var body: some View {
//        ZStack {
//            if #available(iOS 18.0, *) {
//                CoolMeshGradientView()
//                List {
//                    RoundedRectangle(cornerRadius: 14)
//                        .fill(.gray)
//                        .frame(height: 100)
//                        
//                }
//            } else {
//                // Fallback on earlier versions
//            }
//        }
//    }
}

struct AdvancedSettingsView: View {
    var body: some View {
        // Placeholder for your advanced settings
        Text("Advanced Settings Coming Soon...")
            .padding()
    }
}

#Preview {
    UsrSettingsView()
}
