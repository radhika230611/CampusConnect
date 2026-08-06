import SwiftUI

struct MorePage: View {
    @State private var selectedContact : Contact_info?
    @State private var selectedFaq : FAQ?
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView(.vertical){
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Header
                        HStack(spacing: 15) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 23, height: 17)
                            
                            Text("More")
                                .font(.system(size: 25, weight: .bold))
                            
                            Spacer()
                        }
                        .padding(.bottom, 24)
                        
                        // Contacts Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Important Contacts")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.primary)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(Array(contacts.enumerated()), id: \.element.id) { index, contact in
                                    HStack(spacing: 12) {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18)
                                            .foregroundStyle(.blue)
                                            .padding(10)
                                            .background(Color.blue.opacity(0.12), in: Circle())
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(contact.department)
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundStyle(.primary)
                                            
                                            HStack(spacing: 4) {
                                                Text(contact.phone)
                                                Text("•")
                                                Text(contact.email)
                                            }
                                            .font(.system(size: 13))
                                            .foregroundStyle(.secondary)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.vertical, 10)
                                    
                                    .onTapGesture {
                                        selectedContact = contact
                                    }
                                    
                                    if index < contacts.count - 1 {
                                        Divider()
        
                                    }
                                }
                            }.navigationDestination(item: $selectedContact){index in
                                ContactDetails(contact: index)
                            }
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius:16))
                            .overlay(
                                RoundedRectangle(cornerRadius:16)
                                    .stroke(Color.gray.opacity(0.08))
                            )
                            .shadow(color:.black.opacity(0.04), radius:5, y:2)
                                
                            
                        }.padding(.bottom, 24)
                        
                        
                        //FAQ Section
                        VStack(alignment: .leading, spacing: 12){
                            Text("FAQs")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.primary)
                            
                            VStack(spacing: 0) {
                                ForEach(Array(sampleFAQs.enumerated()), id: \.element.id) { index, faq in

                                    HStack {
                                        Text(faq.title)
                                            .font(.system(size: 14, weight: .medium))

                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(.gray)
                                            
                                        
                                    }.onTapGesture{
                                        selectedFaq = faq
                                    }
                                    .padding(.vertical, 14)

                                    if index < sampleFAQs.count - 1 {
                                        Divider()
                                    }
                                }
                            }.navigationDestination(item: $selectedFaq){ faq in
                                FaqDetail(selectedFaq: faq)
                            }
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius:16))
                            .overlay(
                                RoundedRectangle(cornerRadius:16)
                                    .stroke(Color.gray.opacity(0.08))
                            )
                            .shadow(color:.black.opacity(0.04), radius:5, y:2)
                        }.padding(.bottom, 24)
                        
                        //Suggestion , complaint
                        VStack(alignment: .leading, spacing: 12){
                            Text("Suggestions")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.primary)
                            NavigationLink{
                                SuggestionPage()
                            }label: {
                                HStack{
                                    Text("Send Suggestion / Complaint")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Image(systemName:"bubble.left.and.text.bubble.right.fill")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundStyle(.blue )
                                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius:16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius:16)
                                            .stroke(Color.gray.opacity(0.08))
                                    )
                                    .shadow(color:.black.opacity(0.04), radius:5, y:2)
                            }
                            
                        }.padding(.bottom, 24)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                }
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    MorePage()
}
