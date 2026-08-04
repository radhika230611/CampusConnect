
import SwiftUI

// MARK: - Models & Sample Data


let sampleTransportData: [TransportSchedule] = [
    TransportSchedule(toLocation: "Campus", fromLocation: "Civil Lines", time: "07:15 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Panipat", time: "07:30 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Samalkha", time: "07:45 AM", status: "Delayed"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Shamli", time: "08:00 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Railway Station", time: "08:15 AM", status: "On Time"),
    TransportSchedule(toLocation: "Civil Lines", fromLocation: "Campus", time: "01:30 PM", status: "On Time"),
    TransportSchedule(toLocation: "Railway Station", fromLocation: "Campus", time: "04:30 PM", status: "On Time"),
    TransportSchedule(toLocation: "Panipat", fromLocation: "Campus", time: "05:00 PM", status: "Cancelled")
]

// MARK: - Main Transport Page
struct TransportPage2: View {
    
    @State private var fromLocation: String = ""
    @State private var toLocation: String = ""
    
    // Filtered schedules based on drop-down selections
    var filteredSchedules: [TransportSchedule] {
        sampleTransportData.filter { route in
            let matchesFrom = fromLocation.isEmpty || route.fromLocation == fromLocation
            let matchesTo = toLocation.isEmpty || route.toLocation == toLocation
            return matchesFrom && matchesTo
        }
    }
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.85),
                    Color.cyan.opacity(0.15),
                    Color(UIColor.systemGroupedBackground)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // MARK: - Header
                HStack(spacing: 15) {
                    Image(systemName: "line.3.horizontal")
                        .font(.title3.weight(.bold))
                    
                    Text("Transport")
                        .font(.system(size: 26, weight: .bold))
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "bell.fill")
                            .font(.title3)
                            .padding(8)
                            .background(.white.opacity(0.2), in: Circle())
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 24)
                .padding(.top, 12)
                .padding(.bottom, 20)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        
                        // MARK: - Location Selection Card
                        VStack(spacing: 12) {
                            
                            // From Selector
                            locationMenuRow(
                                title: "From",
                                iconColor: .green,
                                selection: $fromLocation
                            )
                            
                            HStack {
                                Divider()
                                    .padding(.leading, 34)
                                
                                Spacer()
                                
                                // Route Swap Button
                                Button {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        let temp = fromLocation
                                        fromLocation = toLocation
                                        toLocation = temp
                                    }
                                } label: {
                                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                                        .font(.title3)
                                        .foregroundStyle(.blue)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                .padding(.trailing, 12)
                            }
                            .frame(height: 10)
                            
                            // To Selector
                            locationMenuRow(
                                title: "To",
                                iconColor: .red,
                                selection: $toLocation
                            )
                        }
                        .padding(16)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 4)
                        
                        // MARK: - Schedule Header & Reset
                        HStack {
                            Text("Today's Schedule")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            if !fromLocation.isEmpty || !toLocation.isEmpty {
                                Button("Clear Filters") {
                                    withAnimation {
                                        fromLocation = ""
                                        toLocation = ""
                                    }
                                }
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.blue)
                            }
                        }
                        .padding(.top, 4)
                        
                        // MARK: - Routes List or Empty State
                        if filteredSchedules.isEmpty {
                            emptyStateView
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        } else {
                            LazyVStack(spacing: 12) {
                                ForEach(filteredSchedules) { route in
                                    scheduleCard(for: route)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 30)
                }
            }
        }
    }
    
    // MARK: - Subviews & Helpers
    
    @ViewBuilder
    private func locationMenuRow(title: String, iconColor: Color, selection: Binding<String>) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "circle.fill")
                .font(.system(size: 10))
                .foregroundStyle(iconColor)
                .frame(width: 22, height: 22)
                .background(iconColor.opacity(0.15), in: Circle())
            
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Menu {
                Button("Any Location") {
                    selection.wrappedValue = ""
                }
                Divider()
                
                ForEach(locations, id: \.self) { loc in
                    Button {
                        selection.wrappedValue = loc
                    } label: {
                        HStack {
                            Text(loc)
                            if loc == selection.wrappedValue {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            } label: {
                HStack(spacing: 6) {
                    Text(selection.wrappedValue.isEmpty ? "Select Location" : selection.wrappedValue)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(selection.wrappedValue.isEmpty ? .gray : .primary)
                    
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.gray)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 10)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
            }
        }
    }
    
    @ViewBuilder
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
    
    // MARK: - Empty State View
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
    TransportPage2()
}
