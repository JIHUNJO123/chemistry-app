# ChemistryApp

A comprehensive iOS app for chemistry education built with SwiftUI.

## Features

### 1. 📊 Periodic Table

- Interactive periodic table with all 118 elements
- Color-coded by element categories
- Search functionality
- Detailed element information:
  - Atomic number, mass, symbol
  - Electron configuration
  - Physical properties (density, melting/boiling points)
  - Discovery information
  - Description

### 2. 🎬 Teaching Videos

- YouTube video integration
- Videos play directly in the app
- Organized by topic categories
- Video thumbnails and descriptions

### 3. 🧩 Problem of the Week

- Weekly chemistry problems
- Submit answers and get instant feedback
- View detailed solutions
- Leaderboard for top solvers
- Difficulty levels (Easy, Medium, Hard)

### 4. 💬 Forum

- Post questions and discussions
- Comment on posts
- Categories: Questions, Discussions, Study Groups, Resources
- Like and interact with posts

## Project Structure

```
ChemistryApp/
├── ChemistryAppApp.swift      # App entry point
├── Models/
│   └── Element.swift          # Element data model
├── Data/
│   └── ElementsData.swift     # All 118 elements data
├── Theme/
│   └── AppTheme.swift         # Colors, fonts, styling
└── Views/
    ├── ContentView.swift       # Main tab view
    ├── PeriodicTableView.swift # Periodic table
    ├── ElementDetailView.swift # Element details
    ├── VideosView.swift        # Video player
    ├── ProblemOfWeekView.swift # Weekly problems
    └── ForumView.swift         # Discussion forum
```

## Setup Instructions

1. Open Xcode
2. Create a new iOS App project
3. Select "SwiftUI" for Interface
4. Copy all the Swift files into the project
5. Build and run on simulator or device

## Customization

### Change App Name & Colors

Edit `Theme/AppTheme.swift`:

```swift
static let appName = "Your App Name"
static let primaryColor = Color(red: 0.2, green: 0.5, blue: 0.8)
static let secondaryColor = Color(red: 0.3, green: 0.7, blue: 0.5)
```

### Add YouTube Videos

Edit `Views/VideosView.swift` and add videos to `ChemistryVideo.sampleVideos`:

```swift
ChemistryVideo(
    title: "Your Video Title",
    description: "Video description",
    youtubeID: "YOUR_YOUTUBE_VIDEO_ID",
    duration: "10:30",
    category: "Topic"
)
```

### Add Problems

Edit `Views/ProblemOfWeekView.swift` and modify `ChemistryProblem.sampleProblem`

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## Future Enhancements

- [ ] Firebase integration for Problem of the Week
- [ ] User authentication
- [ ] Real-time leaderboard
- [ ] Push notifications for new problems
- [ ] Offline mode for periodic table

## License

This project is for educational purposes.
