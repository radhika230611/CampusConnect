import SwiftUI
import FirebaseAuth

struct StudentLoginView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    @State private var message = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        
        if isLoggedIn {
            MainPage()
        } else {
           
                ZStack {
                    
                    Color(red: 0.97, green: 0.98, blue: 1.00)
                        .ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: 22) {
                            
                            
                            
                            // Header
                            VStack(spacing: 10) {
                                
                                Image(systemName: "graduationcap.fill")
                                    .font(.system(size: 35, weight: .semibold))
                                    .foregroundStyle(.blue)
                                    .frame(width: 75, height: 75)
                                    .background(Color.blue.opacity(0.12), in: Circle())
                                
                                Text("Welcome 👋")
                                    .font(.system(size: 26, weight: .bold))
                                
                                Text("Login to continue your campus journey")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.top, 10)
                            
                            
                            // Login Card
                            VStack(alignment: .leading, spacing: 18) {
                                
                                Text("College Email")
                                    .font(.system(size: 13, weight: .semibold))
                                
                                TextField("Enter college email", text: $email)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 15)
                                    .frame(height: 50)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                    )
                                
                                
                                Text("Password")
                                    .font(.system(size: 13, weight: .semibold))
                                
                                HStack {
                                    if isPasswordVisible {
                                        TextField("Enter password", text: $password)
                                    } else {
                                        SecureField("Enter password", text: $password)
                                    }
                                    
                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .font(.system(size: 14))
                                .padding(.horizontal, 15)
                                .frame(height: 50)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                )
                                
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("Forgot Password?")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                
                                
                                Button {
                                    authservice.logIn(email: email, Password: password) { resultMessage, success in
                                        message = resultMessage
                                        isLoggedIn = success
                                    }
                                } label: {
                                    Text("Login")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 52)
                                        .background(.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 14))
                                        .shadow(color: .blue.opacity(0.18), radius: 6, y: 3)
                                }
                                if !message.isEmpty{
                                    Text(message)
                                        .font(.footnote)
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(isLoggedIn ? .green : .red)
                                        .multilineTextAlignment(.center)
                                }
                                    

                            }
                            .padding(22)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.04), radius: 8, y: 4)
                            
                            
                            // Divider
                            HStack(spacing: 12) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 1)
                                
                                Text("or")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 1)
                            }
                            .padding(.horizontal, 20)
                            
                            
                            // Google Login
                            Button {
                                
                            } label: {
                                HStack(spacing: 10) {
                                    
                                    Image(systemName: "globe")
                                        .foregroundStyle(.blue)
                                    
                                    Text("Continue with Google")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.primary)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                )
                            }
                            
                            
                            // Sign Up
                            HStack(spacing: 5) {
                                Text("Don't have an account?")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                                
                                NavigationLink {
                                    StudentSignUpView(message: $message, isLoggedIn: $isLoggedIn)
                                } label: {
                                    Text("Sign Up")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundStyle(.blue)
                                }
                            }
                            .padding(.bottom, 20)
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 15)
                    }
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}


#Preview {
    StudentLoginView()
}
