//
//  ContentView.swift
//  porsche directory
//
//  Created by Donna Li on 2025-12-20.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    enum Tab: String {
        case home, car, drive, maintenance, more
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            CarView()
                .tabItem {
                    Label("Car", systemImage: "car.side")
                }
                .tag(Tab.car)

            DriveView()
                .tabItem {
                    Label("Drive", systemImage: "road.lanes")
                }
                .tag(Tab.drive)

            MaintenanceView()
                .tabItem {
                    Label("Maintenance", systemImage: "wrench.and.screwdriver")
                }
                .tag(Tab.maintenance)

            MoreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
                .tag(Tab.more)
        }
        .tint(.white)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
