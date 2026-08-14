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
    @State private var selectedSort: NoticeSortOption = .latest
    
    var sortedNotices: [Notice] {
        switch selectedSort {
        case .az:
            return notices.sorted {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending
            }
            
        case .za:
            return notices.sorted {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedDescending
            }
            
        case .latest:
            return notices.sorted {
                $0.date > $1.date
            }
            
        case .oldest:
            return notices.sorted {
                $0.date < $1.date
            }
        }
    }

    var body: some View {
        
            ZStack{
                LinearGradient(
                    colors: [
                        Color(red: 0.96, green: 0.98, blue: 1.00),
                        Color(red: 0.92, green: 0.96, blue: 1.00),
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
                            .frame(width: 23,height: 17)
                        Text("Notices")
                            .font(.system(size:25, weight: .bold))
                        Spacer()
                        Menu {
                            Button {
                                selectedSort = .az
                            } label: {
                                HStack{
                                    Text("A → Z")
                                    if selectedSort == .az{
                                        Image(systemName: "checkmark.square.fill")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                
                                    
                            }
                            
                            Button {
                                selectedSort = .za
                            } label: {
                                HStack{
                                    Text("Z → A")
                                    if selectedSort == .za{
                                        Image(systemName: "checkmark.square.fill")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                   
                            }
                            
                            Button {
                                selectedSort = .latest
                            } label: {
                                HStack{
                                    Text("Latest")
                                    if selectedSort == .latest{
                                        Image(systemName: "checkmark.square.fill")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                   
                            }
                            
                            Button {
                                selectedSort = .oldest
                            } label: {
                                HStack{
                                    Text("Oldest")
                                    if selectedSort == .oldest{
                                        Image(systemName: "checkmark.square.fill")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.blue)
                                    }
                                }
                                    
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.system(size: 18))
                                .foregroundStyle(.blue)
                                .frame(width: 38, height: 38)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        
                    }
                    .foregroundStyle(.primary)
                        .padding(.bottom,20)
                    
                    //menu section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            //all button
                            Button{
                                selectedCategory = .all
                            }label: {
                                Text("All")
                                    .font(.system(size:13, weight: .semibold))
                                    .foregroundStyle(selectedCategory == .all ? .white : .gray)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(
                                        selectedCategory == .all
                                        ? Color.blue
                                        : Color.white
                                    )
                                    .clipShape(Capsule())
                            }
                            
                            //Academics
                            Button{
                                selectedCategory = .academics
                            }label: {
                                Text("Academics")
                                    .font(.system(size:13, weight: .semibold))
                                    .foregroundStyle(selectedCategory == .academics ? .white : .gray)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(
                                        selectedCategory == .academics
                                        ? Color.blue
                                        : Color.white
                                    )
                                    .clipShape(Capsule())
                            }
                            
                            //Exams
                            Button{
                                selectedCategory = .exams
                            }label: {
                                Text("Exams")
                                    .font(.system(size:13, weight: .semibold))
                                    .foregroundStyle(selectedCategory == .exams ? .white : .gray)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(
                                        selectedCategory == .exams
                                        ? Color.blue
                                        : Color.white
                                    )
                                    .clipShape(Capsule())
                            }
                            
                            //Hostel
                            Button{
                                selectedCategory = .hostel
                            }label: {
                                Text("Hostel")
                                    .font(.system(size:13, weight: .semibold))
                                    .foregroundStyle(selectedCategory == .hostel ? .white : .gray)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(
                                        selectedCategory == .hostel
                                        ? Color.blue
                                        : Color.white
                                    )
                                    .clipShape(Capsule())
                            }
                            
                            //Admin
                            Button{
                                selectedCategory = .admin
                            }label: {
                                Text("Admin")
                                    .font(.system(size:13, weight: .semibold))
                                    .foregroundStyle(selectedCategory == .admin ? .white : .gray)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(
                                        selectedCategory == .admin
                                        ? Color.blue
                                        : Color.white
                                    )
                                    .clipShape(Capsule())
                            }
                            
                        }.padding(.bottom,15)
                    }
                    
                    //notices
                    List{
                        ForEach(sortedNotices) { notice in
                            if (selectedCategory == notice.category || selectedCategory == .all) {
                                HStack{
                                    Image(systemName: notice.img)
                                        .resizable()
                                        .frame(width: 34, height: 34)
                                        .foregroundStyle(notice.category.color)
                                        .padding(12)
                                        .background(notice.category.color.opacity(0.2))
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        HStack{
                                            Text(notice.category.rawValue)
                                                .font(.system(size:11, weight:.semibold))
                                                .foregroundStyle(notice.category.color)

                                            Spacer()
                                            Text(notice.date.formatted(date: .abbreviated, time: .omitted))
                                                .font(.system(size:11, weight:.semibold))
                                        }
                                        HStack{
                                            VStack(alignment: .leading,spacing : 7){
                                                Text(notice.title)
                                                    .font(.system(size:15, weight:.semibold))
                                                    .foregroundStyle(.black)
                                                Text(notice.message)
                                                    .font(.system(size:13))
                                                    .foregroundStyle(.secondary)
                                                    .lineLimit(2)
                                                
                                            }
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.system(size:13, weight:.medium))
                                                .foregroundStyle(.gray)
                                                
                                        }
                                    }
                                }.onTapGesture{
                                    selectedNotice = notice
                                    }
                                .padding(10)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.08))
                                )
                                .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                }
                            }
                        
                    }.navigationDestination(item: $selectedNotice){notice in
                        NoticeDetailPage(notice: notice)}
                    .listStyle(.plain)
                    .animation(.easeInOut(duration: 0.35), value: selectedSort)
                    .animation(.easeOut(duration: 0.35), value: selectedCategory)
                        .scrollContentBackground(.hidden)
                    Spacer()
                    
                    
                    
                }.padding(.horizontal, 16)
                    .padding(.top, 10)
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    NoticesPage()
}
