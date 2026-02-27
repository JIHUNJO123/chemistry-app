//
//  VideosView.swift
//  Easy Chem
//
//  Created by Jihun Jo
//

import SwiftUI

struct VideosView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                // Video Icon
                Image(systemName: "play.rectangle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(AppTheme.primaryColor.opacity(0.6))
                
                // Coming Soon Text
                VStack(spacing: 12) {
                    Text("Videos Coming Soon!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("We're working on creating educational chemistry videos for you.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                // Feature Preview
                VStack(alignment: .leading, spacing: 16) {
                    Text("What to expect:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    FeatureRow(icon: "atom", text: "Periodic Table Tutorials")
                    FeatureRow(icon: "link", text: "Chemical Bonding Lessons")
                    FeatureRow(icon: "flask", text: "Reaction Demonstrations")
                    FeatureRow(icon: "function", text: "Problem Solving Guides")
                }
                .padding(24)
                .background(AppTheme.cardBackground)
                .cornerRadius(16)
                .padding(.horizontal, 20)
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Videos")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Feature Row
struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(AppTheme.primaryColor)
                .frame(width: 30)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    VideosView()
}
