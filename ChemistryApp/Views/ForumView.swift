//
//  ForumView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct ForumView: View {
    @State private var posts: [ForumPost] = ForumPost.samplePosts
    @State private var showNewPost = false
    @State private var selectedPost: ForumPost?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(posts) { post in
                    ForumPostRow(post: post)
                        .onTapGesture {
                            selectedPost = post
                        }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Forum")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewPost = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $showNewPost) {
                NewPostView { newPost in
                    posts.insert(newPost, at: 0)
                }
            }
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Forum Post Model
struct ForumPost: Identifiable {
    let id = UUID()
    let author: String
    let title: String
    let content: String
    let date: Date
    let category: PostCategory
    var likes: Int
    var comments: [Comment]
    
    static let samplePosts: [ForumPost] = [
        ForumPost(
            author: "ChemStudent23",
            title: "Help with electron configuration!",
            content: "I'm having trouble understanding how to write electron configurations for transition metals. Can someone explain why Chromium is [Ar] 3d⁵ 4s¹ instead of [Ar] 3d⁴ 4s²?",
            date: Date().addingTimeInterval(-3600),
            category: .question,
            likes: 12,
            comments: [
                Comment(author: "ProfChem", content: "Great question! Half-filled d orbitals are more stable due to electron exchange energy.", date: Date().addingTimeInterval(-1800)),
                Comment(author: "ScienceNerd", content: "Same reason Copper is [Ar] 3d¹⁰ 4s¹ - fully filled d orbitals are also extra stable!", date: Date().addingTimeInterval(-900))
            ]
        ),
        ForumPost(
            author: "LabRat101",
            title: "Tips for balancing redox equations",
            content: "Here's a method I found helpful for balancing redox equations in acidic solution:\n\n1. Write half-reactions\n2. Balance atoms (except O and H)\n3. Balance O with H₂O\n4. Balance H with H⁺\n5. Balance charge with e⁻\n6. Multiply and add\n\nHope this helps!",
            date: Date().addingTimeInterval(-86400),
            category: .discussion,
            likes: 45,
            comments: []
        ),
        ForumPost(
            author: "MoleculeMan",
            title: "Organic Chemistry Study Group",
            content: "Anyone interested in forming a study group for organic chemistry? We can meet virtually and go over mechanisms together. Looking for 3-4 people who are serious about learning!",
            date: Date().addingTimeInterval(-172800),
            category: .studyGroup,
            likes: 28,
            comments: [
                Comment(author: "OrganicFan", content: "I'm interested! DM me the details.", date: Date().addingTimeInterval(-86400))
            ]
        ),
        ForumPost(
            author: "ElementExplorer",
            title: "Cool fact about Gallium",
            content: "Did you know that Gallium melts at just 29.76°C? You can literally melt it in your hand! It's used in semiconductors and has some fascinating properties. What's your favorite element fact?",
            date: Date().addingTimeInterval(-259200),
            category: .discussion,
            likes: 67,
            comments: []
        )
    ]
}

struct Comment: Identifiable {
    let id = UUID()
    let author: String
    let content: String
    let date: Date
}

enum PostCategory: String, CaseIterable {
    case question = "Question"
    case discussion = "Discussion"
    case studyGroup = "Study Group"
    case resource = "Resource"
    
    var icon: String {
        switch self {
        case .question: return "questionmark.circle"
        case .discussion: return "bubble.left.and.bubble.right"
        case .studyGroup: return "person.3"
        case .resource: return "book"
        }
    }
    
    var color: Color {
        switch self {
        case .question: return .blue
        case .discussion: return .green
        case .studyGroup: return .purple
        case .resource: return .orange
        }
    }
}

// MARK: - Forum Post Row
struct ForumPostRow: View {
    let post: ForumPost
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                // Category Badge
                HStack(spacing: 4) {
                    Image(systemName: post.category.icon)
                    Text(post.category.rawValue)
                }
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(post.category.color)
                .cornerRadius(8)
                
                Spacer()
                
                // Time
                Text(timeAgo(from: post.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // Title
            Text(post.title)
                .font(.headline)
                .lineLimit(2)
            
            // Content Preview
            Text(post.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            // Footer
            HStack(spacing: 16) {
                // Author
                HStack(spacing: 4) {
                    Image(systemName: "person.circle.fill")
                    Text(post.author)
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                Spacer()
                
                // Likes
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                    Text("\(post.likes)")
                }
                .font(.caption)
                .foregroundColor(.red)
                
                // Comments
                HStack(spacing: 4) {
                    Image(systemName: "bubble.right.fill")
                    Text("\(post.comments.count)")
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func timeAgo(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

// MARK: - New Post View
struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var content = ""
    @State private var selectedCategory: PostCategory = .question
    
    let onPost: (ForumPost) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(PostCategory.allCases, id: \.self) { category in
                            HStack {
                                Image(systemName: category.icon)
                                Text(category.rawValue)
                            }
                            .tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Title")) {
                    TextField("Enter a title", text: $title)
                }
                
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(minHeight: 150)
                }
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        let newPost = ForumPost(
                            author: "You",
                            title: title,
                            content: content,
                            date: Date(),
                            category: selectedCategory,
                            likes: 0,
                            comments: []
                        )
                        onPost(newPost)
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                }
            }
        }
    }
}

// MARK: - Post Detail View
struct PostDetailView: View {
    let post: ForumPost
    @Environment(\.dismiss) var dismiss
    @State private var newComment = ""
    @State private var comments: [Comment]
    
    init(post: ForumPost) {
        self.post = post
        self._comments = State(initialValue: post.comments)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Post Content
                    VStack(alignment: .leading, spacing: 12) {
                        // Category & Date
                        HStack {
                            HStack(spacing: 4) {
                                Image(systemName: post.category.icon)
                                Text(post.category.rawValue)
                            }
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(post.category.color)
                            .cornerRadius(8)
                            
                            Spacer()
                            
                            Text(post.date, style: .relative)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        // Title
                        Text(post.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // Author
                        HStack {
                            Image(systemName: "person.circle.fill")
                            Text(post.author)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        // Content
                        Text(post.content)
                            .font(.body)
                            .lineSpacing(4)
                        
                        // Likes
                        HStack {
                            Button {
                                // Like action
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "heart")
                                    Text("\(post.likes) Likes")
                                }
                            }
                            .foregroundColor(.red)
                        }
                        .font(.subheadline)
                    }
                    .padding()
                    .background(AppTheme.cardBackground)
                    .cornerRadius(12)
                    
                    // Comments Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Comments (\(comments.count))")
                            .font(.headline)
                        
                        if comments.isEmpty {
                            Text("No comments yet. Be the first to comment!")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            ForEach(comments) { comment in
                                CommentRow(comment: comment)
                            }
                        }
                        
                        // New Comment Input
                        HStack {
                            TextField("Add a comment...", text: $newComment)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button {
                                let comment = Comment(
                                    author: "You",
                                    content: newComment,
                                    date: Date()
                                )
                                comments.append(comment)
                                newComment = ""
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(AppTheme.primaryColor)
                            }
                            .disabled(newComment.isEmpty)
                        }
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Post")
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

// MARK: - Comment Row
struct CommentRow: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(comment.author)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text(comment.date, style: .relative)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(comment.content)
                .font(.subheadline)
        }
        .padding()
        .background(Color(UIColor.tertiarySystemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    ForumView()
}
