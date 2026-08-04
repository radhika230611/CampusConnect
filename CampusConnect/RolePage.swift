//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct RolePage: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 0){
                
                Text("Welcome to Campus Connect 👋")
                    .font(.system(size: 23, weight: .heavy ))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth : 300)
                    .padding(.bottom, 12)
                
                Text("How would you like to continue?")
                    .font(.system(size: 17, weight: .regular ))
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 20)
                
                
                //student login
                ZStack(alignment : .bottomTrailing){
                    VStack(spacing : 5){
                        Image(systemName: "graduationcap.fill")
                            .resizable()
                            .frame(width: 60,height: 60)
                            .foregroundStyle(Color(red: 21/255, green: 101/255, blue: 245/255))
                        Text("Student")
                            .font(.system(size: 23, weight: .heavy))
                        
                        Text("Access campus events, notices, transport, and community. ")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth : 300)
                    }.padding(.horizontal, 22)

                    
                    NavigationLink {
                        StudentLoginView()
                    }label: {
                        Image(systemName: "arrowshape.right.fill")
                            .resizable()
                            .frame(width: 12,height: 12)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color(red: 21/255, green: 101/255, blue: 245/255)))
                    }
                }.padding(.horizontal, 20)
                    .padding(.vertical,16)
                .overlay{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.opacity(0.5), lineWidth: 4)
                            .blur(radius: 9)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.secondary.opacity(0.5), lineWidth: 2)
                            
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                //admin login
                ZStack(alignment : .bottomTrailing){
                    VStack(spacing : 5){
                        Image(systemName: "lock.badge.clock.fill")
                            .resizable()
                            .frame(width: 60,height: 60)
                            .foregroundStyle(Color(red: 21/255, green: 101/255, blue: 245/255))
                        Text("Admin")
                            .font(.system(size: 23, weight: .heavy))
                        
                        Text("Manage events, notices, transport, and campus content. ")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth : 300)
                    }.padding(.horizontal, 22)
                    
                    NavigationLink {
                        AdminLoginView()
                    }label: {
                        Image(systemName: "arrowshape.right.fill")
                            .resizable()
                            .frame(width: 12,height: 12)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color(red: 21/255, green: 101/255, blue: 245/255)))
                    }
                }.padding(.horizontal, 20)
                    .padding(.vertical,16)
                .overlay{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.opacity(0.5), lineWidth: 4)
                            .blur(radius: 9)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.secondary.opacity(0.5), lineWidth: 2)
                            
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                
            }.padding()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    RolePage()
}
