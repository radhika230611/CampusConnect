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
        }
        else{
            NavigationStack {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            //back button
                            HStack{
                                NavigationLink{
                                    RolePage()
                                }label: {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.black)
                                }
                                Spacer()
                            }.padding(.bottom, 28)
                            
                            
                            //Header
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Welcome Back 👋")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundStyle(.black)
                                
                                Text("Login to continue")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            .padding(.bottom, 32)
                            
                            
                            //College Email
                            VStack(alignment: .leading, spacing: 8) {
                                Text("College Email")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundStyle(.black)
                                
                                TextField(
                                    "Email...",
                                    text: $email
                                )
                                
                                .padding(.horizontal, 16)
                                .frame(height: 50)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                                )
                            }
                            .padding(.bottom, 20)
                            
                            
                            //Password
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Password")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundStyle(.black)
                                
                                HStack {
                                    if isPasswordVisible {
                                        TextField(
                                            "Password",
                                            text: $password
                                        )
                                    } else {
                                        SecureField(
                                            "Password",
                                            text: $password
                                        )
                                    }
                                    
                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        Image(
                                            systemName: isPasswordVisible
                                            ? "eye.slash"
                                            : "eye"
                                        )
                                        .foregroundStyle(.gray)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .frame(height: 50)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            Color.gray.opacity(0.25),
                                            lineWidth: 1
                                        )
                                )
                            }
                            
                            
                            //  Forgot Password
                            HStack {
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("Forgot Password?")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.blue)
                                }
                            }
                            .padding(.top, 12)
                            .padding(.bottom, 24)
                            
                            
                            //Login Button
                            Button (action : {
                                authservice.logIn(email: email, Password: password){ resultMessage, success in
                                    message = resultMessage
                                    isLoggedIn = success
                                }
                            })
                            {
                                Text("Login")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(
                                        LinearGradient(
                                            colors: [
                                                Color.blue,
                                                Color.blue.opacity(0.85)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                            }
                            
                            
                            //OR Divider
                            HStack(spacing: 12) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 1)
                                
                                Text("or")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                                
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 1)
                            }
                            .padding(.vertical, 20)
                            
                            
                            // Google Login
                            Button {
                                
                            } label: {
                                HStack(spacing: 10) {
                                    
                                    Image("google")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    
                                    Text("Continue with Google")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.black)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            Color.gray.opacity(0.35),
                                            lineWidth: 1
                                        )
                                )
                            }
                            
                            
                            // Sign Up
                            HStack(spacing: 4) {
                                Text("Don't have an account?")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.gray)
                                
                                NavigationLink {
                                    StudentSignUpView(message: $message, isLoggedIn: $isLoggedIn)
                                } label: {
                                    Text("Sign Up")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundStyle(Color.blue)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 24)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 10)
                    }
                }
                
            }.navigationBarBackButtonHidden()
        }
    }
}
    
#Preview {
    StudentLoginView()
}
