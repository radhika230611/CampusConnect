import SwiftUI

struct AdminLoginView: View {

    @State private var adminEmail = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        NavigationStack {
            ZStack {
        
                Color(red: 0.97, green: 0.98, blue: 1.00)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Back Button
                        HStack {
                            NavigationLink {
                                RolePage()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.primary)
                                    .frame(width: 36, height: 36)
                                    .background(Color.white, in: Circle())
                                    .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                            }
                            
                            Spacer()
                        }
                        
                        
                        // Header
                        VStack(spacing: 12) {
                            
                            Image(systemName: "lock.shield")
                                .font(.system(size: 50, weight: .semibold))
                                .foregroundStyle(.blue)
                                .frame(width: 90, height: 90)
                                .background(Color.blue.opacity(0.11), in: Circle())
                            
                            Text("Admin Portal")
                                .font(.system(size: 26, weight: .bold))
                            
                            Text("Authorized personnel only")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top, 10)
                        
                        
                        // Login Card
                        VStack(alignment: .leading, spacing: 18) {
                            
                            Text("Admin Email")
                                .font(.system(size: 13, weight: .semibold))
                            
                            TextField("Enter admin email", text: $adminEmail)
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
                                .padding(.top, 5)
                            
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
                                
                            } label: {
                                Text("Secure Login")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                                    .shadow(color: .blue.opacity(0.18), radius: 6, y: 3)
                            }
                            .padding(.top, 8)
                        }
                        .padding(22)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.04), radius: 8, y: 4)
                        
                        
                        // Bottom Text
                        HStack(spacing: 6) {
                            Image(systemName: "shield.checkered")
                                .foregroundStyle(.blue)
                            
                            Text("Your admin account is protected")
                                .font(.system(size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top, 8)
                        
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
    AdminLoginView()
}
