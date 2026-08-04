//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct Onboarding2: View {
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
                Image("Onboarding2")
                    .resizable()
                    .scaledToFit()
                    
                
                
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color(red: 21/255, green: 101/255, blue: 245/255))
                    )
                
                Text("Never Miss an Event")
                    .font(.system(size: 23, weight: .heavy ))
                
                Text("Discover technical, cultural , sports and other campus events")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    ForEach(0..<4){i in
                        Circle()
                            .fill(i == 1 ? Color(red: 21/255, green: 101/255, blue: 245/255) : .gray)
                            .frame(width:5,height: 5)
                    }
                    
                    Spacer()
                    NavigationLink{
                        Onboarding3()
                    }label:{
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
    Onboarding2()
}
