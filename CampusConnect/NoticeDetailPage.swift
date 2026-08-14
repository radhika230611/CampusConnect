import SwiftUI

struct NoticeDetailPage: View {
    
    let notice: Notice
    @State private var showDownloadDialog = false
    var shareOptions = [
        (title: "WhatsApp", icon: "message.fill"),
        (title: "Telegram", icon: "paperplane.fill"),
        (title: "Email", icon: "envelope.fill"),
        (title: "More", icon: "ellipsis")
    ]
    
    var body: some View {
        ZStack{
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        VStack(alignment: .leading, spacing: 18) {
                            
                            // Category
                            Text(notice.category.rawValue.uppercased())
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.blue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule()
                                        .fill(Color.blue.opacity(0.10))
                                )
                            
                            // Title
                            Text(notice.title)
                                .font(.system(size: 25, weight: .bold))
                                .foregroundStyle(.primary)
                                .fixedSize(
                                    horizontal: false,
                                    vertical: true
                                )
                            
                            // Date
                            HStack(spacing: 10) {
                                
                                Image(systemName: "calendar")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.blue)
                                    .frame(width: 32, height: 32)
                                    .background(
                                        Circle()
                                            .fill(Color.blue.opacity(0.10))
                                    )
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Published")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.secondary)
                                    
                                    Text(notice.date.formatted(date: .abbreviated, time: .omitted))
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.primary)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(22)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue.opacity(0.07),lineWidth: 1)
                        )
                        .shadow(color: Color.blue.opacity(0.05),radius: 10,y: 4)
                        
                        //Notice Content
                        VStack(alignment: .leading, spacing: 18) {
                            
                            HStack(spacing: 8) {
                                Image(systemName: "doc.text.fill")
                                    .foregroundStyle(.blue)
                                
                                Text("NOTICE")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(.blue)
                            }
                            
                            Text(notice.details)
                                .font(.system(size: 16))
                                .foregroundStyle(.primary)
                                .lineSpacing(8)
                                .fixedSize(
                                    horizontal: false,
                                    vertical: true
                                )
                        }
                        .padding(22)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(
                                    Color.gray.opacity(0.08),
                                    lineWidth: 1
                                )
                        )
                        
                        
                        //Attachment
                        VStack(alignment: .leading, spacing: 14) {
                            
                            HStack {
                                Text("ATTACHMENT")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(.secondary)
                                
                                Spacer()
                                
                                Text("PDF")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundStyle(.red)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .fill(Color.red.opacity(0.10))
                                    )
                            }
                            
                            HStack(spacing: 14) {
                                
                                // PDF Icon
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red.opacity(0.10))
                                    
                                    Image(systemName: "doc.fill")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.red)
                                }
                                .frame(width: 48, height: 52)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("\(notice.title).pdf")
                                        .font(.system(size: 14,weight: .semibold))
                                        .lineLimit(1)
                                    
                                    Text("PDF • 1.2 MB")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Button {
                                    withAnimation(.bouncy(duration: 0.5,extraBounce: 0.2)) {
                                            showDownloadDialog = true
                                        }

                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            withAnimation(.easeIn(duration: 0.4)) {
                                                showDownloadDialog = false
                                            }
                                        }
                                } label: {
                                    Image(systemName: "arrow.down")
                                        .font(.system(size: 16,weight: .semibold))
                                        .foregroundStyle(.blue)
                                        .frame(width: 42, height: 42)
                                        .background(
                                            Circle()
                                                .fill(Color.blue.opacity(0.10))
                                        )
                                }
                            }
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(
                                    Color.gray.opacity(0.08),
                                    lineWidth: 1
                                )
                        )
                        
                        
                        // Share
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Text("SHARE NOTICE")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.secondary)
                            
                            HStack {
                                ForEach(shareOptions,id: \.title) { option in
                                    
                                    VStack(spacing: 8) {
                                        
                                        Image(systemName: option.icon)
                                            .font(.system(size: 18,weight: .medium))
                                            .foregroundStyle(.black)
                                            .frame(width: 52,height: 52)
                                            .background(
                                                Circle()
                                                    .fill(
                                                        Color.blue.opacity(0.08)
                                                    )
                                            )
                                        
                                        Text(option.title)
                                            .font(.system(size: 12))
                                            .foregroundStyle(.secondary)
                                    }
                                    
                                    if option.title != "More" {
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 4)
                        
                        
                        //Help Card
                        HStack(spacing: 14) {
                            
                            Image(systemName: "questionmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.blue)
                                .frame(width: 42, height: 42)
                                .background(
                                    Circle()
                                        .fill(Color.blue.opacity(0.10))
                                )
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text("Need more help?")
                                    .font(.system(size: 15,weight: .semibold))
                                
                                Text("Reach out to your department office.")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(18)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.blue.opacity(0.06))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(
                                    Color.blue.opacity(0.08),
                                    lineWidth: 1
                                )
                        )
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .padding(.bottom, 25)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 10)
                
            }
            .navigationTitle("Notice")
            .navigationBarTitleDisplayMode(.inline)
            
            if showDownloadDialog{
                ZStack(alignment: .top) {
                    Color.gray.opacity(0.2)
                       .ignoresSafeArea()
                    
                   DownloadPdf(currentNotice: notice)
                        
                }
                .zIndex(1)
            }
            
        }
        
    }
    
    
}

struct DownloadPdf : View{
    let currentNotice : Notice
    var body : some View{
        HStack{
            Image(systemName: "arrow.down")
                .font(.system(size: 15,weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 30, height: 30)
                .background(
                    Circle()
                        .fill(Color.green.opacity(0.8))
                )
            VStack(alignment: .leading, spacing: 5) {
                
                Text("\(currentNotice.title).pdf")
                    .font(.system(size: 14,weight: .semibold))
                    .lineLimit(1)
                
                Text("Download Complete")
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            Spacer()

            
        }.padding(15)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.88)))
            .overlay(RoundedRectangle(cornerRadius: 20) .stroke(Color.gray.opacity(0.08),lineWidth: 1))
            .padding()
    }
}

#Preview {
    NoticeDetailPage(notice: notices[0])
    //DownloadPdf()
}



