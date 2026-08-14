import SwiftUI

struct TransportPage: View {
    
    @State private var fromLocation: String = ""
    @State private var toLocation: String = ""
    
    var filteredSchedules: [TransportSchedule] {
        TransportData.filter { route in
            let matchesFrom = fromLocation.isEmpty || route.fromLocation == fromLocation
            let matchesTo = toLocation.isEmpty || route.toLocation == toLocation
            return matchesFrom && matchesTo
        }
    }
    
    var body: some View {
        
            
            ZStack {
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
                
                
                VStack(spacing: 0) {
                    // Header
                    HStack(spacing: 15) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 23, height: 17)
                        
                        Text("Transport")
                            .font(.system(size: 25, weight: .bold))
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundStyle(.primary)
                    .padding(.bottom, 16)
                    
                    ScrollView{
                        // Location Selection Card
                        VStack(spacing: 10) {
                            
                            // From Location Dropdown (Menu)
                            HStack {
                                Image(systemName: "circle")
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(Color.blue)
                                
                                Text("From")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black)
                                
                                Spacer()
                                
                                Menu {
                                    ForEach(locations, id: \.self) { location in
                                        Button {
                                            fromLocation = location
                                        } label: {
                                            HStack {
                                                Text(location)
                                                if location == fromLocation {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 8) {
                                        // Display selected value or placeholder
                                        Text(fromLocation.isEmpty ? "Select Location" : fromLocation)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundStyle(fromLocation.isEmpty ? .gray : .primary)
                                        
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                            
                            Divider()
                                .overlay(Color.gray.opacity(0.2))
                            
                            // To Location Dropdown (Picker)
                            HStack {
                                Image(systemName: "circle")
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(Color.orange)
                                
                                Text("To")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black)
                                
                                Spacer()
                                
                                Menu {
                                    ForEach(locations, id: \.self) { location in
                                        Button {
                                            toLocation = location
                                        } label: {
                                            HStack {
                                                Text(location)
                                                if location == toLocation {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 8) {
                                        // Display selected value or placeholder
                                        Text(toLocation.isEmpty ? "Select Location" : toLocation)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundStyle(toLocation.isEmpty ? .gray : .primary)
                                        
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.08))
                        )
                        .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                        
                        
                        HStack {
                            Text("Today's Schedule")
                                .font(.system(size:17, weight:.semibold))
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            if !fromLocation.isEmpty || !toLocation.isEmpty {
                                Button{
                                    withAnimation {
                                        fromLocation = ""
                                        toLocation = ""
                                    }
                                }label: {
                                    Text("Clear")
                                        .font(.system(size:13, weight:.semibold))
                                        .foregroundStyle(.blue)                                }
                                
                            }
                        }
                        .padding(.vertical, 20)
                        
                        //Routes List or Empty State
                        if filteredSchedules.isEmpty {
                            emptyStateView
                            //.transition(.opacity.combined(with: .scale(scale: 0.95)))
                        } else {
                            LazyVStack(spacing: 12) {
                                ForEach(filteredSchedules) { route in
                                    scheduleCard(for: route)
                                }
                            }
                        }
                        Spacer()
                    }.scrollIndicators(.hidden)
                        .contentMargins(.top,6)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                
            }
        .navigationBarHidden(true)
    }

    // route availabe
    private func scheduleCard(for route: TransportSchedule) -> some View {
        HStack(spacing: 16) {
            
            // Time Badge
            VStack(alignment: .leading, spacing: 4) {
                Text(route.time)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.primary)
                
                HStack(spacing: 6) {
                    Text(route.fromLocation)
                    Image(systemName: "arrow.right")
                        .font(.caption2)
                    Text(route.toLocation)
                }
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Dynamic Status Label
            Text(route.status)
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(statusColor(for: route.status))
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .background(statusColor(for: route.status).opacity(0.12))
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(statusColor(for: route.status).opacity(0.2))
                )
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius:16))
        .overlay(
            RoundedRectangle(cornerRadius:16)
                .stroke(Color.gray.opacity(0.08))
        )
        .shadow(color:.black.opacity(0.04), radius:5, y:2)
    }

    //empty route
    private var emptyStateView: some View {
        VStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.08))
                    .frame(width: 70, height: 70)
                
                Image(systemName: "bus.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.blue)
            }
            .padding(.top, 20)
            
            Text("No Buses Available")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.primary)
            
            Text("There are no scheduled routes matching your selected locations at this time.")
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button {
                withAnimation {
                    fromLocation = ""
                    toLocation = ""
                }
            } label: {
                Text("Show All Routes")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
            .padding(.top, 6)
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius:16))
        .overlay(
            RoundedRectangle(cornerRadius:16)
                .stroke(Color.gray.opacity(0.08))
        )
        .shadow(color:.black.opacity(0.04), radius:5, y:2)
    }
    
    //color picker fro status
    private func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "on time": return .green
        case "delayed": return .orange
        case "cancelled": return .red
        default: return .gray
        }
    }
        

}

#Preview {
    TransportPage()
}
