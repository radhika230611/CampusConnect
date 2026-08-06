
import SwiftUI

struct EventsPage: View {
    @State private var selectedCategory : EventCategory? = .all
    @State private var selectedEvent : Event?
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    //heading
                    HStack(spacing: 15) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 23, height: 17)
                        
                        Text("Events")
                            .font(.system(size: 25, weight: .bold))
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundStyle(.primary)
                    .padding(.bottom, 20)
                    
                    //events categories
                    HStack(spacing: 10){
                        //all button
                        Button{
                            selectedCategory = .all
                        }label: {
                            Text("All")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .all ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 18)
                                .background(
                                    selectedCategory == .all
                                    ? Color.blue
                                    : Color(.systemGray6)
                                )
                                .clipShape(Capsule())
                        }
                        
                        //technical button
                        Button{
                            selectedCategory = .technical
                        }label: {
                            Text("Technical")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .technical ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 18)
                                .background(
                                    selectedCategory == .technical
                                    ? Color.blue
                                    : Color(.systemGray6)
                                )
                                .clipShape(Capsule())
                        }
                        
                        //Cultural
                        Button{
                            selectedCategory = .cultural
                        }label: {
                            Text("Cultural")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .cultural ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 18)
                                .background(
                                    selectedCategory == .cultural
                                    ? Color.blue
                                    : Color(.systemGray6)
                                )
                                .clipShape(Capsule())
                        }
                        
                        //Sports button
                        Button{
                            selectedCategory = .sports
                        }label: {
                            Text("Sports")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(selectedCategory == .sports ? .white : .gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 18)
                                .background(
                                    selectedCategory == .sports
                                    ? Color.blue
                                    : Color(.systemGray6)
                                )
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.bottom, 15)
                    
                    List{
                        ForEach(events) { event in
                            if (selectedCategory == event.category || selectedCategory == .all) {
                                HStack(alignment: .top, spacing: 14){
                                    Image(event.img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 72, height: 72)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(event.title)
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundStyle(.primary)
                                            .lineLimit(2)
                                        
                                        HStack(spacing: 5){
                                            Text(event.date)
                                            Circle()
                                                .frame(width: 3, height: 3)
                                            Text(event.time)
                                        }
                                        .font(.system(size:10))
                                        .foregroundStyle(.gray)
                                        
                                        HStack(spacing: 4){
                                            Image(systemName: "location.fill")
                                                .font(.system(size: 10))
                                            Text(event.location)
                                                .lineLimit(1)
                                        }
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Spacer()
                                        Text(event.category.rawValue)
                                            .font(.system(size: 10, weight: .semibold))
                                            .foregroundStyle(.blue)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.blue.opacity(0.12))
                                            .clipShape(Capsule())
                                    }
                                }
                                .onTapGesture {
                                    selectedEvent = event
                                }
                                .padding(10)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.08))
                                )
                                .shadow(color: .blue.opacity(0.04), radius: 5, y: 2)
                                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .navigationDestination(item: $selectedEvent){event in
                        EventDeatilsPage(currentEvent: event)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    Spacer()
                    
                }.padding(.horizontal, 16)
                    .padding(.top, 10)
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    EventsPage()
}
