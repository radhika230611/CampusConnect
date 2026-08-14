import SwiftUI

struct QuickActionPage: View {
    
    var body: some View {
       
            VStack(spacing: 0) {
                
                // Student Community
                NavigationLink {
                    StudentCommunityPage()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "person.2.fill")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.blue)
                            .frame(width: 30)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Student Community")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.black)
                            
                            Text("Discuss, share and connect")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                
                // Lost & Found
                NavigationLink {
                    LostFoundPage()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.blue)
                            .frame(width: 30)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Lost & Found")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.black)
                            
                            Text("Lost something? We can help!")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                
                // Buy & Sell
                NavigationLink {
                    BuySellPage()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.blue)
                            .frame(width: 30)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Buy & Sell")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.black)
                            
                            Text("Buy or sell within campus")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                
                // Clubs & Societies
                NavigationLink {
                    ClubsSocietiesPage()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.blue)
                            .frame(width: 30)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Clubs & Societies")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.black)
                            
                            Text("Explore and join clubs")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                
                Spacer()
            
        }
    }
}

#Preview {
    QuickActionPage()
}
