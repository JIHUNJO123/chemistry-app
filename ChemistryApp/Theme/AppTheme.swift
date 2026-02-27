//
//  AppTheme.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct AppTheme {
    // MARK: - Colors (Matching Easy Chem logo)
    static let primaryColor = Color(red: 0.12, green: 0.29, blue: 0.53) // Navy Blue (#1E4A87)
    static let secondaryColor = Color(red: 0.2, green: 0.4, blue: 0.7) // Light Blue
    static let backgroundColor = Color(UIColor.systemBackground)
    static let cardBackground = Color(UIColor.secondarySystemBackground)
    
    // MARK: - App Info
    static let appName = "Easy Chem"
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
