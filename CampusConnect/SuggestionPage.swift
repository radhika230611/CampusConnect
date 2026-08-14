import SwiftUI

struct SuggestionPage: View {
    
    enum FeedbackType: String, CaseIterable {
        case suggestion = "Suggestion"
        case complaint = "Complaint"
    }
    
    @State private var selectedType: FeedbackType = .suggestion
    @State private var message = ""
    @State private var submitted = false
    
    var body: some View {
        
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 22) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 12) {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.blue)
                                .frame(width: 44, height: 44)
                                .background(Color.blue.opacity(0.10), in: Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Your Feedback Matters")
                                    .font(.system(size: 17, weight: .bold))
                                
                                Text("Help us make campus life better.")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                    // Feedback Type
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Feedback Type")
                            .font(.system(size: 13, weight: .semibold))
                        
                        Picker("Feedback Type", selection: $selectedType) {
                            ForEach(FeedbackType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    // Message
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Message")
                                .font(.system(size: 13, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(message.count)/500")
                                .font(.system(size: 11))
                                .foregroundStyle(.secondary)
                        }
                        
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.12), lineWidth: 1)
                            
                            TextEditor(text: $message)
                                .font(.system(size: 15))
                                .padding(10)
                                .frame(height: 190)
                                .scrollContentBackground(.hidden)
                                .onChange(of: message) { _, newValue in
                                    if newValue.count > 500 {
                                        message = String(newValue.prefix(500))
                                    }
                                }
                            
                            if message.isEmpty {
                                Text(selectedType == .suggestion ? "Describe your suggestion..." : "Describe your complaint...")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.secondary)
                                    .padding(.top, 18)
                                    .padding(.leading, 16)
                                    .allowsHitTesting(false)
                            }
                        }
                        .shadow(color: .black.opacity(0.03), radius: 6, y: 2)
                    }
                    
                    // Submit
                    Button {
                        if !message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            withAnimation(.easeInOut) {
                                submitted = true
                            }
                            message = ""
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "paperplane.fill")
                            Text("Submit Feedback")
                        }
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .opacity(message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1)
                    
                    // Success
                    if submitted {
                        HStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(.green)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Feedback Submitted")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("Thank you for helping us improve!")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(16)
                        .background(Color.green.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.green.opacity(0.12), lineWidth: 1))
                        .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                    
                    // Bottom Note
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                            .padding(.top, 2)
                        
                        Text("Please avoid sharing sensitive personal information. Your feedback helps the college improve its services and student experience.")
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                            .lineSpacing(3)
                    }
                    .padding(.top, 4)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
            }
        }
            .navigationTitle("Feedback")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    SuggestionPage()
}
