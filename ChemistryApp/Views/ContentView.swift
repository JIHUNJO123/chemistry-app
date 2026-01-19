//
//  ContentView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PeriodicTableView()
                .tabItem {
                    Image(systemName: "atom")
                    Text("Periodic Table")
                }
                .tag(0)
            
            VideosView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Videos")
                }
                .tag(1)
            
            ProblemOfWeekView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Problem")
                }
                .tag(2)
            
            ForumView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Forum")
                }
                .tag(3)
        }
        .accentColor(AppTheme.primaryColor)
    }
}

#Preview {
    ContentView()
}
