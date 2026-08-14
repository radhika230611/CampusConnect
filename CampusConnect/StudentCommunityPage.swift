import SwiftUI

struct StudentCommunityPage: View {
    
    @State private var searchText = ""
    
    let communityActions = [
        (icon: "plus.bubble.fill", title: "New Post"),
        (icon: "person.2.fill", title: "My Groups"),
        (icon: "bookmark.fill", title: "Saved")
    ]
    
    let discussions = [
        (
            icon: "questionmark.circle.fill",
            title: "Best places to study on campus?",
            author: "Aman • 20 min ago",
            replies: "12 replies"
        ),
        (
            icon: "calendar.badge.clock",
            title: "Anyone attending the upcoming fest?",
            author: "Priya • 1 hr ago",
            replies: "8 replies"
        ),
        (
            icon: "book.fill",
            title: "Resources for semester preparation",
            author: "Rahul • 3 hrs ago",
            replies: "15 replies"
        ),
        (
            icon: "graduationcap.fill",
            title: "Looking for project teammates",
            author: "Neha • 5 hrs ago",
            replies: "6 replies"
        )
    ]
    
    var body: some View {
       
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Header Card
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 22))
                                    .foregroundStyle(.blue)
                                    .frame(width: 48, height: 48)
                                    .background(Color.blue.opacity(0.10), in: Circle())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("Student Community")
                                        .font(.system(size: 20, weight: .bold))
                                    
                                    Text("Connect with students across campus")
                                        .font(.system(size: 13))
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                            }
                            
                            Text("Share ideas, ask questions, discuss campus life and connect with fellow students.")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                                .lineSpacing(4)
                        }
                        .padding(20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue.opacity(0.08), lineWidth: 1))
                        .shadow(color: .blue.opacity(0.05), radius: 10, y: 4)
                        
                        // Search
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            
                            TextField("Search discussions", text: $searchText)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 14)
                        .frame(height: 46)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.10), lineWidth: 1))
                        
                        // Community
                        Text("Community")
                            .font(.system(size: 17, weight: .bold))
                        
                        HStack(spacing: 12) {
                            ForEach(communityActions, id: \.title) { action in
                                VStack(spacing: 8) {
                                    Image(systemName: action.icon)
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundStyle(.blue)
                                        .frame(width: 42, height: 42)
                                        .background(Color.blue.opacity(0.10), in: Circle())
                                    
                                    Text(action.title)
                                        .font(.system(size: 11, weight: .medium))
                                        .foregroundStyle(.primary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                            }
                        }
                        
                        // Discussions
                        Text("Recent Discussions")
                            .font(.system(size: 17, weight: .bold))
                            .padding(.top, 4)
                        
                        VStack(spacing: 12) {
                            ForEach(discussions, id: \.title) { discussion in
                                HStack(spacing: 13) {
                                    Image(systemName: discussion.icon)
                                        .font(.system(size: 18))
                                        .foregroundStyle(.blue)
                                        .frame(width: 42, height: 42)
                                        .background(Color.blue.opacity(0.10), in: Circle())
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(discussion.title)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(.primary)
                                            .lineLimit(2)
                                        
                                        HStack(spacing: 6) {
                                            Text(discussion.author)
                                            Circle().frame(width: 3, height: 3)
                                            Text(discussion.replies)
                                        }
                                        .font(.system(size: 11))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 11, weight: .semibold))
                                        .foregroundStyle(.secondary)
                                }
                                .padding(15)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                                .shadow(color: .black.opacity(0.03), radius: 5, y: 2)
                            }
                        }
                        
                        // Community Guidelines
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "shield.checkered")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Be respectful")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("Keep discussions helpful, respectful and relevant to the student community.")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                    .lineSpacing(3)
                            }
                        }
                        .padding(16)
                        .background(Color.blue.opacity(0.06), in: RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
            
        }
        .navigationTitle("Student Community")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StudentCommunityPage()
    }
}
