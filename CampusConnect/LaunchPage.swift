//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct LaunchPage: View {
    var body: some View {
            ZStack{
                Image("LaunchPage")
                    .resizable()
                    .scaledToFill()
                    
                VStack{
                    Image("logoo")
                        .resizable()
                        .frame(width: 200,height: 200)
                    Text("CAMPUS")
                        .font(.system(size: 40,weight: .bold))
                    Text("CONNECT")
                        .font(.system(size: 40,weight: .bold))
                        .foregroundStyle(Color(red: 21/255, green: 101/255, blue: 245/255))                .padding(.bottom,20)
                    Text("Stay Connected. Stay Informed.")
                        .font(.system(size: 15,weight: .bold))
                        .foregroundStyle(.gray)
                }
        }
    }
}

#Preview {
    LaunchPage()
}
