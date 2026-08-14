
import SwiftUI

struct EventsPage: View {
    @State private var selectedCategory : EventCategory? = .all
    @State private var selectedEvent : Event?
    @State private var selectedSort: EventSortOption = .latest
    
    var sortedEvents: [Event] {
        switch selectedSort {
        case .az:
            return events.sorted {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending
            }
            
        case .za:
            return events.sorted {
                $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedDescending
            }
            
        case .latest:
            return events.sorted {
                $0.date > $1.date
            }
            
        case .oldest:
            return events.sorted {
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
                
                VStack(spacing: 0){
                    //heading
                    HStack(spacing: 15) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 23, height: 17)
                        
                        Text("Events")
                            .font(.system(size: 25, weight: .bold))
                        
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
                                    : Color(.white)
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
                                    : Color(.white)
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
                                    : Color(.white)
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
                                    : Color(.white)
                                )
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.bottom, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 12) {
                            ForEach(sortedEvents) { event in
                                if selectedCategory == event.category || selectedCategory == .all {
                                    
                                    HStack(alignment: .top, spacing: 14) {
                                        
                                        Image(event.img)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 72, height: 72)
                                            .clipShape(
                                                RoundedRectangle(cornerRadius: 10)
                                            )
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            Text(event.title)
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundStyle(.primary)
                                                .lineLimit(2)
                                            HStack(spacing: 5) {
                                                Text(event.date.formatted(date: .abbreviated, time: .omitted))
                                                    .bold()
                                                Circle()
                                                    .frame(width: 3, height: 3)
                                                Text(event.time)
                                            }
                                            .font(.system(size: 10))
                                            .foregroundStyle(.gray)
                                            
                                            HStack(spacing: 4) {
                                                Image(systemName: "location.fill")
                                                    .font(.system(size: 10))
                                                Text(event.location)
                                                    .lineLimit(1)
                                            }
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundStyle(.secondary)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            Spacer()
                                            Text(event.category.rawValue)
                                                .font(.system(size: 10, weight: .semibold))
                                                .foregroundStyle(.blue)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                                .background(
                                                    Color.blue.opacity(0.12)
                                                )
                                                .clipShape(Capsule())
                                        }
                                    }
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 16)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray.opacity(0.08))
                                    )
                                    .shadow(
                                        color: .blue.opacity(0.04),radius: 5,y: 2
                                    )
                                    .onTapGesture {
                                        selectedEvent = event
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .animation(.easeInOut(duration: 0.35), value: selectedSort)
                        .animation(.easeOut(duration: 0.35), value: selectedCategory)
                        
                        
                    }
                    .scrollIndicators(.hidden)
                    .navigationDestination(item: $selectedEvent) { event in
                        EventDeatilsPage(currentEvent: event)
                    }
                    
                   
                    Spacer()
                    
                }.padding(.horizontal, 16)
                    .padding(.top, 10)
            
        }//.toolbar(.hidden)

            
    }
}

#Preview {
    EventsPage()
}
