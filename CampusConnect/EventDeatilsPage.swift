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
                    Color(red: 0.97, green: 0.98, blue: 2.00),
                    Color(red: 0.90, green: 0.95, blue: 1.00),
                    Color(red: 0.98, green:
                            
                            0.96, blue: 2.00)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                
            )
            .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 20){
                        Image(currentEvent.img)
                            .resizable()
                            .cornerRadius(20)
                            .frame(maxWidth:.infinity)
                            .frame(height: 200)
                            .overlay(
                                LinearGradient(
                                    colors: [
                                        .clear,
                                        Color.black.opacity(0.55)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            )
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
                        
                        HStack(spacing: 14) {
                            Image(systemName: "calendar")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 32)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentEvent.date)
                                Text(currentEvent.time)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 6)
                        
                        HStack(spacing: 14) {
                            Image(systemName: "mappin.circle")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 32)
                            
                            Text(currentEvent.location)
                                .font(.system(size: 15, weight: .regular))
                                .foregroundStyle(.black)
                            
                            Spacer()
                        }
                        .padding(.vertical, 6)
                        
                        
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
                    }.padding(20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(Color.gray.opacity(0.08))
                        )
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
                    
                    
                }
                .scrollIndicators(.hidden)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Add to Calendar")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(
                                colors: [.blue, .blue.opacity(0.85)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .blue.opacity(0.25), radius: 8, y: 4)
                }
            }.padding()
            
        }.navigationTitle(currentEvent.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EventDeatilsPage(currentEvent: events[0])
}


