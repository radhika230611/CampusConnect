import SwiftUI

struct LaunchPage: View {

    @State private var showOnboarding = false

    var body: some View {
        
        NavigationStack{
            ZStack {
                if showOnboarding {
                    Onboarding1()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    
                } else {
                    ZStack {
                        
                        Image("LaunchPage")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        
                        VStack {
                            
                            Image("logoo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            
                            Text("CAMPUS")
                                .font(.system(size: 40, weight: .bold))
                            
                            Text("CONNECT")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(.blue)
                            
                            Text("Stay Connected. Stay Informed.")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.gray)
                                .padding(.top,10)
                        }
                        
                    }
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    
                    withAnimation(.easeInOut(duration: 0.8)) {
                        
                        showOnboarding = true
                        
                    }
                    
                }
                
            }
        }
        

    }
}


#Preview {
    LaunchPage()
}
