//
//  AppTheme.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct AppTheme {
    // MARK: - Colors (Easy to change later)
    static let primaryColor = Color(red: 0.2, green: 0.5, blue: 0.8) // Blue
    static let secondaryColor = Color(red: 0.3, green: 0.7, blue: 0.5) // Green
    static let backgroundColor = Color(UIColor.systemBackground)
    static let cardBackground = Color(UIColor.secondarySystemBackground)
    
    // MARK: - App Info (Easy to change later)
    static let appName = "Chemistry App"
    static let appVersion = "1.0.0"
    
    // MARK: - Fonts
    static let titleFont = Font.system(size: 28, weight: .bold)
    static let headlineFont = Font.system(size: 20, weight: .semibold)
    static let bodyFont = Font.system(size: 16, weight: .regular)
    static let captionFont = Font.system(size: 12, weight: .regular)
    
    // MARK: - Element Cell Size
    static let elementCellSize: CGFloat = 45
    static let elementCellSpacing: CGFloat = 2
}
