
import SwiftUI

struct MarketplaceItem: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let seller: String
    let condition: String
    let icon: String
}

struct BuySellPage: View {
    
    @State private var searchText = ""
    
    let items = [
        MarketplaceItem(title: "Scientific Calculator", price: "₹500", seller: "Aman", condition: "Like New", icon: "function"),
        MarketplaceItem(title: "Engineering Books", price: "₹800", seller: "Priya", condition: "Good", icon: "book.fill"),
        MarketplaceItem(title: "Study Table Lamp", price: "₹350", seller: "Rahul", condition: "Good", icon: "lamp.desk.fill"),
        MarketplaceItem(title: "Bluetooth Speaker", price: "₹900", seller: "Neha", condition: "Like New", icon: "speaker.wave.2.fill")
    ]
    
    var body: some View {
        
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        // Header
                        HStack(spacing: 12) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(.blue)
                                .frame(width: 48, height: 48)
                                .background(Color.blue.opacity(0.10), in: Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Buy & Sell")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text("Buy and sell items within campus")
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
                        
                        // Sell Button
                        Button {
                            // Add item for sale
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Sell an Item")
                                
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
                        Text("Available Items")
                            .font(.system(size: 17, weight: .bold))
                        
                        VStack(spacing: 10) {
                            ForEach(items) { item in
                                HStack(spacing: 13) {
                                    Image(systemName: item.icon)
                                        .font(.system(size: 19))
                                        .foregroundStyle(.blue)
                                        .frame(width: 46, height: 46)
                                        .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(item.title)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(.primary)
                                            .lineLimit(1)
                                        
                                        HStack(spacing: 5) {
                                            Text(item.condition)
                                            Text("•")
                                            Text("by \(item.seller)")
                                        }
                                        .font(.system(size: 11))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 5) {
                                        Text(item.price)
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(.blue)
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 10, weight: .semibold))
                                            .foregroundStyle(.secondary)
                                    }
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
        .navigationTitle("Buy & Sell")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

#Preview {
    NavigationStack {
        BuySellPage()
    }
}
