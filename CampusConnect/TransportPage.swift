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
        NavigationStack{
            
            ZStack {
                // Background Gradient
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
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                    
                    ScrollView{
                        // Location Selection Card
                        VStack(spacing: 10) {
                            
                            // From Location Dropdown (Menu)
                            HStack {
                                Image(systemName: "circle")
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(.green)
                                
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
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                            
                            Divider()
                            
                            // To Location Dropdown (Picker)
                            HStack {
                                Image(systemName: "circle")
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(.red)
                                
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
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                        
                        
                        HStack {
                            Text("Today's Schedule")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            if !fromLocation.isEmpty || !toLocation.isEmpty {
                                Button{
                                    withAnimation {
                                        fromLocation = ""
                                        toLocation = ""
                                    }
                                }label: {
                                    Text("Clear Filters")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(.blue)
                                }
                                
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
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 10)
                
            }
        }
    }

    // route availabe
    private func scheduleCard(for route: TransportSchedule) -> some View {
        HStack(spacing: 16) {
            
            // Time Badge
            VStack(alignment: .leading, spacing: 4) {
                Text(route.time)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.primary)
                
                HStack(spacing: 6) {
                    Text(route.fromLocation)
                    Image(systemName: "arrow.right")
                        .font(.caption2)
                    Text(route.toLocation)
                }
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Dynamic Status Label
            Text(route.status)
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(statusColor(for: route.status))
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(statusColor(for: route.status).opacity(0.12))
                .clipShape(Capsule())
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
    }

    //empty route
    private var emptyStateView: some View {
        VStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.08))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "bus.double.fill")
                    .font(.system(size: 36))
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
                    .cornerRadius(10)
            }
            .padding(.top, 6)
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
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
