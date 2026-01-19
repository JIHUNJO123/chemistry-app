//
//  ElementDetailView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct ElementDetailView: View {
    let element: Element
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header Card
                    ElementHeaderCard(element: element)
                    
                    // Properties Section
                    PropertiesSection(element: element)
                    
                    // Description Section
                    DescriptionSection(element: element)
                    
                    // Discovery Section
                    DiscoverySection(element: element)
                }
                .padding()
            }
            .navigationTitle(element.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Header Card
struct ElementHeaderCard: View {
    let element: Element
    
    var body: some View {
        VStack(spacing: 16) {
            // Symbol
            Text(element.symbol)
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.white)
            
            // Name and Atomic Number
            VStack(spacing: 4) {
                Text(element.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("Atomic Number: \(element.atomicNumber)")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            // Category Badge
            Text(element.category.rawValue)
                .font(.caption)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.2))
                .cornerRadius(12)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [element.category.color, element.category.color.opacity(0.7)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }
}

// MARK: - Properties Section
struct PropertiesSection: View {
    let element: Element
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Properties", icon: "list.bullet")
            
            VStack(spacing: 0) {
                PropertyRow(label: "Atomic Mass", value: String(format: "%.4f u", element.atomicMass))
                Divider()
                
                PropertyRow(label: "Period", value: "\(element.period)")
                Divider()
                
                PropertyRow(label: "Group", value: "\(element.group)")
                Divider()
                
                PropertyRow(label: "Electron Configuration", value: element.electronConfiguration)
                
                if let electronegativity = element.electronegativity {
                    Divider()
                    PropertyRow(label: "Electronegativity", value: String(format: "%.2f", electronegativity))
                }
                
                if let density = element.density {
                    Divider()
                    PropertyRow(label: "Density", value: String(format: "%.4f g/cm³", density))
                }
                
                if let meltingPoint = element.meltingPoint {
                    Divider()
                    PropertyRow(label: "Melting Point", value: String(format: "%.2f K", meltingPoint))
                }
                
                if let boilingPoint = element.boilingPoint {
                    Divider()
                    PropertyRow(label: "Boiling Point", value: String(format: "%.2f K", boilingPoint))
                }
            }
            .background(AppTheme.cardBackground)
            .cornerRadius(12)
        }
    }
}

// MARK: - Property Row
struct PropertyRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

// MARK: - Description Section
struct DescriptionSection: View {
    let element: Element
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "About", icon: "info.circle")
            
            Text(element.description)
                .font(.body)
                .foregroundColor(.primary)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppTheme.cardBackground)
                .cornerRadius(12)
        }
    }
}

// MARK: - Discovery Section
struct DiscoverySection: View {
    let element: Element
    
    var body: some View {
        if element.discoveredBy != nil || element.yearDiscovered != nil {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Discovery", icon: "lightbulb")
                
                VStack(spacing: 0) {
                    if let discoveredBy = element.discoveredBy {
                        PropertyRow(label: "Discovered By", value: discoveredBy)
                    }
                    
                    if let yearDiscovered = element.yearDiscovered {
                        if element.discoveredBy != nil {
                            Divider()
                        }
                        PropertyRow(label: "Year", value: "\(yearDiscovered)")
                    }
                }
                .background(AppTheme.cardBackground)
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(AppTheme.primaryColor)
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    ElementDetailView(element: Element(
        id: 6,
        symbol: "C",
        name: "Carbon",
        atomicMass: 12.011,
        category: .reactiveNonmetal,
        group: 14,
        period: 2,
        electronConfiguration: "[He] 2s² 2p²",
        electronegativity: 2.55,
        density: 2.267,
        meltingPoint: 3823,
        boilingPoint: 4098,
        discoveredBy: "Ancient",
        yearDiscovered: nil,
        description: "Carbon is the basis of all known life."
    ))
}
