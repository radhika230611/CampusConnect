//
//  Lost&Found.swift
//  CampusConnect
//
//  Created by PIET 11 on 07/08/26.
//

import SwiftUI

struct LostFoundItem: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let date: String
    let type: String
    let icon: String
}

struct LostFoundPage: View {
    
    @State private var searchText = ""
    
    let items = [
        LostFoundItem(title: "Black Wallet", location: "Library", date: "Today", type: "Lost", icon: "wallet.pass.fill"),
        LostFoundItem(title: "Student ID Card", location: "Cafeteria", date: "Yesterday", type: "Found", icon: "person.text.rectangle.fill"),
        LostFoundItem(title: "Blue Water Bottle", location: "Sports Ground", date: "2 Aug", type: "Lost", icon: "waterbottle.fill"),
        LostFoundItem(title: "Wireless Earbuds", location: "Lab Block 2", date: "1 Aug", type: "Found", icon: "airpodspro")
    ]
    
    var body: some View {

            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        // Header
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(.blue)
                                .frame(width: 48, height: 48)
                                .background(Color.blue.opacity(0.10), in: Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Lost & Found")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text("Find or report a lost item")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(18)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                        )
                        
                        // Search
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            
                            TextField("Search items", text: $searchText)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 14)
                        .frame(height: 46)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.10), lineWidth: 1)
                        )
                        
                        // Report Button
                        Button {
                            // Report lost/found item
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Report Lost or Found Item")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.blue)
                            .padding(16)
                            .background(Color.blue.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                        }
                        
                        // Items
                        Text("Recent Items")
                            .font(.system(size: 17, weight: .bold))
                        
                        VStack(spacing: 10) {
                            ForEach(items) { item in
                                HStack(spacing: 13) {
                                    Image(systemName: item.icon)
                                        .font(.system(size: 19))
                                        .foregroundStyle(.blue)
                                        .frame(width: 44, height: 44)
                                        .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(item.title)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(.primary)
                                        
                                        HStack(spacing: 5) {
                                            Image(systemName: "mappin")
                                                .font(.system(size: 9))
                                            
                                            Text(item.location)
                                            Text("•")
                                            Text(item.date)
                                        }
                                        .font(.system(size: 11))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.type)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundStyle(item.type == "Lost" ? .orange : .green)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 5)
                                        .background((item.type == "Lost" ? Color.orange : Color.green).opacity(0.10), in: Capsule())
                                }
                                .padding(14)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.08), lineWidth: 1))
                                .shadow(color: .black.opacity(0.03), radius: 5, y: 2)
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
            
        }
        .navigationTitle("Lost & Found")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    NavigationStack {
        LostFoundPage()
    }
}
