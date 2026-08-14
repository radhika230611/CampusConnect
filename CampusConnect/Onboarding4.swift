import SwiftUI

struct Onboarding4: View {
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
                    
                    // Skip
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            StudentLoginView()
                        } label: {
                            Text("Skip")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.black)
                        }
                    }
                    Spacer()
                    
                    Image("Onboarding4.1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                    
                    // Heading
                    Text("Connect with your Campus")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.primary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 16)
                    
                    // Description
                    Text("Discover clubs, communities, lost and found, and more.")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 35)
                        .padding(.top, 6)
                    
                    
                    Spacer()
                    
                    // Bottom Navigation
                    ZStack {
                        HStack(spacing: 5) {
                            ForEach(0..<4) { i in
                                Capsule()
                                    .fill(i == 3 ? Color.blue : Color.gray.opacity(0.3))
                                    .frame(width: i == 3 ? 20 : 7, height: 6)
                            }
                        }
                        
                        // Finish Button
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                StudentLoginView()
                            } label: {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame(width: 48, height: 48)
                                    .background(.blue, in: Circle())
                                    .shadow(color: .blue.opacity(0.18), radius: 7, y: 3)
                            }
                        }
                    }
                    .padding(.bottom, 5)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 20)
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding4()
}
