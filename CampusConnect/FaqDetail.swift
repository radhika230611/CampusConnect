import SwiftUI

struct FaqDetail: View {

    let selectedFaq: FAQ

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 20) {

                // Title
                Text(selectedFaq.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.primary)

                Divider()

                // Content
                Text(selectedFaq.content)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.primary)
                    .lineSpacing(10)          // Space between lines
                    .multilineTextAlignment(.leading)

            }
            .padding(20)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.gray.opacity(0.08), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, y: 2)
            .padding(.horizontal, 12)
            .padding(.top, 10)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("FAQ Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}


