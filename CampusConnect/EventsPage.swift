
import SwiftUI

struct EventsPage: View {
    @State private var selectedCategory : EventCategory? = .all
    @State private var selectedEvent : Event?
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.85),
                        Color.cyan.opacity(0.25),
                        Color(UIColor.systemGroupedBackground)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 12){
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
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                    
                    //events categories
                    HStack(spacing: 10){
                        //all button
                        Button{
                            selectedCategory = .all
                        }label: {
                            Text("All")
                                .font(.system(size:14, weight: selectedCategory == .all ? .bold : .semibold))
                                .foregroundStyle(selectedCategory == .all ? .blue : .primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == .all ? Color.white : Color.white.opacity(0.6))
                                .cornerRadius(20)
                                .shadow(color: selectedCategory == .all ? .black.opacity(0.08) : .clear, radius: 6, x: 0, y: 3)
                        }
                        
                        //technical button
                        Button{
                            selectedCategory = .technical
                        }label: {
                            Text("Technical")
                                .font(.system(size:14, weight: selectedCategory == .technical ? .bold : .semibold))
                                .foregroundStyle(selectedCategory == .technical ? .blue : .primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == .technical ? Color.white : Color.white.opacity(0.6))
                                .cornerRadius(20)
                                .shadow(color: selectedCategory == .technical ? .black.opacity(0.08) : .clear, radius: 6, x: 0, y: 3)
                        }
                        
                        //Cultural
                        Button{
                            selectedCategory = .cultural
                        }label: {
                            Text("Cultural")
                                .font(.system(size:14, weight: selectedCategory == .cultural ? .bold : .semibold))
                                .foregroundStyle(selectedCategory == .cultural ? .blue : .primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == .cultural ? Color.white : Color.white.opacity(0.6))
                                .cornerRadius(20)
                                .shadow(color: selectedCategory == .cultural ? .black.opacity(0.08) : .clear, radius: 6, x: 0, y: 3)
                        }
                        
                        //Sports button
                        Button{
                            selectedCategory = .sports
                        }label: {
                            Text("Sports")
                                .font(.system(size:14, weight: selectedCategory == .sports ? .bold : .semibold))
                                .foregroundStyle(selectedCategory == .sports ? .blue : .primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == .sports ? Color.white : Color.white.opacity(0.6))
                                .cornerRadius(20)
                                .shadow(color: selectedCategory == .sports ? .black.opacity(0.08) : .clear, radius: 6, x: 0, y: 3)
                        }
                    }
                    .padding(.vertical, 4)
                    
                    List{
                        ForEach(events) { event in
                            if (selectedCategory == event.category || selectedCategory == .all) {
                                HStack(alignment: .top, spacing: 14){
                                    Image(event.img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 76, height: 76)
                                        .clipped()
                                        .cornerRadius(12)
                                    
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(event.title)
                                            .font(.system(size: 15, weight: .bold))
                                            .foregroundStyle(.primary)
                                            .lineLimit(2)
                                        
                                        HStack(spacing: 5){
                                            Text(event.date)
                                            Circle()
                                                .frame(width: 3, height: 3)
                                            Text(event.time)
                                        }
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(.secondary)
                                        
                                        HStack(spacing: 4){
                                            Image(systemName: "location.fill")
                                                .font(.system(size: 10))
                                            Text(event.location)
                                                .lineLimit(1)
                                        }
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer(minLength: 4)
                                    
                                    VStack{
                                        Spacer()
                                        Text(event.category.rawValue)
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundStyle(.blue)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                            .background(Color.blue.opacity(0.12))
                                            .clipShape(Capsule())
                                    }
                                }
                                .onTapGesture {
                                    selectedEvent = event
                                }
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                                .listRowInsets(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
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
                    
                } .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    EventsPage()
}
