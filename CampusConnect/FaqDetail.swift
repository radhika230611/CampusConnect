import SwiftUI

struct FaqDetail: View {
    
    let selectedFaq: FAQ
    
    var body: some View {
        
            ZStack {
                
                // Background
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
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        //Header
                        
                        HStack(spacing: 12) {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(.blue)
                                .frame(width: 46, height: 46)
                                .background(
                                    Color.blue.opacity(0.10)
                                )
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Frequently Asked Question")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundStyle(.secondary)
                                
                                Text("FAQ")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.blue)
                            }
                            
                            Spacer()
                        }
                        
                        //Title
                        Text(selectedFaq.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.blue.opacity(0.7))
                            .frame(width: 45, height: 4)
                        
                        //Content
                        Text(selectedFaq.content)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.primary)
                            .lineSpacing(8)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(22)
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.96))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.blue.opacity(0.08),lineWidth: 1)
                    )
                    .shadow(color: Color.blue.opacity(0.06),radius: 12,y: 5)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                .scrollIndicators(.hidden)
            
        }
        .navigationTitle("FAQ Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
