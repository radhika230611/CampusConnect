import SwiftUI

struct AdminLoginView: View {
    
    @State private var collegeEmail = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .center, spacing: 0) {
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
                        VStack(alignment: .center, spacing: 6) {
                            Image("security")
                                .resizable()
                                .frame(width: 150, height: 150)
                            
                            Text("Admin Portal")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundStyle(.black)
                            
                            Text("Authorised Personnel Only")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        .padding(.bottom, 32)
                        
                        
                        //Admin Email
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Admin Email")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.black)
                            
                            TextField("Email...", text: $collegeEmail)
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
                        Button {
                            
                        } label: {
                            Text("Secure Login")
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
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 10)
                }
            }
            
        }.navigationBarBackButtonHidden()
    }
}
    
#Preview {
    AdminLoginView()
}
