import SwiftUI

struct HomePage: View {

    var body: some View {
        NavigationStack {
            ZStack{
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
                    
                VStack(spacing: 15){
                    
                        //Header
                        HStack(spacing :20){
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 23, height: 17)
                                .foregroundStyle(.primary)
                            Spacer()
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.primary)
                            
                            NavigationLink{
                                ProfilePage()
                            }label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(Color.blue)
                                    .padding(10)
                                    .background(Color.blue.opacity(0.12))
                                    .clipShape(Circle())
                            }
                            
                        }
                        
                    ScrollView{
                        VStack(alignment: .leading, spacing: 20) {
                            //Title
                            
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    Text("Campus ")
                                        .foregroundStyle(.primary)
                                    Text("Connect")
                                        .foregroundStyle(.blue)
                                }
                                .font(.system(size: 34, weight: .bold))
                                
                                Text("Today at a glance")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundStyle(.secondary)
                                
                            }
                            
                            //Next Event
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Next Event")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundStyle(.secondary)
                                    Text("Orientation Meet")
                                        .font(.system(size: 17, weight: .semibold))
                                    Text("Today • 3:00 PM • Seminar Hall")
                                        .font(.system(size: 15, weight: .regular))
                                        .foregroundStyle(.secondary)
                                    Text("Cultural")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(.blue)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue.opacity(0.12))
                                        .clipShape(Capsule())
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue.opacity(0.08))
                                        .frame(width: 58, height: 58)
                                    Image(systemName: "calendar")
                                        .font(.system(size: 22, weight: .regular))
                                        .foregroundStyle(.blue)
                                    
                                }
                                
                            }.padding()
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.gray.opacity(0.12))
                                )
                                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
                            
                            //Next Bus
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Next Bus")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundStyle(.secondary)
                                    Text("Next bus to Campus")
                                        .font(.system(size: 17, weight: .semibold))
                                    Text("2:15 PM from Civil Lines")
                                        .font(.system(size: 15, weight: .regular))
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Image(systemName: "bus.fill")
                                    .font(.system(size: 42))
                                    .foregroundStyle(.blue)
                            }.padding()
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            
                            
                            //Latest Notice
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Latest Notice")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    Text("Exam timetable announced\nfor B.Tech CS")
                                        .font(.headline)
                                }
                                Spacer()
                                Image(systemName: "megaphone.fill")
                                    .font(.title)
                                    .foregroundStyle(.orange)
                                
                            }
                            .padding()
                            .background(Color.orange.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        
                        
                        //Quick Actions
                        HStack {
                            Text("Quick Actions")
                                .font(.headline)
                            Spacer()
                            Button("View All") {
                            }
                            .font(.subheadline.weight(.semibold))
                        }
                        
                        ConnectSection
                        
                        Spacer()
                    }
                    }.scrollIndicators(.hidden)
                    
                }.padding(.horizontal,16)
                        .padding(.top,10)
                
            }
            
            }
            .navigationBarHidden(true)

        }
    



     var ConnectSection: some View  {

        VStack(spacing: 0) {

            ForEach(Array(connectItems.enumerated()), id: \.element.id) { index, item in

                HStack(spacing: 14){

                    Image(systemName: item.icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.blue)
                        .frame(width: 30)

                    VStack(alignment: .leading, spacing: 3) {

                        Text(item.title)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.primary)

                        Text(item.subtitle)
                            .font(.system(size: 13))
                            .foregroundStyle(.secondary)
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
        }
        
    }
}

#Preview {
    HomePage()
}
