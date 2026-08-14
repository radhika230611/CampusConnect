import SwiftUI

struct RolePage: View {
    
    var body: some View {
        
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.2),
                        Color.blue.opacity(0.08),
                        Color.blue.opacity(0.14)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    Text("Welcome to Campus Connect 👋")
                        .font(.system(size: 25, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Text("How would you like to continue?")
                        .font(.system(size: 15))
                        .foregroundStyle(.secondary)
                        .padding(.top, 8)
                        .padding(.bottom, 35)
                    
                    
                    // Student Card
                    ZStack(alignment: .bottomTrailing) {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "graduationcap.fill")
                                .font(.system(size: 38))
                                .foregroundStyle(.blue)
                                .frame(width: 75, height: 75)
                                .background(Color.blue.opacity(0.12), in: Circle())
                            
                            Text("Student")
                                .font(.system(size: 23, weight: .bold))
                            
                            Text("Access campus events, notices, transport, and community.")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .lineSpacing(3)
                                .frame(maxWidth: 280)
                        }
                        .padding(.vertical, 22)
                        .padding(.horizontal, 20)
                        
                        
                        NavigationLink {
                            StudentLoginView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 40, height: 40)
                                .background(.blue, in: Circle())
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                            
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .blue.opacity(0.12), radius: 10, y: 5)
                    .padding(.horizontal, 20)
                    
                    
                    // Admin Card
                    ZStack(alignment: .bottomTrailing) {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "lock.badge.clock.fill")
                                .font(.system(size: 38))
                                .foregroundStyle(.blue)
                                .frame(width: 75, height: 75)
                                .background(Color.blue.opacity(0.12), in: Circle())
                            
                            Text("Admin")
                                .font(.system(size: 23, weight: .bold))
                            
                            Text("Manage events, notices, transport, and campus content.")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .lineSpacing(3)
                                .frame(maxWidth: 280)
                        }
                        .padding(.vertical, 22)
                        .padding(.horizontal, 20)
                        
                        
                        NavigationLink {
                            AdminLoginView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 42, height: 42)
                                .background(.blue, in: Circle())
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .blue.opacity(0.12), radius: 10, y: 5)
                    .padding(.horizontal, 20)
                    .padding(.top, 18)
                    
                    Spacer()
                }
                .padding(.top, 50)
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RolePage()
}
