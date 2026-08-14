import SwiftUI

struct SettingsPage: View {
    @State private var LogoutBox : Bool  = false
    var body: some View {
        ZStack{
            ZStack {
                Color(red: 0.95, green: 0.98, blue: 1.00)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        // Account
                        AccountSection()
                        
                        // Preferences
                        PreferencesSection()
                        
                        
                        // CampusConnect
                        CampusConnectSection()
                        
                        // Logout
                        Button{
                            LogoutBox = true
                        } label: {
                            HStack {
                                Spacer()
                                Image(
                                    systemName: "rectangle.portrait.and.arrow.right"
                                )
                                Text("Log Out")
                                    .font(.system(size: 16, weight: .semibold))
                                Spacer()
                            }
                            .foregroundStyle(.red)
                            .padding()
                        }
                    }
                    .padding(.vertical)
                }
            }.navigationTitle("Setting")
            
            if LogoutBox {
                ZStack{
                    Color(.gray.opacity(0.9))
                        .ignoresSafeArea()
                    
                    VStack{
                        Text("Do you want to logout?")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.primary)
                            .padding(10)
                        
                        HStack(spacing: 20){
                            Button{
                                LogoutBox = false
                            }label: {
                                Text("Cancel")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.9))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(RoundedRectangle(cornerRadius: 20) .stroke(Color.gray.opacity(0.9),lineWidth: 1))
                                
                            }
                            NavigationLink{
                                StudentLoginView()
                            }label: {
                                Text("Logout")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .background(Color.red.opacity(0.9))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(RoundedRectangle(cornerRadius: 20) .stroke(Color.red.opacity(0.9),lineWidth: 1))
                                
                            }
                        }
                    }.padding(20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(RoundedRectangle(cornerRadius: 24) .stroke(Color.gray.opacity(0.2),lineWidth: 1))
                        .shadow(color: .black.opacity(0.12),radius: 20,y: 8)
                    
                }.navigationBarBackButtonHidden()
            }
        }
            
    }
}

#Preview{
    SettingsPage()
}

struct AccountSection: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Account")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.gray)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                NavigationLink{
                    ProfilePage()
                }label: {
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.blue)
                            .frame(width: 42, height: 42)
                            .background(Color.blue.opacity(0.10))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Profile")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.black)
                            Text("Manage your personal information")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray.opacity(0.6))
                    }
                    .padding(16)
                }
                
                
                Divider()
                    .foregroundStyle(Color.black.opacity(0.03))
                    .padding(.horizontal)
                
                
                HStack {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Privacy & Security")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Password and account security")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))
                }
                .padding(16)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

struct PreferencesSection: View {
    
    @State private var notificationsOn: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Preferences")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.gray)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                
                HStack {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Notifications")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Event and campus updates")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Toggle("", isOn: $notificationsOn)
                        .labelsHidden()
                        .tint(.blue)
                }
                .padding(16)
                
                Divider()
                    .foregroundStyle(Color.black.opacity(0.03))
                    .padding(.horizontal)
                
                
                HStack {
                    Image(systemName: "moon.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Appearance")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Light mode")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))

                }
                .padding(16)
                
                Divider()
                    .foregroundStyle(Color.black.opacity(0.03))
                    .padding(.horizontal)
        
                HStack {
                    Image(systemName: "globe")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Language")
                            .font(.system(size: 17, weight: .semibold))

                        Text("English")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))

                }
                .padding(16)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

struct CampusConnectSection: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("CampusConnect")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.gray)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                
                HStack{
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("About CampusConnect")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Version 1.0.0")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))

                }
                .padding(16)
                
                Divider()
                    .foregroundStyle(Color.black.opacity(0.03))
                    .padding(.horizontal)
                
                
                HStack {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Help & FAQs")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Get help and find answers")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))

                }
                .padding(16)
                
                
                Divider()
                    .foregroundStyle(Color.black.opacity(0.03))
                    .padding(.horizontal)
                
                
                HStack {
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.blue)
                        .frame(width: 42, height: 42)
                        .background(Color.blue.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Send Feedback")
                            .font(.system(size: 17, weight: .semibold))
                        Text("Tell us what you think")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray.opacity(0.6))

                    
                    
                    
                }
                .padding(16)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

