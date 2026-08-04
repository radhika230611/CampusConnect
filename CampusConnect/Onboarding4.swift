//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct Onboarding4: View {
    var body: some View {
        NavigationStack{
            VStack (spacing: 20){
                HStack{
                    Spacer()
                    NavigationLink{
                        RolePage()
                    }label : {
                        Text("Skip")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                }.padding(.horizontal)
                Spacer()
                Image("Onboarding4.1")
                    .resizable()
                    .scaledToFit()
                
                
                Image(systemName: "person.2")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color(red: 21/255, green: 101/255, blue: 245/255))
                    )
                
                Text("Connect with your Campus")
                    .font(.system(size: 23, weight: .heavy ))
                
                Text("Discover clubs, communitiues, lost and found, and more")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    ForEach(0..<4){i in
                        Circle()
                            .fill(i == 3 ? Color(red: 21/255, green: 101/255, blue: 245/255) : .gray)
                            .frame(width:5,height: 5)
                    }
                    
                    Spacer()
                    NavigationLink{
                        Onboarding2()
                    }label: {
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(
                                    Circle()
                                        .fill(Color(red: 21/255, green: 101/255, blue: 245/255))
                                )
                        }

                    
                }.padding(.horizontal)
            }
            .padding()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding4()
}
