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
            VStack{
                VStack(alignment: .center){
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(Color.white)
                        .padding(20)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.bottom,16)
                    
                    Text("Radhika Mittal")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.bottom,5)
                    
                    Text("radhika.mittal@gmail.com")
                        .foregroundStyle(.gray)
                        .font(.system(size: 18, weight: .regular))
                }
                
                Divider()
                    .foregroundStyle(Color.gray.opacity(0.6))
                
                //dob
                HStack(spacing : 20){
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.blue)
                    
                    VStack(alignment: .leading){
                        Text("Date of Birth")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundStyle(.gray)
                        Text("23 Nov 2006")
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    Spacer()
                    
                }
                Divider()
                    .foregroundStyle(Color.gray.opacity(0.6))
                
                //Course
                //dob
                HStack(spacing : 20){
                    Image(systemName: "graduationcap")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.blue)
                    
                    VStack(alignment: .leading){
                        Text("Date of Birth")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundStyle(.gray)
                        Text("23 Nov 2006")
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    Spacer()
                    
                }
                
            }
        }.navigationTitle("Profile")
    }
}

#Preview {
    ProfilePage()
}

