//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct StudentSignUpView: View {
    @Binding var message : String
    @Binding var isLoggedIn : Bool
    
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var isConditionsAccepted = false
    
    var body: some View {
        
            NavigationStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        //back button
                        HStack{
                            NavigationLink{
                                StudentLoginView()
                            }label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                        }.padding(.bottom, 28)
                        
                        
                        //Header
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Create Account")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundStyle(.black)
                            
                            Text("Join your campus community")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        .padding(.bottom, 32)
                        
                        //full name
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Full Name")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.black)
                            
                            TextField(
                                "Enter you name",
                                text: $username
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
                        
                        //cllg email
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
                        
                        //password
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
                        }.padding(.bottom, 20)
                        
                        
                        HStack(spacing : 0){
                            Button{
                                isConditionsAccepted.toggle()
                            }label: {
                                Image(systemName: isConditionsAccepted ?
                                      "checkmark.square.fill" : "square")
                                .foregroundStyle(isConditionsAccepted ? .blue : .gray )
                                .padding(.trailing, 10)
                            }
                            
                            Text("I agree to the ")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.black)
                            Text("Terms & Conditions")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.blue)
                        }.padding(.bottom, 24)
                        
                        //sign up button
                        Button(action: {
                            authservice.SignUp(email: email, username: username, Password: password){resultMessage, success in
                                message = resultMessage
                                isLoggedIn = success
                                
                            }
                        })
                        {
                            Text("Sign Up")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.blue)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                        }
                        
                        //login
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                            
                            NavigationLink {
                                StudentLoginView()
                            } label: {
                                Text("Login")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(Color.blue)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 24)
                        
                    }.padding(.horizontal, 24)
                        .padding(.top, 10)
                }
            }.navigationBarBackButtonHidden()
        
    }
}
//
//#Preview {
//    StudentSignUpView()
//}
