//
//  PeriodicTableView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct PeriodicTableView: View {
    @StateObject private var elementsData = ElementsData.shared
    @State private var searchText = ""
    @State private var selectedElement: Element?
    @State private var showingDetail = false
    
    var filteredElements: [Element] {
        if searchText.isEmpty {
            return elementsData.elements
        } else {
            return elementsData.search(query: searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search Bar
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                if searchText.isEmpty {
                    // Full Periodic Table View
                    ScrollView([.horizontal, .vertical], showsIndicators: true) {
                        PeriodicTableGrid(
                            elements: elementsData.elements,
                            onElementTap: { element in
                                selectedElement = element
                                showingDetail = true
                            }
                        )
                        .padding()
                    }
                } else {
                    // Search Results List
                    List(filteredElements) { element in
                        ElementListRow(element: element)
                            .onTapGesture {
                                selectedElement = element
                                showingDetail = true
                            }
                    }
                    .listStyle(PlainListStyle())
                }
                
                // Legend
                CategoryLegend()
                    .padding(.horizontal)
                    .padding(.bottom, 8)
            }
            .navigationTitle("Periodic Table")
            .sheet(isPresented: $showingDetail) {
                if let element = selectedElement {
                    ElementDetailView(element: element)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Search Bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search elements...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

// MARK: - Periodic Table Grid
struct PeriodicTableGrid: View {
    let elements: [Element]
    let onElementTap: (Element) -> Void
    
    // Standard periodic table layout positions
    private let tableLayout: [[Int?]] = [
        [1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 2],
        [3, 4, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 5, 6, 7, 8, 9, 10],
        [11, 12, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 13, 14, 15, 16, 17, 18],
        [19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36],
        [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54],
        [55, 56, nil, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86],
        [87, 88, nil, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118],
        [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], // Spacer row
        [nil, nil, nil, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71], // Lanthanides
        [nil, nil, nil, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103]  // Actinides
    ]
    
    var body: some View {
        VStack(spacing: AppTheme.elementCellSpacing) {
            ForEach(0..<tableLayout.count, id: \.self) { row in
                HStack(spacing: AppTheme.elementCellSpacing) {
                    ForEach(0..<18, id: \.self) { col in
                        if let atomicNumber = tableLayout[row][col],
                           let element = elements.first(where: { $0.atomicNumber == atomicNumber }) {
                            ElementCell(element: element)
                                .onTapGesture {
                                    onElementTap(element)
                                }
                        } else {
                            Color.clear
                                .frame(width: AppTheme.elementCellSize, height: AppTheme.elementCellSize)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Element Cell
struct ElementCell: View {
    let element: Element
    
    private var massText: String {
        if element.atomicMass < 10 {
            return String(format: "%.2f", element.atomicMass)
        } else if element.atomicMass < 100 {
            return String(format: "%.1f", element.atomicMass)
        } else {
            return String(format: "%.0f", element.atomicMass)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(element.atomicNumber)")
                .font(.system(size: 7))
                .foregroundColor(.white.opacity(0.8))
            
            Text(element.symbol)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.white)
            
            Text(massText)
                .font(.system(size: 6))
                .foregroundColor(.white.opacity(0.9))
            
            Text(element.name)
                .font(.system(size: 5))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)
        }
        .frame(width: AppTheme.elementCellSize, height: AppTheme.elementCellSize)
        .background(element.category.color)
        .cornerRadius(4)
    }
}

// MARK: - Element List Row (for search results)
struct ElementListRow: View {
    let element: Element
    
    var body: some View {
        HStack(spacing: 12) {
            Text(element.symbol)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(element.category.color)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(element.name)
                    .font(.headline)
                
                Text("Atomic Number: \(element.atomicNumber)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(String(format: "%.3f", element.atomicMass))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Category Legend
struct CategoryLegend: View {
    let categories: [(ElementCategory, String)] = [
        (.alkaliMetal, "Alkali"),
        (.alkalineEarthMetal, "Alkaline"),
        (.transitionMetal, "Transition"),
        (.postTransitionMetal, "Post-Trans"),
        (.metalloid, "Metalloid"),
        (.reactiveNonmetal, "Nonmetal"),
        (.nobleGas, "Noble Gas"),
        (.lanthanide, "Lanthanide"),
        (.actinide, "Actinide")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories, id: \.0) { category, name in
                    HStack(spacing: 4) {
                        Circle()
                            .fill(category.color)
                            .frame(width: 10, height: 10)
                        
                        Text(name)
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    PeriodicTableView()
}
