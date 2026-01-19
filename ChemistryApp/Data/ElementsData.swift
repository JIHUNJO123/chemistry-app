//
//  ElementsData.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import Foundation

class ElementsData: ObservableObject {
    @Published var elements: [Element] = []
    
    static let shared = ElementsData()
    
    init() {
        loadElements()
    }
    
    private func loadElements() {
        elements = [
            // Period 1
            Element(id: 1, symbol: "H", name: "Hydrogen", atomicMass: 1.008, category: .reactiveNonmetal, group: 1, period: 1, electronConfiguration: "1s¹", electronegativity: 2.20, density: 0.00008988, meltingPoint: 14.01, boilingPoint: 20.28, discoveredBy: "Henry Cavendish", yearDiscovered: 1766, description: "Hydrogen is the lightest element and the most abundant chemical substance in the universe."),
            
            Element(id: 2, symbol: "He", name: "Helium", atomicMass: 4.003, category: .nobleGas, group: 18, period: 1, electronConfiguration: "1s²", electronegativity: nil, density: 0.0001785, meltingPoint: 0.95, boilingPoint: 4.22, discoveredBy: "Pierre Janssen", yearDiscovered: 1868, description: "Helium is a colorless, odorless, tasteless, non-toxic, inert monatomic gas."),
            
            // Period 2
            Element(id: 3, symbol: "Li", name: "Lithium", atomicMass: 6.941, category: .alkaliMetal, group: 1, period: 2, electronConfiguration: "[He] 2s¹", electronegativity: 0.98, density: 0.534, meltingPoint: 453.69, boilingPoint: 1615, discoveredBy: "Johan August Arfwedson", yearDiscovered: 1817, description: "Lithium is a soft, silvery-white alkali metal used in batteries and psychiatric medication."),
            
            Element(id: 4, symbol: "Be", name: "Beryllium", atomicMass: 9.012, category: .alkalineEarthMetal, group: 2, period: 2, electronConfiguration: "[He] 2s²", electronegativity: 1.57, density: 1.85, meltingPoint: 1560, boilingPoint: 2742, discoveredBy: "Louis Nicolas Vauquelin", yearDiscovered: 1798, description: "Beryllium is a steel-gray, strong, lightweight alkaline earth metal."),
            
            Element(id: 5, symbol: "B", name: "Boron", atomicMass: 10.81, category: .metalloid, group: 13, period: 2, electronConfiguration: "[He] 2s² 2p¹", electronegativity: 2.04, density: 2.34, meltingPoint: 2349, boilingPoint: 4200, discoveredBy: "Joseph Louis Gay-Lussac", yearDiscovered: 1808, description: "Boron is a metalloid essential for plant growth and used in glass and ceramics."),
            
            Element(id: 6, symbol: "C", name: "Carbon", atomicMass: 12.011, category: .reactiveNonmetal, group: 14, period: 2, electronConfiguration: "[He] 2s² 2p²", electronegativity: 2.55, density: 2.267, meltingPoint: 3823, boilingPoint: 4098, discoveredBy: "Ancient", yearDiscovered: nil, description: "Carbon is the basis of all known life and exists in many allotropes including diamond and graphite."),
            
            Element(id: 7, symbol: "N", name: "Nitrogen", atomicMass: 14.007, category: .reactiveNonmetal, group: 15, period: 2, electronConfiguration: "[He] 2s² 2p³", electronegativity: 3.04, density: 0.0012506, meltingPoint: 63.15, boilingPoint: 77.36, discoveredBy: "Daniel Rutherford", yearDiscovered: 1772, description: "Nitrogen makes up about 78% of Earth's atmosphere and is essential for all living organisms."),
            
            Element(id: 8, symbol: "O", name: "Oxygen", atomicMass: 15.999, category: .reactiveNonmetal, group: 16, period: 2, electronConfiguration: "[He] 2s² 2p⁴", electronegativity: 3.44, density: 0.001429, meltingPoint: 54.36, boilingPoint: 90.20, discoveredBy: "Carl Wilhelm Scheele", yearDiscovered: 1774, description: "Oxygen is essential for respiration and makes up about 21% of Earth's atmosphere."),
            
            Element(id: 9, symbol: "F", name: "Fluorine", atomicMass: 18.998, category: .reactiveNonmetal, group: 17, period: 2, electronConfiguration: "[He] 2s² 2p⁵", electronegativity: 3.98, density: 0.001696, meltingPoint: 53.53, boilingPoint: 85.03, discoveredBy: "André-Marie Ampère", yearDiscovered: 1810, description: "Fluorine is the most electronegative element and highly reactive."),
            
            Element(id: 10, symbol: "Ne", name: "Neon", atomicMass: 20.180, category: .nobleGas, group: 18, period: 2, electronConfiguration: "[He] 2s² 2p⁶", electronegativity: nil, density: 0.0008999, meltingPoint: 24.56, boilingPoint: 27.07, discoveredBy: "William Ramsay", yearDiscovered: 1898, description: "Neon is known for its use in neon signs, producing a distinctive reddish-orange glow."),
            
            // Period 3
            Element(id: 11, symbol: "Na", name: "Sodium", atomicMass: 22.990, category: .alkaliMetal, group: 1, period: 3, electronConfiguration: "[Ne] 3s¹", electronegativity: 0.93, density: 0.971, meltingPoint: 370.87, boilingPoint: 1156, discoveredBy: "Humphry Davy", yearDiscovered: 1807, description: "Sodium is a soft, silvery-white, highly reactive metal essential for life."),
            
            Element(id: 12, symbol: "Mg", name: "Magnesium", atomicMass: 24.305, category: .alkalineEarthMetal, group: 2, period: 3, electronConfiguration: "[Ne] 3s²", electronegativity: 1.31, density: 1.738, meltingPoint: 923, boilingPoint: 1363, discoveredBy: "Joseph Black", yearDiscovered: 1755, description: "Magnesium is a shiny gray solid essential for all cells and used in alloys."),
            
            Element(id: 13, symbol: "Al", name: "Aluminum", atomicMass: 26.982, category: .postTransitionMetal, group: 13, period: 3, electronConfiguration: "[Ne] 3s² 3p¹", electronegativity: 1.61, density: 2.698, meltingPoint: 933.47, boilingPoint: 2792, discoveredBy: "Hans Christian Ørsted", yearDiscovered: 1825, description: "Aluminum is the most abundant metal in Earth's crust, used widely in construction and packaging."),
            
            Element(id: 14, symbol: "Si", name: "Silicon", atomicMass: 28.086, category: .metalloid, group: 14, period: 3, electronConfiguration: "[Ne] 3s² 3p²", electronegativity: 1.90, density: 2.3296, meltingPoint: 1687, boilingPoint: 3538, discoveredBy: "Jöns Jacob Berzelius", yearDiscovered: 1824, description: "Silicon is the basis for most semiconductors and computer chips."),
            
            Element(id: 15, symbol: "P", name: "Phosphorus", atomicMass: 30.974, category: .reactiveNonmetal, group: 15, period: 3, electronConfiguration: "[Ne] 3s² 3p³", electronegativity: 2.19, density: 1.82, meltingPoint: 317.30, boilingPoint: 553.65, discoveredBy: "Hennig Brand", yearDiscovered: 1669, description: "Phosphorus is essential for life, found in DNA, RNA, and ATP."),
            
            Element(id: 16, symbol: "S", name: "Sulfur", atomicMass: 32.065, category: .reactiveNonmetal, group: 16, period: 3, electronConfiguration: "[Ne] 3s² 3p⁴", electronegativity: 2.58, density: 2.067, meltingPoint: 388.36, boilingPoint: 717.87, discoveredBy: "Ancient", yearDiscovered: nil, description: "Sulfur is a yellow nonmetal used in fertilizers, gunpowder, and vulcanization."),
            
            Element(id: 17, symbol: "Cl", name: "Chlorine", atomicMass: 35.453, category: .reactiveNonmetal, group: 17, period: 3, electronConfiguration: "[Ne] 3s² 3p⁵", electronegativity: 3.16, density: 0.003214, meltingPoint: 171.65, boilingPoint: 239.11, discoveredBy: "Carl Wilhelm Scheele", yearDiscovered: 1774, description: "Chlorine is a yellow-green gas used in water purification and plastics production."),
            
            Element(id: 18, symbol: "Ar", name: "Argon", atomicMass: 39.948, category: .nobleGas, group: 18, period: 3, electronConfiguration: "[Ne] 3s² 3p⁶", electronegativity: nil, density: 0.0017837, meltingPoint: 83.80, boilingPoint: 87.30, discoveredBy: "Lord Rayleigh", yearDiscovered: 1894, description: "Argon is the third most abundant gas in Earth's atmosphere, used in welding and lighting."),
            
            // Period 4
            Element(id: 19, symbol: "K", name: "Potassium", atomicMass: 39.098, category: .alkaliMetal, group: 1, period: 4, electronConfiguration: "[Ar] 4s¹", electronegativity: 0.82, density: 0.862, meltingPoint: 336.53, boilingPoint: 1032, discoveredBy: "Humphry Davy", yearDiscovered: 1807, description: "Potassium is essential for plant growth and nerve function in animals."),
            
            Element(id: 20, symbol: "Ca", name: "Calcium", atomicMass: 40.078, category: .alkalineEarthMetal, group: 2, period: 4, electronConfiguration: "[Ar] 4s²", electronegativity: 1.00, density: 1.54, meltingPoint: 1115, boilingPoint: 1757, discoveredBy: "Humphry Davy", yearDiscovered: 1808, description: "Calcium is essential for bones and teeth and is the fifth most abundant element in the body."),
            
            Element(id: 21, symbol: "Sc", name: "Scandium", atomicMass: 44.956, category: .transitionMetal, group: 3, period: 4, electronConfiguration: "[Ar] 3d¹ 4s²", electronegativity: 1.36, density: 2.989, meltingPoint: 1814, boilingPoint: 3109, discoveredBy: "Lars Fredrik Nilson", yearDiscovered: 1879, description: "Scandium is a soft, silvery transition metal used in aerospace components."),
            
            Element(id: 22, symbol: "Ti", name: "Titanium", atomicMass: 47.867, category: .transitionMetal, group: 4, period: 4, electronConfiguration: "[Ar] 3d² 4s²", electronegativity: 1.54, density: 4.54, meltingPoint: 1941, boilingPoint: 3560, discoveredBy: "William Gregor", yearDiscovered: 1791, description: "Titanium is known for its high strength-to-weight ratio and corrosion resistance."),
            
            Element(id: 23, symbol: "V", name: "Vanadium", atomicMass: 50.942, category: .transitionMetal, group: 5, period: 4, electronConfiguration: "[Ar] 3d³ 4s²", electronegativity: 1.63, density: 6.11, meltingPoint: 2183, boilingPoint: 3680, discoveredBy: "Andrés Manuel del Río", yearDiscovered: 1801, description: "Vanadium is used to make strong steel alloys and in some types of batteries."),
            
            Element(id: 24, symbol: "Cr", name: "Chromium", atomicMass: 51.996, category: .transitionMetal, group: 6, period: 4, electronConfiguration: "[Ar] 3d⁵ 4s¹", electronegativity: 1.66, density: 7.15, meltingPoint: 2180, boilingPoint: 2944, discoveredBy: "Louis Nicolas Vauquelin", yearDiscovered: 1797, description: "Chromium is known for its high corrosion resistance and hardness."),
            
            Element(id: 25, symbol: "Mn", name: "Manganese", atomicMass: 54.938, category: .transitionMetal, group: 7, period: 4, electronConfiguration: "[Ar] 3d⁵ 4s²", electronegativity: 1.55, density: 7.44, meltingPoint: 1519, boilingPoint: 2334, discoveredBy: "Johan Gottlieb Gahn", yearDiscovered: 1774, description: "Manganese is essential for steel production and biological functions."),
            
            Element(id: 26, symbol: "Fe", name: "Iron", atomicMass: 55.845, category: .transitionMetal, group: 8, period: 4, electronConfiguration: "[Ar] 3d⁶ 4s²", electronegativity: 1.83, density: 7.874, meltingPoint: 1811, boilingPoint: 3134, discoveredBy: "Ancient", yearDiscovered: nil, description: "Iron is the most common element on Earth and essential for hemoglobin in blood."),
            
            Element(id: 27, symbol: "Co", name: "Cobalt", atomicMass: 58.933, category: .transitionMetal, group: 9, period: 4, electronConfiguration: "[Ar] 3d⁷ 4s²", electronegativity: 1.88, density: 8.86, meltingPoint: 1768, boilingPoint: 3200, discoveredBy: "Georg Brandt", yearDiscovered: 1735, description: "Cobalt is used in lithium-ion batteries and to create blue pigments."),
            
            Element(id: 28, symbol: "Ni", name: "Nickel", atomicMass: 58.693, category: .transitionMetal, group: 10, period: 4, electronConfiguration: "[Ar] 3d⁸ 4s²", electronegativity: 1.91, density: 8.912, meltingPoint: 1728, boilingPoint: 3186, discoveredBy: "Axel Fredrik Cronstedt", yearDiscovered: 1751, description: "Nickel is used in stainless steel, coins, and rechargeable batteries."),
            
            Element(id: 29, symbol: "Cu", name: "Copper", atomicMass: 63.546, category: .transitionMetal, group: 11, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s¹", electronegativity: 1.90, density: 8.96, meltingPoint: 1357.77, boilingPoint: 2835, discoveredBy: "Ancient", yearDiscovered: nil, description: "Copper is an excellent conductor of electricity and heat, used since ancient times."),
            
            Element(id: 30, symbol: "Zn", name: "Zinc", atomicMass: 65.38, category: .transitionMetal, group: 12, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s²", electronegativity: 1.65, density: 7.134, meltingPoint: 692.68, boilingPoint: 1180, discoveredBy: "Indian metallurgists", yearDiscovered: 1000, description: "Zinc is used in galvanization, batteries, and as an essential nutrient."),
            
            Element(id: 31, symbol: "Ga", name: "Gallium", atomicMass: 69.723, category: .postTransitionMetal, group: 13, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p¹", electronegativity: 1.81, density: 5.907, meltingPoint: 302.91, boilingPoint: 2477, discoveredBy: "Paul Emile Lecoq de Boisbaudran", yearDiscovered: 1875, description: "Gallium has a low melting point and is used in semiconductors and LEDs."),
            
            Element(id: 32, symbol: "Ge", name: "Germanium", atomicMass: 72.64, category: .metalloid, group: 14, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p²", electronegativity: 2.01, density: 5.323, meltingPoint: 1211.40, boilingPoint: 3106, discoveredBy: "Clemens Winkler", yearDiscovered: 1886, description: "Germanium is used in fiber optics and infrared optics."),
            
            Element(id: 33, symbol: "As", name: "Arsenic", atomicMass: 74.922, category: .metalloid, group: 15, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p³", electronegativity: 2.18, density: 5.776, meltingPoint: 1090, boilingPoint: 887, discoveredBy: "Albertus Magnus", yearDiscovered: 1250, description: "Arsenic is a metalloid known for its toxicity, used in semiconductors and pesticides."),
            
            Element(id: 34, symbol: "Se", name: "Selenium", atomicMass: 78.96, category: .reactiveNonmetal, group: 16, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p⁴", electronegativity: 2.55, density: 4.809, meltingPoint: 493.65, boilingPoint: 958, discoveredBy: "Jöns Jacob Berzelius", yearDiscovered: 1817, description: "Selenium is essential in small amounts and used in glass manufacturing."),
            
            Element(id: 35, symbol: "Br", name: "Bromine", atomicMass: 79.904, category: .reactiveNonmetal, group: 17, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p⁵", electronegativity: 2.96, density: 3.122, meltingPoint: 265.95, boilingPoint: 332.0, discoveredBy: "Antoine Jérôme Balard", yearDiscovered: 1826, description: "Bromine is a reddish-brown liquid at room temperature, used in flame retardants."),
            
            Element(id: 36, symbol: "Kr", name: "Krypton", atomicMass: 83.798, category: .nobleGas, group: 18, period: 4, electronConfiguration: "[Ar] 3d¹⁰ 4s² 4p⁶", electronegativity: 3.00, density: 0.003733, meltingPoint: 115.79, boilingPoint: 119.93, discoveredBy: "William Ramsay", yearDiscovered: 1898, description: "Krypton is used in lighting and photography, and was once used to define the meter."),
            
            // Period 5
            Element(id: 37, symbol: "Rb", name: "Rubidium", atomicMass: 85.468, category: .alkaliMetal, group: 1, period: 5, electronConfiguration: "[Kr] 5s¹", electronegativity: 0.82, density: 1.532, meltingPoint: 312.46, boilingPoint: 961, discoveredBy: "Robert Bunsen", yearDiscovered: 1861, description: "Rubidium is a soft, silvery-white metal used in atomic clocks."),
            
            Element(id: 38, symbol: "Sr", name: "Strontium", atomicMass: 87.62, category: .alkalineEarthMetal, group: 2, period: 5, electronConfiguration: "[Kr] 5s²", electronegativity: 0.95, density: 2.64, meltingPoint: 1050, boilingPoint: 1655, discoveredBy: "William Cruickshank", yearDiscovered: 1790, description: "Strontium is used in fireworks and flares to produce a red color."),
            
            Element(id: 39, symbol: "Y", name: "Yttrium", atomicMass: 88.906, category: .transitionMetal, group: 3, period: 5, electronConfiguration: "[Kr] 4d¹ 5s²", electronegativity: 1.22, density: 4.469, meltingPoint: 1795, boilingPoint: 3618, discoveredBy: "Johan Gadolin", yearDiscovered: 1794, description: "Yttrium is used in LEDs, superconductors, and cancer treatments."),
            
            Element(id: 40, symbol: "Zr", name: "Zirconium", atomicMass: 91.224, category: .transitionMetal, group: 4, period: 5, electronConfiguration: "[Kr] 4d² 5s²", electronegativity: 1.33, density: 6.506, meltingPoint: 2128, boilingPoint: 4682, discoveredBy: "Martin Heinrich Klaproth", yearDiscovered: 1789, description: "Zirconium is highly resistant to corrosion and used in nuclear reactors."),
            
            Element(id: 41, symbol: "Nb", name: "Niobium", atomicMass: 92.906, category: .transitionMetal, group: 5, period: 5, electronConfiguration: "[Kr] 4d⁴ 5s¹", electronegativity: 1.6, density: 8.57, meltingPoint: 2750, boilingPoint: 5017, discoveredBy: "Charles Hatchett", yearDiscovered: 1801, description: "Niobium is used in superconducting magnets and jet engines."),
            
            Element(id: 42, symbol: "Mo", name: "Molybdenum", atomicMass: 95.96, category: .transitionMetal, group: 6, period: 5, electronConfiguration: "[Kr] 4d⁵ 5s¹", electronegativity: 2.16, density: 10.22, meltingPoint: 2896, boilingPoint: 4912, discoveredBy: "Carl Wilhelm Scheele", yearDiscovered: 1778, description: "Molybdenum is used in high-strength steel alloys and as a catalyst."),
            
            Element(id: 43, symbol: "Tc", name: "Technetium", atomicMass: 98, category: .transitionMetal, group: 7, period: 5, electronConfiguration: "[Kr] 4d⁵ 5s²", electronegativity: 1.9, density: 11.5, meltingPoint: 2430, boilingPoint: 4538, discoveredBy: "Emilio Segrè", yearDiscovered: 1937, description: "Technetium was the first artificially produced element, used in medical imaging."),
            
            Element(id: 44, symbol: "Ru", name: "Ruthenium", atomicMass: 101.07, category: .transitionMetal, group: 8, period: 5, electronConfiguration: "[Kr] 4d⁷ 5s¹", electronegativity: 2.2, density: 12.37, meltingPoint: 2607, boilingPoint: 4423, discoveredBy: "Karl Ernst Claus", yearDiscovered: 1844, description: "Ruthenium is used in electronics and as a catalyst."),
            
            Element(id: 45, symbol: "Rh", name: "Rhodium", atomicMass: 102.91, category: .transitionMetal, group: 9, period: 5, electronConfiguration: "[Kr] 4d⁸ 5s¹", electronegativity: 2.28, density: 12.41, meltingPoint: 2237, boilingPoint: 3968, discoveredBy: "William Hyde Wollaston", yearDiscovered: 1803, description: "Rhodium is one of the rarest and most valuable precious metals."),
            
            Element(id: 46, symbol: "Pd", name: "Palladium", atomicMass: 106.42, category: .transitionMetal, group: 10, period: 5, electronConfiguration: "[Kr] 4d¹⁰", electronegativity: 2.20, density: 12.02, meltingPoint: 1828.05, boilingPoint: 3236, discoveredBy: "William Hyde Wollaston", yearDiscovered: 1803, description: "Palladium is used in catalytic converters and jewelry."),
            
            Element(id: 47, symbol: "Ag", name: "Silver", atomicMass: 107.87, category: .transitionMetal, group: 11, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s¹", electronegativity: 1.93, density: 10.501, meltingPoint: 1234.93, boilingPoint: 2435, discoveredBy: "Ancient", yearDiscovered: nil, description: "Silver has the highest electrical and thermal conductivity of any metal."),
            
            Element(id: 48, symbol: "Cd", name: "Cadmium", atomicMass: 112.41, category: .transitionMetal, group: 12, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s²", electronegativity: 1.69, density: 8.69, meltingPoint: 594.22, boilingPoint: 1040, discoveredBy: "Karl Samuel Leberecht Hermann", yearDiscovered: 1817, description: "Cadmium is used in batteries and pigments but is toxic."),
            
            Element(id: 49, symbol: "In", name: "Indium", atomicMass: 114.82, category: .postTransitionMetal, group: 13, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p¹", electronegativity: 1.78, density: 7.31, meltingPoint: 429.75, boilingPoint: 2345, discoveredBy: "Ferdinand Reich", yearDiscovered: 1863, description: "Indium is used in touchscreens and LCD displays."),
            
            Element(id: 50, symbol: "Sn", name: "Tin", atomicMass: 118.71, category: .postTransitionMetal, group: 14, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p²", electronegativity: 1.96, density: 7.287, meltingPoint: 505.08, boilingPoint: 2875, discoveredBy: "Ancient", yearDiscovered: nil, description: "Tin is used in solder, tin cans, and bronze alloys."),
            
            Element(id: 51, symbol: "Sb", name: "Antimony", atomicMass: 121.76, category: .metalloid, group: 15, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p³", electronegativity: 2.05, density: 6.685, meltingPoint: 903.78, boilingPoint: 1860, discoveredBy: "Ancient", yearDiscovered: nil, description: "Antimony is used in flame retardants and lead-acid batteries."),
            
            Element(id: 52, symbol: "Te", name: "Tellurium", atomicMass: 127.60, category: .metalloid, group: 16, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p⁴", electronegativity: 2.1, density: 6.232, meltingPoint: 722.66, boilingPoint: 1261, discoveredBy: "Franz-Joseph Müller von Reichenstein", yearDiscovered: 1782, description: "Tellurium is used in solar panels and thermoelectric devices."),
            
            Element(id: 53, symbol: "I", name: "Iodine", atomicMass: 126.90, category: .reactiveNonmetal, group: 17, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p⁵", electronegativity: 2.66, density: 4.93, meltingPoint: 386.85, boilingPoint: 457.55, discoveredBy: "Bernard Courtois", yearDiscovered: 1811, description: "Iodine is essential for thyroid function and used as a disinfectant."),
            
            Element(id: 54, symbol: "Xe", name: "Xenon", atomicMass: 131.29, category: .nobleGas, group: 18, period: 5, electronConfiguration: "[Kr] 4d¹⁰ 5s² 5p⁶", electronegativity: 2.60, density: 0.005887, meltingPoint: 161.36, boilingPoint: 165.03, discoveredBy: "William Ramsay", yearDiscovered: 1898, description: "Xenon is used in flash lamps, ion propulsion, and anesthesia."),
            
            // Period 6
            Element(id: 55, symbol: "Cs", name: "Cesium", atomicMass: 132.91, category: .alkaliMetal, group: 1, period: 6, electronConfiguration: "[Xe] 6s¹", electronegativity: 0.79, density: 1.873, meltingPoint: 301.59, boilingPoint: 944, discoveredBy: "Robert Bunsen", yearDiscovered: 1860, description: "Cesium is used in atomic clocks, the most accurate timekeeping devices."),
            
            Element(id: 56, symbol: "Ba", name: "Barium", atomicMass: 137.33, category: .alkalineEarthMetal, group: 2, period: 6, electronConfiguration: "[Xe] 6s²", electronegativity: 0.89, density: 3.594, meltingPoint: 1000, boilingPoint: 2170, discoveredBy: "Carl Wilhelm Scheele", yearDiscovered: 1772, description: "Barium is used in medical imaging and fireworks."),
            
            // Lanthanides
            Element(id: 57, symbol: "La", name: "Lanthanum", atomicMass: 138.91, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 5d¹ 6s²", electronegativity: 1.10, density: 6.145, meltingPoint: 1193, boilingPoint: 3737, discoveredBy: "Carl Gustaf Mosander", yearDiscovered: 1839, description: "Lanthanum is used in camera lenses and battery electrodes."),
            
            Element(id: 58, symbol: "Ce", name: "Cerium", atomicMass: 140.12, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹ 5d¹ 6s²", electronegativity: 1.12, density: 6.77, meltingPoint: 1068, boilingPoint: 3716, discoveredBy: "Wilhelm Hisinger", yearDiscovered: 1803, description: "Cerium is the most abundant rare earth element, used in catalytic converters."),
            
            Element(id: 59, symbol: "Pr", name: "Praseodymium", atomicMass: 140.91, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f³ 6s²", electronegativity: 1.13, density: 6.773, meltingPoint: 1208, boilingPoint: 3793, discoveredBy: "Carl Auer von Welsbach", yearDiscovered: 1885, description: "Praseodymium is used in magnets and as a green colorant in glass."),
            
            Element(id: 60, symbol: "Nd", name: "Neodymium", atomicMass: 144.24, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁴ 6s²", electronegativity: 1.14, density: 7.007, meltingPoint: 1297, boilingPoint: 3347, discoveredBy: "Carl Auer von Welsbach", yearDiscovered: 1885, description: "Neodymium is used in powerful permanent magnets."),
            
            Element(id: 61, symbol: "Pm", name: "Promethium", atomicMass: 145, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁵ 6s²", electronegativity: 1.13, density: 7.26, meltingPoint: 1315, boilingPoint: 3273, discoveredBy: "Chien Shiung Wu", yearDiscovered: 1945, description: "Promethium is radioactive and used in nuclear batteries."),
            
            Element(id: 62, symbol: "Sm", name: "Samarium", atomicMass: 150.36, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁶ 6s²", electronegativity: 1.17, density: 7.52, meltingPoint: 1345, boilingPoint: 2067, discoveredBy: "Paul Émile Lecoq de Boisbaudran", yearDiscovered: 1879, description: "Samarium is used in magnets and cancer treatment."),
            
            Element(id: 63, symbol: "Eu", name: "Europium", atomicMass: 151.96, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁷ 6s²", electronegativity: 1.2, density: 5.243, meltingPoint: 1099, boilingPoint: 1802, discoveredBy: "Eugène-Anatole Demarçay", yearDiscovered: 1901, description: "Europium is used in red phosphors for TVs and fluorescent lamps."),
            
            Element(id: 64, symbol: "Gd", name: "Gadolinium", atomicMass: 157.25, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁷ 5d¹ 6s²", electronegativity: 1.20, density: 7.895, meltingPoint: 1585, boilingPoint: 3546, discoveredBy: "Jean Charles Galissard de Marignac", yearDiscovered: 1880, description: "Gadolinium is used in MRI contrast agents and nuclear reactors."),
            
            Element(id: 65, symbol: "Tb", name: "Terbium", atomicMass: 158.93, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f⁹ 6s²", electronegativity: 1.2, density: 8.229, meltingPoint: 1629, boilingPoint: 3503, discoveredBy: "Carl Gustaf Mosander", yearDiscovered: 1843, description: "Terbium is used in green phosphors and solid-state devices."),
            
            Element(id: 66, symbol: "Dy", name: "Dysprosium", atomicMass: 162.50, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹⁰ 6s²", electronegativity: 1.22, density: 8.55, meltingPoint: 1680, boilingPoint: 2840, discoveredBy: "Paul Émile Lecoq de Boisbaudran", yearDiscovered: 1886, description: "Dysprosium is used in magnets for electric vehicles and wind turbines."),
            
            Element(id: 67, symbol: "Ho", name: "Holmium", atomicMass: 164.93, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹¹ 6s²", electronegativity: 1.23, density: 8.795, meltingPoint: 1734, boilingPoint: 2993, discoveredBy: "Marc Delafontaine", yearDiscovered: 1878, description: "Holmium has the highest magnetic moment of any element."),
            
            Element(id: 68, symbol: "Er", name: "Erbium", atomicMass: 167.26, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹² 6s²", electronegativity: 1.24, density: 9.066, meltingPoint: 1802, boilingPoint: 3141, discoveredBy: "Carl Gustaf Mosander", yearDiscovered: 1843, description: "Erbium is used in fiber optic communications and lasers."),
            
            Element(id: 69, symbol: "Tm", name: "Thulium", atomicMass: 168.93, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹³ 6s²", electronegativity: 1.25, density: 9.321, meltingPoint: 1818, boilingPoint: 2223, discoveredBy: "Per Teodor Cleve", yearDiscovered: 1879, description: "Thulium is the least abundant lanthanide, used in portable X-ray devices."),
            
            Element(id: 70, symbol: "Yb", name: "Ytterbium", atomicMass: 173.05, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 6s²", electronegativity: 1.1, density: 6.965, meltingPoint: 1097, boilingPoint: 1469, discoveredBy: "Jean Charles Galissard de Marignac", yearDiscovered: 1878, description: "Ytterbium is used in metallurgy and as a radiation source."),
            
            Element(id: 71, symbol: "Lu", name: "Lutetium", atomicMass: 174.97, category: .lanthanide, group: 3, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹ 6s²", electronegativity: 1.27, density: 9.84, meltingPoint: 1925, boilingPoint: 3675, discoveredBy: "Georges Urbain", yearDiscovered: 1907, description: "Lutetium is used in PET scan detectors and cancer treatment."),
            
            Element(id: 72, symbol: "Hf", name: "Hafnium", atomicMass: 178.49, category: .transitionMetal, group: 4, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d² 6s²", electronegativity: 1.3, density: 13.31, meltingPoint: 2506, boilingPoint: 4876, discoveredBy: "Dirk Coster", yearDiscovered: 1923, description: "Hafnium is used in nuclear control rods and microprocessors."),
            
            Element(id: 73, symbol: "Ta", name: "Tantalum", atomicMass: 180.95, category: .transitionMetal, group: 5, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d³ 6s²", electronegativity: 1.5, density: 16.654, meltingPoint: 3290, boilingPoint: 5731, discoveredBy: "Anders Gustaf Ekeberg", yearDiscovered: 1802, description: "Tantalum is used in capacitors and surgical implants."),
            
            Element(id: 74, symbol: "W", name: "Tungsten", atomicMass: 183.84, category: .transitionMetal, group: 6, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d⁴ 6s²", electronegativity: 2.36, density: 19.25, meltingPoint: 3695, boilingPoint: 5828, discoveredBy: "Carl Wilhelm Scheele", yearDiscovered: 1783, description: "Tungsten has the highest melting point of all elements."),
            
            Element(id: 75, symbol: "Re", name: "Rhenium", atomicMass: 186.21, category: .transitionMetal, group: 7, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d⁵ 6s²", electronegativity: 1.9, density: 21.02, meltingPoint: 3459, boilingPoint: 5869, discoveredBy: "Masataka Ogawa", yearDiscovered: 1925, description: "Rhenium is one of the rarest elements, used in jet engines."),
            
            Element(id: 76, symbol: "Os", name: "Osmium", atomicMass: 190.23, category: .transitionMetal, group: 8, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d⁶ 6s²", electronegativity: 2.2, density: 22.59, meltingPoint: 3306, boilingPoint: 5285, discoveredBy: "Smithson Tennant", yearDiscovered: 1803, description: "Osmium is the densest naturally occurring element."),
            
            Element(id: 77, symbol: "Ir", name: "Iridium", atomicMass: 192.22, category: .transitionMetal, group: 9, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d⁷ 6s²", electronegativity: 2.20, density: 22.56, meltingPoint: 2719, boilingPoint: 4701, discoveredBy: "Smithson Tennant", yearDiscovered: 1803, description: "Iridium is the most corrosion-resistant metal and very dense."),
            
            Element(id: 78, symbol: "Pt", name: "Platinum", atomicMass: 195.08, category: .transitionMetal, group: 10, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d⁹ 6s¹", electronegativity: 2.28, density: 21.46, meltingPoint: 2041.55, boilingPoint: 4098, discoveredBy: "Antonio de Ulloa", yearDiscovered: 1735, description: "Platinum is a precious metal used in jewelry and catalytic converters."),
            
            Element(id: 79, symbol: "Au", name: "Gold", atomicMass: 196.97, category: .transitionMetal, group: 11, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s¹", electronegativity: 2.54, density: 19.282, meltingPoint: 1337.33, boilingPoint: 3129, discoveredBy: "Ancient", yearDiscovered: nil, description: "Gold is a precious metal valued for its beauty and conductivity."),
            
            Element(id: 80, symbol: "Hg", name: "Mercury", atomicMass: 200.59, category: .transitionMetal, group: 12, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s²", electronegativity: 2.00, density: 13.5336, meltingPoint: 234.32, boilingPoint: 629.88, discoveredBy: "Ancient", yearDiscovered: nil, description: "Mercury is the only metal that is liquid at room temperature."),
            
            Element(id: 81, symbol: "Tl", name: "Thallium", atomicMass: 204.38, category: .postTransitionMetal, group: 13, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p¹", electronegativity: 1.62, density: 11.85, meltingPoint: 577, boilingPoint: 1746, discoveredBy: "William Crookes", yearDiscovered: 1861, description: "Thallium is highly toxic and was once used in rat poison."),
            
            Element(id: 82, symbol: "Pb", name: "Lead", atomicMass: 207.2, category: .postTransitionMetal, group: 14, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p²", electronegativity: 2.33, density: 11.342, meltingPoint: 600.61, boilingPoint: 2022, discoveredBy: "Ancient", yearDiscovered: nil, description: "Lead is a dense, soft metal once widely used but now known to be toxic."),
            
            Element(id: 83, symbol: "Bi", name: "Bismuth", atomicMass: 208.98, category: .postTransitionMetal, group: 15, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p³", electronegativity: 2.02, density: 9.807, meltingPoint: 544.55, boilingPoint: 1837, discoveredBy: "Claude François Geoffroy", yearDiscovered: 1753, description: "Bismuth is used in cosmetics, medicines, and low-melting alloys."),
            
            Element(id: 84, symbol: "Po", name: "Polonium", atomicMass: 209, category: .metalloid, group: 16, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁴", electronegativity: 2.0, density: 9.32, meltingPoint: 527, boilingPoint: 1235, discoveredBy: "Marie Curie", yearDiscovered: 1898, description: "Polonium is highly radioactive and was used as a neutron source."),
            
            Element(id: 85, symbol: "At", name: "Astatine", atomicMass: 210, category: .metalloid, group: 17, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁵", electronegativity: 2.2, density: 7, meltingPoint: 575, boilingPoint: 610, discoveredBy: "Dale R. Corson", yearDiscovered: 1940, description: "Astatine is the rarest naturally occurring element on Earth."),
            
            Element(id: 86, symbol: "Rn", name: "Radon", atomicMass: 222, category: .nobleGas, group: 18, period: 6, electronConfiguration: "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁶", electronegativity: 2.2, density: 0.00973, meltingPoint: 202, boilingPoint: 211.45, discoveredBy: "Friedrich Ernst Dorn", yearDiscovered: 1900, description: "Radon is a radioactive gas that can accumulate in buildings."),
            
            // Period 7
            Element(id: 87, symbol: "Fr", name: "Francium", atomicMass: 223, category: .alkaliMetal, group: 1, period: 7, electronConfiguration: "[Rn] 7s¹", electronegativity: 0.7, density: 1.87, meltingPoint: 300, boilingPoint: 950, discoveredBy: "Marguerite Perey", yearDiscovered: 1939, description: "Francium is extremely rare and highly radioactive."),
            
            Element(id: 88, symbol: "Ra", name: "Radium", atomicMass: 226, category: .alkalineEarthMetal, group: 2, period: 7, electronConfiguration: "[Rn] 7s²", electronegativity: 0.9, density: 5.5, meltingPoint: 973, boilingPoint: 2010, discoveredBy: "Marie Curie", yearDiscovered: 1898, description: "Radium is radioactive and was once used in luminous paint."),
            
            // Actinides
            Element(id: 89, symbol: "Ac", name: "Actinium", atomicMass: 227, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 6d¹ 7s²", electronegativity: 1.1, density: 10.07, meltingPoint: 1323, boilingPoint: 3471, discoveredBy: "Friedrich Oskar Giesel", yearDiscovered: 1899, description: "Actinium is radioactive and glows blue in the dark."),
            
            Element(id: 90, symbol: "Th", name: "Thorium", atomicMass: 232.04, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 6d² 7s²", electronegativity: 1.3, density: 11.72, meltingPoint: 2023, boilingPoint: 5061, discoveredBy: "Jöns Jacob Berzelius", yearDiscovered: 1829, description: "Thorium is being researched as a nuclear fuel alternative to uranium."),
            
            Element(id: 91, symbol: "Pa", name: "Protactinium", atomicMass: 231.04, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f² 6d¹ 7s²", electronegativity: 1.5, density: 15.37, meltingPoint: 1841, boilingPoint: 4300, discoveredBy: "Kasimir Fajans", yearDiscovered: 1913, description: "Protactinium is rare and highly radioactive."),
            
            Element(id: 92, symbol: "U", name: "Uranium", atomicMass: 238.03, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f³ 6d¹ 7s²", electronegativity: 1.38, density: 18.95, meltingPoint: 1405.3, boilingPoint: 4404, discoveredBy: "Martin Heinrich Klaproth", yearDiscovered: 1789, description: "Uranium is used as fuel in nuclear reactors and weapons."),
            
            Element(id: 93, symbol: "Np", name: "Neptunium", atomicMass: 237, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f⁴ 6d¹ 7s²", electronegativity: 1.36, density: 20.45, meltingPoint: 917, boilingPoint: 4175, discoveredBy: "Edwin McMillan", yearDiscovered: 1940, description: "Neptunium was the first transuranium element discovered."),
            
            Element(id: 94, symbol: "Pu", name: "Plutonium", atomicMass: 244, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f⁶ 7s²", electronegativity: 1.28, density: 19.84, meltingPoint: 912.5, boilingPoint: 3501, discoveredBy: "Glenn T. Seaborg", yearDiscovered: 1940, description: "Plutonium is used in nuclear weapons and spacecraft power sources."),
            
            Element(id: 95, symbol: "Am", name: "Americium", atomicMass: 243, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f⁷ 7s²", electronegativity: 1.3, density: 13.69, meltingPoint: 1449, boilingPoint: 2880, discoveredBy: "Glenn T. Seaborg", yearDiscovered: 1944, description: "Americium is used in smoke detectors."),
            
            Element(id: 96, symbol: "Cm", name: "Curium", atomicMass: 247, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f⁷ 6d¹ 7s²", electronegativity: 1.3, density: 13.51, meltingPoint: 1613, boilingPoint: 3383, discoveredBy: "Glenn T. Seaborg", yearDiscovered: 1944, description: "Curium is named after Marie and Pierre Curie."),
            
            Element(id: 97, symbol: "Bk", name: "Berkelium", atomicMass: 247, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f⁹ 7s²", electronegativity: 1.3, density: 14.79, meltingPoint: 1259, boilingPoint: 2900, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1949, description: "Berkelium is named after Berkeley, California."),
            
            Element(id: 98, symbol: "Cf", name: "Californium", atomicMass: 251, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹⁰ 7s²", electronegativity: 1.3, density: 15.1, meltingPoint: 1173, boilingPoint: 1743, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1950, description: "Californium is used as a neutron source in nuclear reactors."),
            
            Element(id: 99, symbol: "Es", name: "Einsteinium", atomicMass: 252, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹¹ 7s²", electronegativity: 1.3, density: 8.84, meltingPoint: 1133, boilingPoint: 1269, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1952, description: "Einsteinium was discovered in nuclear weapon test fallout."),
            
            Element(id: 100, symbol: "Fm", name: "Fermium", atomicMass: 257, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹² 7s²", electronegativity: 1.3, density: nil, meltingPoint: 1800, boilingPoint: nil, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1952, description: "Fermium is named after physicist Enrico Fermi."),
            
            Element(id: 101, symbol: "Md", name: "Mendelevium", atomicMass: 258, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹³ 7s²", electronegativity: 1.3, density: nil, meltingPoint: 1100, boilingPoint: nil, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1955, description: "Mendelevium is named after Dmitri Mendeleev."),
            
            Element(id: 102, symbol: "No", name: "Nobelium", atomicMass: 259, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 7s²", electronegativity: 1.3, density: nil, meltingPoint: 1100, boilingPoint: nil, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 1957, description: "Nobelium is named after Alfred Nobel."),
            
            Element(id: 103, symbol: "Lr", name: "Lawrencium", atomicMass: 262, category: .actinide, group: 3, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 7s² 7p¹", electronegativity: 1.3, density: nil, meltingPoint: 1900, boilingPoint: nil, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1961, description: "Lawrencium is named after Ernest Lawrence."),
            
            Element(id: 104, symbol: "Rf", name: "Rutherfordium", atomicMass: 267, category: .transitionMetal, group: 4, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d² 7s²", electronegativity: nil, density: 23.2, meltingPoint: 2400, boilingPoint: 5800, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 1964, description: "Rutherfordium is named after Ernest Rutherford."),
            
            Element(id: 105, symbol: "Db", name: "Dubnium", atomicMass: 268, category: .transitionMetal, group: 5, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d³ 7s²", electronegativity: nil, density: 29.3, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 1967, description: "Dubnium is named after Dubna, Russia."),
            
            Element(id: 106, symbol: "Sg", name: "Seaborgium", atomicMass: 271, category: .transitionMetal, group: 6, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁴ 7s²", electronegativity: nil, density: 35.0, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Lawrence Berkeley National Laboratory", yearDiscovered: 1974, description: "Seaborgium is named after Glenn T. Seaborg."),
            
            Element(id: 107, symbol: "Bh", name: "Bohrium", atomicMass: 270, category: .transitionMetal, group: 7, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁵ 7s²", electronegativity: nil, density: 37.1, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1981, description: "Bohrium is named after Niels Bohr."),
            
            Element(id: 108, symbol: "Hs", name: "Hassium", atomicMass: 277, category: .transitionMetal, group: 8, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁶ 7s²", electronegativity: nil, density: 40.7, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1984, description: "Hassium is named after Hesse, Germany."),
            
            Element(id: 109, symbol: "Mt", name: "Meitnerium", atomicMass: 276, category: .unknown, group: 9, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁷ 7s²", electronegativity: nil, density: 37.4, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1982, description: "Meitnerium is named after Lise Meitner."),
            
            Element(id: 110, symbol: "Ds", name: "Darmstadtium", atomicMass: 281, category: .unknown, group: 10, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁸ 7s²", electronegativity: nil, density: 34.8, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1994, description: "Darmstadtium is named after Darmstadt, Germany."),
            
            Element(id: 111, symbol: "Rg", name: "Roentgenium", atomicMass: 280, category: .unknown, group: 11, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d⁹ 7s²", electronegativity: nil, density: 28.7, meltingPoint: nil, boilingPoint: nil, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1994, description: "Roentgenium is named after Wilhelm Röntgen."),
            
            Element(id: 112, symbol: "Cn", name: "Copernicium", atomicMass: 285, category: .transitionMetal, group: 12, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s²", electronegativity: nil, density: 23.7, meltingPoint: nil, boilingPoint: 357, discoveredBy: "Gesellschaft für Schwerionenforschung", yearDiscovered: 1996, description: "Copernicium is named after Nicolaus Copernicus."),
            
            Element(id: 113, symbol: "Nh", name: "Nihonium", atomicMass: 286, category: .unknown, group: 13, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p¹", electronegativity: nil, density: 16, meltingPoint: 700, boilingPoint: 1400, discoveredBy: "RIKEN", yearDiscovered: 2003, description: "Nihonium is named after Japan (Nihon in Japanese)."),
            
            Element(id: 114, symbol: "Fl", name: "Flerovium", atomicMass: 289, category: .unknown, group: 14, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p²", electronegativity: nil, density: 14, meltingPoint: 340, boilingPoint: 420, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 1998, description: "Flerovium is named after Flerov Laboratory."),
            
            Element(id: 115, symbol: "Mc", name: "Moscovium", atomicMass: 288, category: .unknown, group: 15, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p³", electronegativity: nil, density: 13.5, meltingPoint: 670, boilingPoint: 1400, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 2003, description: "Moscovium is named after Moscow."),
            
            Element(id: 116, symbol: "Lv", name: "Livermorium", atomicMass: 293, category: .unknown, group: 16, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁴", electronegativity: nil, density: 12.9, meltingPoint: 709, boilingPoint: 1085, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 2000, description: "Livermorium is named after Lawrence Livermore National Laboratory."),
            
            Element(id: 117, symbol: "Ts", name: "Tennessine", atomicMass: 294, category: .unknown, group: 17, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁵", electronegativity: nil, density: 7.2, meltingPoint: 723, boilingPoint: 883, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 2010, description: "Tennessine is named after Tennessee, USA."),
            
            Element(id: 118, symbol: "Og", name: "Oganesson", atomicMass: 294, category: .unknown, group: 18, period: 7, electronConfiguration: "[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁶", electronegativity: nil, density: 5.0, meltingPoint: 325, boilingPoint: 450, discoveredBy: "Joint Institute for Nuclear Research", yearDiscovered: 2002, description: "Oganesson is named after Yuri Oganessian and is the heaviest known element.")
        ]
    }
    
    func element(byAtomicNumber number: Int) -> Element? {
        return elements.first { $0.atomicNumber == number }
    }
    
    func element(bySymbol symbol: String) -> Element? {
        return elements.first { $0.symbol.lowercased() == symbol.lowercased() }
    }
    
    func elements(byCategory category: ElementCategory) -> [Element] {
        return elements.filter { $0.category == category }
    }
    
    func search(query: String) -> [Element] {
        let lowercasedQuery = query.lowercased()
        return elements.filter {
            $0.name.lowercased().contains(lowercasedQuery) ||
            $0.symbol.lowercased().contains(lowercasedQuery) ||
            String($0.atomicNumber).contains(lowercasedQuery)
        }
    }
}
