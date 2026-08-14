import SwiftUI

struct Club: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
    let members: String
}

struct ClubsSocietiesPage: View {
    
    @State private var searchText = ""
    
    let clubs = [
        Club(name: "Coding Club", description: "Programming & technology", icon: "chevron.left.forwardslash.chevron.right", members: "120"),
        Club(name: "Cultural Club", description: "Music, dance & drama", icon: "music.note", members: "85"),
        Club(name: "Sports Club", description: "Games & tournaments", icon: "sportscourt.fill", members: "150"),
        Club(name: "Photography", description: "Photography & creativity", icon: "camera.fill", members: "64"),
        Club(name: "AI Club", description: "AI & machine learning", icon: "brain.head.profile", members: "72"),
        Club(name: "Literary Club", description: "Writing & literature", icon: "book.fill", members: "48")
    ]
    
    var body: some View {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        
                        // Hero
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Find Your Community")
                                        .font(.system(size: 23, weight: .bold))
                                    
                                    Text("Explore clubs, discover new interests and connect with students who share your passions.")
                                        .font(.system(size: 13))
                                        .foregroundStyle(.secondary)
                                        .lineSpacing(3)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "person.3.fill")
                                    .font(.system(size: 24))
                                    .foregroundStyle(.white)
                                    .frame(width: 52, height: 52)
                                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        .padding(20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .shadow(color: .blue.opacity(0.06), radius: 10, y: 4)
                        
                        // Search
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            
                            TextField("Search clubs and societies", text: $searchText)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 15)
                        .frame(height: 46)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 13))
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray.opacity(0.10), lineWidth: 1))
                        
                        // Section Header
                        HStack {
                            Text("Explore")
                                .font(.system(size: 18, weight: .bold))
                            
                            Spacer()
                            
                            Text("\(clubs.count) clubs")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.secondary)
                        }
                        
                        // Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ], spacing: 12) {
                            ForEach(clubs) { club in
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: club.icon)
                                            .font(.system(size: 21, weight: .medium))
                                            .foregroundStyle(.blue)
                                            .frame(width: 46, height: 46)
                                            .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 13))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.up.right")
                                            .font(.system(size: 11, weight: .semibold))
                                            .foregroundStyle(.secondary)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(club.name)
                                            .font(.system(size: 15, weight: .bold))
                                            .foregroundStyle(.primary)
                                        
                                        Text(club.description)
                                            .font(.system(size: 11))
                                            .foregroundStyle(.secondary)
                                            .lineLimit(2)
                                    }
                                    
                                    HStack(spacing: 5) {
                                        Image(systemName: "person.2.fill")
                                            .font(.system(size: 9))
                                        
                                        Text("\(club.members) members")
                                            .font(.system(size: 10, weight: .medium))
                                    }
                                    .foregroundStyle(.blue)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(15)
                                .frame(minHeight: 170)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                                .shadow(color: .black.opacity(0.035), radius: 6, y: 2)
                                
                            }
                        }
                        
                        // Bottom Info
                        HStack(spacing: 12) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 17))
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Can't find your interest?")
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Text("Talk to the student activities team.")
                                    .font(.system(size: 11))
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(15)
                        .background(Color.blue.opacity(0.07), in: RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
            }
        .navigationTitle("Clubs & Societies")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

#Preview {
    NavigationStack {
        ClubsSocietiesPage()
    }
}
