import SwiftUI

struct NoticeDetailPage: View {
    let notice: Notice
    var shareOptions = [
         (title: "WhatsApp", icon: "message.fill"),
         (title: "Telegram", icon: "paperplane.fill"),
         (title: "Email", icon: "envelope.fill"),
         (title: "More", icon: "ellipsis")
    ]
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {


                    //Notice Header
                    VStack(alignment: .leading, spacing: 18) {

                        Text(notice.category.rawValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.blue)

                        Text(notice.title)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundStyle(.primary)
                            .fixedSize(horizontal: false, vertical: true)

                        // Date + New Badge
                        HStack {
                            HStack(spacing: 10) {
                                Image(systemName: "calendar")
                                    .font(.system(size: 17))
                                    .foregroundStyle(.secondary)

                                Text(notice.date)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                        }

                        Divider()
                            .padding(.top, 4)
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 20)

                    //Notice Content
                    VStack(alignment: .leading, spacing: 24) {

                        Text(notice.details)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.primary)
                        .lineSpacing(8)

                        Divider()

                        // Attachment
                        VStack(alignment: .leading, spacing: 16) {

                            Text("ATTACHMENTS (1)")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.primary)

                            HStack(spacing: 14) {

                                // PDF Icon
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.red)

                                    Text("PDF")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 45, height: 50)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("\(notice.title).pdf")
                                        .font(.system(size: 15, weight: .medium))

                                    Text("1.2 MB")
                                        .font(.system(size: 13))
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "arrow.down")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundStyle(.primary)
                                        .frame(width: 45, height: 45)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray.opacity(0.25))
                                        )
                                }
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.systemBackground))
                                    .shadow(
                                        color: .black.opacity(0.05),
                                        radius: 8,
                                        x: 0,
                                        y: 3
                                    )
                            )
                        }

                        Divider()
                            .padding(.top, 8)

                        //Share Notice
                        HStack(spacing : 25){
                            ForEach(shareOptions, id: \.title) { option in
                                VStack(spacing: 10){
                                    Image(systemName: option.icon)
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundStyle(.primary)
                                        .frame(width: 58, height: 58)
                                        .background(
                                            Circle()
                                                .fill(Color(.systemBackground))
                                                .overlay(
                                                    Circle()
                                                        .stroke(
                                                            Color.gray.opacity(0.2),
                                                            lineWidth: 1
                                                        )
                                                )
                                        )
                                
                                    Text(option.title)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.primary)
                                }
                            }
                        }.padding(.horizontal)


                        //Help Card
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Need more help?")
                                    .font(.system(size: 15, weight: .semibold))

                                Text("Reach out to your department office.")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                        )
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 28)
                    .padding(.bottom, 40)
                }
            }
        }
        
    }
}


