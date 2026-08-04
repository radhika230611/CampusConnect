//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct EventDeatilsPage: View {
    let  currentEvent: Event
    var body: some View {
        
        ZStack{
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.78),
                    Color.cyan.opacity(0.2),
                    Color.white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20){
                Image(currentEvent.img)
                    .resizable()
                    .cornerRadius(20)
                    .frame(maxWidth:.infinity)
                    .frame(height: 200)
                    .overlay{
                        Rectangle()
                            .fill(Color.black.opacity(0.4))
                            .cornerRadius(20)
                            .frame(maxWidth:.infinity)
                            .frame(height: 200)

                    }
                    .overlay(alignment: .leading){
                        Text(currentEvent.title)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth : 250)
                            .padding(.horizontal)
                    }
                   
                Text(currentEvent.category.rawValue)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                HStack(spacing: 15){
                    Image(systemName: "calendar.badge.clock.rtl")
                        .resizable()
                        .frame(width: 25, height: 20)
                        
                    VStack{
                        Text(currentEvent.date)
                            .font(.system(size: 15, weight: .regular))
                        Text(currentEvent.time)
                            .font(.system(size: 15, weight: .regular))
                    }
                    Spacer()
                }
                HStack(alignment: .top, spacing: 15){
                    Image(systemName: "mappin.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        
                    Text(currentEvent.location)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.black)
                }
                
                Text("About Event")
                    .font(.system(size: 16, weight: .bold))
                Text(currentEvent.details.content)
                    .font(.system(size: 15, weight: .regular))
                
                Text("Organiser")
                    .font(.system(size: 16, weight: .bold))
                
                HStack(spacing: 12){
                    Image(currentEvent.details.organizer.img)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(currentEvent.details.organizer.name)
                            .font(.system(size: 15, weight: .semibold))
                        Text(currentEvent.details.organizer.mail)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(.gray)
                        Text(currentEvent.details.organizer.contact)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Add to Calendar")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.blue)
                        .cornerRadius(16)
                }
            }.padding(.horizontal)
        }.navigationTitle(currentEvent.title)
    }
}


