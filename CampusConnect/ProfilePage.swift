import SwiftUI

struct ProfilePage: View {
    
    var body: some View {
       
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.12),
                        Color.blue.opacity(0.04),
                        Color.white
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        
                        // Profile Header
                        VStack(spacing: 12) {
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.white)
                                .frame(width: 90, height: 90)
                                .background(.blue, in: Circle())
                                .shadow(color: .blue.opacity(0.2), radius: 10, y: 5)
                            
                            Text("Radhika Mittal")
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("radhika.mittal@gmail.com")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 25)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(Color.blue.opacity(0.08), lineWidth: 1))
                        .shadow(color: .black.opacity(0.04), radius: 8, y: 3)
                        
                        
                        // Roll Number
                        HStack(spacing: 15) {
                            Image(systemName: "number.square.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 42, height: 42)
                                .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Roll Number")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                
                                Text("28240118")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            Spacer()
                        }
                        .padding(15)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                        
                        
                        // Course
                        HStack(spacing: 15) {
                            Image(systemName: "book.closed.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 42, height: 42)
                                .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Course")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                
                                Text("B.Tech CSE")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            Spacer()
                        }
                        .padding(15)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                        
                        
                        // Date of Birth
                        HStack(spacing: 15) {
                            Image(systemName: "calendar")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 42, height: 42)
                                .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Date of Birth")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                
                                Text("23 Nov 2006")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            Spacer()
                        }
                        .padding(15)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                        
                        
                        // Edit Button
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit Profile")
                            }
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(.blue, in: RoundedRectangle(cornerRadius: 14))
                            .shadow(color: .blue.opacity(0.18), radius: 8, y: 4)
                        }
                        .padding(.top, 5)
                    }
                    .padding(16)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfilePage()
}
