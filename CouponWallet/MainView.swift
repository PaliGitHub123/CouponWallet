//
//  MainView.swift
//  CouponWallet
//
//  Created by Pál Danyi on 24.07.26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            CameraPreviewView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
           CardsView()
                .tabItem {
                    Label("Cards", systemImage: "menucard")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
