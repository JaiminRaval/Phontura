//
//  UsrSettingsView.swift
//  Phontura
//
//  Created by Jaimin Raval on 01/05/25.
//

import SwiftUI

struct UsrSettingsView: View {
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                CoolMeshGradientView()
                List {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.gray)
                        .frame(height: 100)
                        
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

#Preview {
    UsrSettingsView()
}
