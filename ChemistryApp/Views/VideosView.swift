//
//  VideosView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI
import WebKit

struct VideosView: View {
    @State private var selectedVideo: ChemistryVideo?
    @State private var expandedCategories: Set<String> = ["Chemical Bonding", "Basics"]
    
    private var categories: [String] {
        let allCategories = ChemistryVideo.sampleVideos.map { $0.category }
        return Array(Set(allCategories)).sorted()
    }
    
    private func videos(for category: String) -> [ChemistryVideo] {
        ChemistryVideo.sampleVideos.filter { $0.category == category }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.self) { category in
                    Section {
                        if expandedCategories.contains(category) {
                            ForEach(videos(for: category)) { video in
                                VideoRow(video: video)
                                    .onTapGesture {
                                        selectedVideo = video
                                    }
                            }
                        }
                    } header: {
                        CategoryHeader(
                            title: category,
                            isExpanded: expandedCategories.contains(category),
                            onTap: {
                                withAnimation {
                                    if expandedCategories.contains(category) {
                                        expandedCategories.remove(category)
                                    } else {
                                        expandedCategories.insert(category)
                                    }
                                }
                            }
                        )
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Videos")
            .sheet(item: $selectedVideo) { video in
                VideoPlayerView(video: video)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Category Header
struct CategoryHeader: View {
    let title: String
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text(isExpanded ? "Retract" : "Expand")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

// MARK: - Video Model
struct ChemistryVideo: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let youtubeID: String
    let duration: String
    let category: String
    
    var thumbnailURL: URL? {
        URL(string: "https://img.youtube.com/vi/\(youtubeID)/mqdefault.jpg")
    }
    
    static let sampleVideos: [ChemistryVideo] = [
        // Basics
        ChemistryVideo(
            title: "Introduction to the Periodic Table",
            description: "Learn the basics of the periodic table and how elements are organized.",
            youtubeID: "rz4Dd1I_fX0",
            duration: "12:34",
            category: "Basics"
        ),
        ChemistryVideo(
            title: "States of Matter",
            description: "Understanding solids, liquids, gases and phase transitions.",
            youtubeID: "pKvo0XWZtjo",
            duration: "11:20",
            category: "Basics"
        ),
        // Chemical Bonding
        ChemistryVideo(
            title: "Chemical Bonding Explained",
            description: "Understanding ionic, covalent, and metallic bonds.",
            youtubeID: "CGA8sRwqIFg",
            duration: "15:22",
            category: "Chemical Bonding"
        ),
        ChemistryVideo(
            title: "Covalent vs Ionic Bonds",
            description: "The key differences between covalent and ionic bonding.",
            youtubeID: "Xz6rW9gfCPM",
            duration: "13:45",
            category: "Chemical Bonding"
        ),
        // Reactions
        ChemistryVideo(
            title: "Balancing Chemical Equations",
            description: "Step by step guide to balancing chemical equations.",
            youtubeID: "RnGu3xO2h74",
            duration: "10:45",
            category: "Reactions"
        ),
        // Acids & Bases
        ChemistryVideo(
            title: "Acids and Bases",
            description: "Learn about pH, acids, bases, and neutralization reactions.",
            youtubeID: "ANi709MYnWg",
            duration: "18:30",
            category: "Acids & Bases"
        ),
        // Organic Chemistry
        ChemistryVideo(
            title: "Organic Chemistry Basics",
            description: "Introduction to carbon compounds and functional groups.",
            youtubeID: "GQynrcpBABA",
            duration: "20:15",
            category: "Organic Chemistry"
        ),
        ChemistryVideo(
            title: "Functional Groups Overview",
            description: "Learn about alcohols, aldehydes, ketones, and more.",
            youtubeID: "VkPkwmOJe6w",
            duration: "16:40",
            category: "Organic Chemistry"
        )
    ]
}

// MARK: - Video Row
struct VideoRow: View {
    let video: ChemistryVideo
    
    var body: some View {
        HStack(spacing: 12) {
            // Thumbnail
            AsyncImage(url: video.thumbnailURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "play.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    )
            }
            .frame(width: 120, height: 68)
            .cornerRadius(8)
            .overlay(
                Text(video.duration)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .padding(4),
                alignment: .bottomTrailing
            )
            
            // Info
            VStack(alignment: .leading, spacing: 4) {
                Text(video.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Text(video.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(video.category)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(AppTheme.primaryColor)
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Video Player View
struct VideoPlayerView: View {
    let video: ChemistryVideo
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // YouTube Player
                YouTubePlayerView(videoID: video.youtubeID)
                    .frame(height: 220)
                
                // Video Info
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(video.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        HStack {
                            Label(video.duration, systemImage: "clock")
                            Spacer()
                            Label(video.category, systemImage: "folder")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        Text("Description")
                            .font(.headline)
                        
                        Text(video.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                }
            }
            .navigationTitle("Now Playing")
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

// MARK: - YouTube Player (WKWebView)
struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let embedHTML = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
            <style>
                body { margin: 0; padding: 0; background-color: #000; }
                .video-container {
                    position: relative;
                    width: 100%;
                    padding-bottom: 56.25%;
                    height: 0;
                    overflow: hidden;
                }
                .video-container iframe {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    border: 0;
                }
            </style>
        </head>
        <body>
            <div class="video-container">
                <iframe 
                    src="https://www.youtube.com/embed/\(videoID)?playsinline=1&rel=0&modestbranding=1"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
                </iframe>
            </div>
        </body>
        </html>
        """
        
        webView.loadHTMLString(embedHTML, baseURL: nil)
    }
}

#Preview {
    VideosView()
}
