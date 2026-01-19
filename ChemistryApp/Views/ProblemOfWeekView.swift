//
//  ProblemOfWeekView.swift
//  ChemistryApp
//
//  Created by Jihun Jo
//

import SwiftUI

struct ProblemOfWeekView: View {
    @State private var currentProblem: ChemistryProblem = ChemistryProblem.sampleProblem
    @State private var userAnswer: String = ""
    @State private var showResult: Bool = false
    @State private var isCorrect: Bool = false
    @State private var showSolution: Bool = false
    @State private var showLeaderboard: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Problem Card
                    ProblemCard(problem: currentProblem)
                    
                    // Answer Input Section
                    AnswerSection(
                        userAnswer: $userAnswer,
                        showResult: showResult,
                        isCorrect: isCorrect,
                        onSubmit: checkAnswer
                    )
                    
                    // Result Feedback
                    if showResult {
                        ResultFeedback(isCorrect: isCorrect)
                    }
                    
                    // Solution Button
                    if showResult {
                        SolutionSection(
                            problem: currentProblem,
                            showSolution: $showSolution
                        )
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding()
            }
            .navigationTitle("Problem of the Week")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showLeaderboard = true
                    } label: {
                        Image(systemName: "trophy")
                    }
                }
            }
            .sheet(isPresented: $showLeaderboard) {
                LeaderboardView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func checkAnswer() {
        let trimmedAnswer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let correctAnswer = currentProblem.answer.lowercased()
        
        isCorrect = trimmedAnswer == correctAnswer
        showResult = true
    }
}

// MARK: - Problem Model
struct ChemistryProblem: Identifiable {
    let id = UUID()
    let weekNumber: Int
    let title: String
    let question: String
    let hint: String?
    let answer: String
    let solution: String
    let difficulty: ProblemDifficulty
    let topic: String
    
    static let sampleProblem = ChemistryProblem(
        weekNumber: 1,
        title: "Balancing Equations",
        question: "Balance the following chemical equation:\n\n__Fe + __O₂ → __Fe₂O₃\n\nWhat is the coefficient for O₂?",
        hint: "Remember that atoms must be conserved on both sides.",
        answer: "3",
        solution: "Step 1: Count atoms on each side\n• Left: Fe = 1, O = 2\n• Right: Fe = 2, O = 3\n\nStep 2: Balance Fe first\n• 2Fe + O₂ → Fe₂O₃\n\nStep 3: Balance O\n• 4Fe + 3O₂ → 2Fe₂O₃\n\nThe coefficient for O₂ is 3.",
        difficulty: .medium,
        topic: "Chemical Equations"
    )
}

enum ProblemDifficulty: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var color: Color {
        switch self {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
}

// MARK: - Problem Card
struct ProblemCard: View {
    let problem: ChemistryProblem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Week \(problem.weekNumber)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(AppTheme.primaryColor)
                    .cornerRadius(8)
                
                Spacer()
                
                Text(problem.difficulty.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(problem.difficulty.color)
                    .cornerRadius(8)
            }
            
            // Title
            Text(problem.title)
                .font(.title2)
                .fontWeight(.bold)
            
            // Topic
            HStack {
                Image(systemName: "tag")
                Text(problem.topic)
            }
            .font(.caption)
            .foregroundColor(.secondary)
            
            Divider()
            
            // Question
            Text(problem.question)
                .font(.body)
                .lineSpacing(4)
            
            // Hint
            if let hint = problem.hint {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                    Text("Hint: \(hint)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(AppTheme.cardBackground)
        .cornerRadius(16)
    }
}

// MARK: - Answer Section
struct AnswerSection: View {
    @Binding var userAnswer: String
    let showResult: Bool
    let isCorrect: Bool
    let onSubmit: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("Enter your answer", text: $userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title3)
                .disabled(showResult)
            
            Button(action: onSubmit) {
                HStack {
                    Image(systemName: showResult ? (isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill") : "paperplane.fill")
                    Text(showResult ? (isCorrect ? "Correct!" : "Incorrect") : "Submit Answer")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(showResult ? (isCorrect ? Color.green : Color.red) : AppTheme.primaryColor)
                .cornerRadius(12)
            }
            .disabled(userAnswer.isEmpty || showResult)
        }
    }
}

// MARK: - Result Feedback
struct ResultFeedback: View {
    let isCorrect: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isCorrect ? "star.fill" : "arrow.counterclockwise")
                .font(.title)
                .foregroundColor(isCorrect ? .yellow : .orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(isCorrect ? "Good Job! 🎉" : "Keep Trying!")
                    .font(.headline)
                
                Text(isCorrect ? "You've solved this week's problem!" : "Check the solution below to learn more.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(isCorrect ? Color.green.opacity(0.1) : Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Solution Section
struct SolutionSection: View {
    let problem: ChemistryProblem
    @Binding var showSolution: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation {
                    showSolution.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: showSolution ? "chevron.up" : "chevron.down")
                    Text(showSolution ? "Hide Solution" : "Show Solution")
                    Spacer()
                }
                .font(.headline)
                .foregroundColor(AppTheme.primaryColor)
            }
            
            if showSolution {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Solution")
                        .font(.headline)
                    
                    Text("Answer: \(problem.answer)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(AppTheme.primaryColor)
                    
                    Divider()
                    
                    Text(problem.solution)
                        .font(.body)
                        .lineSpacing(4)
                }
                .padding()
                .background(AppTheme.cardBackground)
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - Leaderboard View
struct LeaderboardView: View {
    @Environment(\.dismiss) var dismiss
    
    let topSolvers: [(name: String, score: Int, rank: Int)] = [
        ("Alex Chen", 150, 1),
        ("Maria Garcia", 145, 2),
        ("James Wilson", 140, 3),
        ("Emma Johnson", 135, 4),
        ("David Kim", 130, 5),
        ("Sophie Brown", 125, 6),
        ("Michael Lee", 120, 7),
        ("Olivia Davis", 115, 8),
        ("William Taylor", 110, 9),
        ("Isabella Martinez", 105, 10)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(topSolvers, id: \.rank) { solver in
                    HStack(spacing: 16) {
                        // Rank
                        ZStack {
                            Circle()
                                .fill(rankColor(solver.rank))
                                .frame(width: 36, height: 36)
                            
                            if solver.rank <= 3 {
                                Image(systemName: "crown.fill")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            } else {
                                Text("\(solver.rank)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        // Name
                        VStack(alignment: .leading, spacing: 2) {
                            Text(solver.name)
                                .font(.headline)
                            
                            Text("\(solver.score) points")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        // Trophy for top 3
                        if solver.rank <= 3 {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(rankColor(solver.rank))
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Leaderboard")
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
    
    private func rankColor(_ rank: Int) -> Color {
        switch rank {
        case 1: return Color(red: 1.0, green: 0.84, blue: 0.0) // Gold
        case 2: return Color(red: 0.75, green: 0.75, blue: 0.75) // Silver
        case 3: return Color(red: 0.8, green: 0.5, blue: 0.2) // Bronze
        default: return AppTheme.primaryColor
        }
    }
}

#Preview {
    ProblemOfWeekView()
}
