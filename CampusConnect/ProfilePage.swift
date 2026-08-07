//
//  Profile.swift
//  CampusConnect
//
//  Created by PIET 11 on 06/08/26.
//
import SwiftUI
struct ProfilePage: View{
    var body : some View{
        NavigationStack{
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                ScrollView{
                    VStack(spacing: 10){
                        VStack(alignment: .center){
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(Color.blue)
                                .padding(22)
                                .background(Color.blue.opacity(0.12))
                                .clipShape(Circle())
                                .padding(.bottom,16)
                            
                            Text("Radhika Mittal")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding(.bottom,5)
                            
                            Text("radhika.mittal@gmail.com")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundStyle(.secondary)
                        }.padding(.vertical,12)
                        
                        Divider()
                            .foregroundStyle(Color.gray.opacity(0.15))
                        
                        //roll
                        HStack(spacing : 16){
                            Image(systemName: "number.square")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 3){
                                Text("Roll Number")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                                Text("28240118")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            Spacer()
                            
                        }
                        .padding(.vertical,12)
                        
                        Divider()
                            .foregroundStyle(Color.gray.opacity(0.15))
                        
                        //Course
                        HStack(spacing : 16){
                            Image(systemName: "book.closed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 3){
                                Text("Course")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                                Text("B.Tech CSE")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            Spacer()
                            
                        }
                        .padding(.vertical,12)
                        
                        
                        Divider()
                            .foregroundStyle(Color.gray.opacity(0.15))
                        
                        //dob
                        HStack(spacing : 16){
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.blue)
                            
                            VStack(alignment: .leading, spacing: 3){
                                Text("Date of Birth")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                                Text("23 Nov 2006")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            Spacer()
                            
                        }
                        .padding(.vertical,12)
                        
                        
                    }.padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .overlay{
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(.gray.opacity(0.08))
                        }
                        .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                    
                    
                    Spacer()
                }.scrollIndicators(.hidden)
                    .padding()
            }
        }.navigationTitle("Profile")
            .font(.system(size: 25, weight: .bold))
    }
}

#Preview {
    ProfilePage()
}

