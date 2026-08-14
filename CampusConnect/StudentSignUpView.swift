import SwiftUI

struct StudentSignUpView: View {

    @Binding var message: String
    @Binding var isLoggedIn: Bool

    @State private var username = ""
    @State private var email = ""
    @State private var rollNumber = ""
    @State private var course = ""
    @State private var dob = Date()

    @State private var password = ""
    @State private var showPassword = false
    
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


                ScrollView(showsIndicators: false) {

                    VStack(spacing: 20) {
                        // Back Button
                        HStack {

                            NavigationLink {
                                StudentLoginView()
                            } label: {

                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.black)
                                    .frame(width: 38,height: 38)
                                    .background(.white,in:Circle())
                            }

                            Spacer()
                        }


                        // Header
                        VStack(spacing: 10) {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .font(.system(size: 42))
                                .foregroundStyle(.blue)
                                .frame(width: 85,height:85)
                                .background(
                                    Color.blue.opacity(0.12),
                                    in:Circle()
                                )
                            Text("Create Account")
                                .font(.system(size:26,weight:.bold))
                            Text("Join your campus community")
                                .font(.system(size:14))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom,10)


                        VStack(alignment:.leading,spacing:16) {
                            Text("Personal Details")
                                .font(.system(size:17,weight:.bold))
                            
                            Text("Full Name")
                                .font(.system(size:13,weight:.semibold))
                            TextField("Enter your name",text:$username)
                                .padding(.horizontal,15)
                                .frame(height:50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .overlay(
                                    RoundedRectangle(cornerRadius:12)
                                        .stroke(Color.gray.opacity(0.15))
                                )
                            
                            Text("College Email")
                                .font(.system(size:13,weight:.semibold))
                            TextField("Enter college email",text:$email)
                                .padding(.horizontal,15)
                                .frame(height:50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .overlay(
                                    RoundedRectangle(cornerRadius:12)
                                        .stroke(Color.gray.opacity(0.15))
                                )

                            Text("Roll Number")
                                .font(.system(size:13,weight:.semibold))

                            TextField("Enter roll number",text:$rollNumber)
                                .padding(.horizontal,15)
                                .frame(height:50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .overlay(
                                    RoundedRectangle(cornerRadius:12)
                                        .stroke(Color.gray.opacity(0.15))
                                )

                            Text("Course")
                                .font(.system(size:13,weight:.semibold))

                            TextField("Example: B.Tech CSE",text:$course)
                                .padding(.horizontal,15)
                                .frame(height:50)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .overlay(
                                    RoundedRectangle(cornerRadius:12)
                                        .stroke(Color.gray.opacity(0.15))
                                )


                            Text("Date of Birth")
                                .font(.system(size:13,weight:.semibold))
                
                            DatePicker("", selection:$dob, displayedComponents:.date)
                            .datePickerStyle(.compact)
                            .padding(.horizontal,12)
                            .frame(height:50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius:12))
                            .overlay(
                                RoundedRectangle(cornerRadius:12)
                                    .stroke(Color.gray.opacity(0.15))
                            )
                           

                            Text("Security")
                                .font(.system(size:17,weight:.bold))
                                .padding(.top,5)


                            Text("Password")
                                .font(.system(size:13,weight:.semibold))
                            
                            HStack {
                                if showPassword {
                                    TextField("Enter password",text:$password)
                                }
                                else {
                                    SecureField("Enter password",text:$password)
                                }

                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName:
                                            showPassword ? "eye.slash" : "eye")
                                    .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.horizontal,15)
                            .frame(height:50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius:12))
                            .overlay(
                                RoundedRectangle(cornerRadius:12)
                                    .stroke(Color.gray.opacity(0.15))
                            )

                            
                            Button {
                                authservice.SignUp(email: email,username: username,Password: password) { resultMessage, success in
                                        message = resultMessage
                                        isLoggedIn = success
                                    }
                                    
                                
                                
                            } label: {
                                Text("Create Account")
                                    .font(.system(size:16,weight:.semibold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth:.infinity)
                                    .frame(height:52)
                                    .background(Color.blue)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius:14)
                                    )
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
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius:22))
                        .shadow(color:.blue.opacity(0.08),radius:10, y:5)

                        
                        

                        HStack {
                            Text("Already have an account?")
                                .font(.system(size:13))
                                .foregroundStyle(.secondary)
                            NavigationLink {
                                StudentLoginView()
                            } label: {
                                Text("Login")
                                    .font(.system(size:13,weight:.semibold))
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding(.bottom,20)
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
   LaunchPage()
}
