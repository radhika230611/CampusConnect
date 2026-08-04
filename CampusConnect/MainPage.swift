//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack{
            TabView {
                HomePage()
                    .tabItem {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("Home")
                    }
                
                EventsPage()
                    .tabItem {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("Events")
                    }
                
                NoticesPage()
                    .tabItem {
                        Image(systemName: "text.document")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("Notices")
                    }
                
                TransportPage()
                    .tabItem {
                        Image(systemName: "bus")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("Transport")
                    }
                
                MorePage()
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Text("More")
                    }
               
            }.tint(.blue)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    MainPage()
}
