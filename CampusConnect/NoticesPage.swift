//
//  ContentView.swift
//  CampusConnect
//
//  Created by PIET 11 on 23/07/26.
//

import SwiftUI

struct NoticesPage: View {
    @State private var selectedCategory : NoticeCategory? = .all
    @State private var selectedNotice : Notice?

    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.9),
                        Color.cyan.opacity(0.25),
                        Color.white
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack{
                    //heading
                    HStack(spacing : 20){
                        Image(systemName:"line.3.horizontal")
                            .resizable()
                            .frame(width: 23, height: 17)
                        Text("Notices")
                            .font(.system(size:25, weight: .bold))
                        Spacer()
                        Image(systemName:"magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                    }.padding()
                        .foregroundStyle(.white)
                    
                    //menu section
                    HStack(spacing: 15){
                        //all button
                        Button{
                            selectedCategory = .all
                        }label: {
                            Text("All")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .all ? .white : .black)
                                .padding(.vertical,5)
                                .padding(.horizontal,8)
                                .background(selectedCategory == .all ? Color.blue : Color.white)
                                .cornerRadius(20)
                        }
                        
                        //Academics
                        Button{
                            selectedCategory = .academics
                        }label: {
                            Text("Academics")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .academics ? .white : .black)
                                .padding(.vertical,5)
                                .padding(.horizontal,8)
                                .background(selectedCategory == .academics ? Color.green : Color.white)
                                .cornerRadius(20)
                        }
                        
                        //Exams
                        Button{
                            selectedCategory = .exams
                        }label: {
                            Text("Exams")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .exams ? .white : .black)
                                .padding(.vertical,5)
                                .padding(.horizontal,8)
                                .background(selectedCategory == .exams ? Color.yellow : Color.white)
                                .cornerRadius(20)
                        }
                        
                        //Hostel
                        Button{
                            selectedCategory = .hostel
                        }label: {
                            Text("Hostel")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .hostel ? .white : .black)
                                .padding(.vertical,5)
                                .padding(.horizontal,8)
                                .background(selectedCategory == .hostel ? Color.orange : Color.white)
                                .cornerRadius(20)
                        }
                        
                        //Admin
                        Button{
                            selectedCategory = .admin
                        }label: {
                            Text("Admin")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .admin ? .white : .black)
                                .padding(.vertical,5)
                                .padding(.horizontal,8)
                                .background(selectedCategory == .admin ? Color.blue : Color.white)
                                .cornerRadius(20)
                        }
                        
                    }.padding(.horizontal)
                    
                    //notices
                    List{
                        ForEach(notices) { notice in
                            if (selectedCategory == notice.category || selectedCategory == .all) {
                                HStack{
                                    Image(systemName: notice.img)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(notice.category.color)
                                        .padding(10)
                                        .background(notice.category.color.opacity(0.2))
                                        .cornerRadius(30)
                                    
                                    VStack(alignment: .leading, spacing: 7){
                                        
                                        HStack{
                                            Text(notice.category.rawValue)
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundStyle(notice.category.color)

                                            Spacer()
                                            Text(notice.date)
                                                .font(.system(size: 10, weight: .regular))
                                        }
                                        HStack{
                                            VStack(alignment: .leading,spacing : 7){
                                                Text(notice.title)
                                                    .font(.system(size: 14, weight: .bold))
                                                    .foregroundStyle(.black)
                                                Text(notice.message)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .foregroundStyle(.black)
                                                    
                                                
                                            }//.frame(maxWidth: 200)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .frame(width: 5, height: 10)
                                                .foregroundStyle(.gray)
                                                
                                        }
                                    }
                                }.onTapGesture{
                                    selectedNotice = notice
                                    }
                                .padding(10)
                                    
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                }
                            }
                        
                    }.navigationDestination(item: $selectedNotice){notice in
                        NoticeDetailPage(notice: notice)}
                    .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        Spacer()
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    NoticesPage()
}
