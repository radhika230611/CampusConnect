import SwiftUI

struct MorePage: View {
    @State private var selectedContact : Contact_info?
    @State private var showFaqDetail : Bool = false
    var body: some View {
        NavigationStack {
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
                    .padding(.bottom, 20)
                    
                    // Contacts Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Important Contacts")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.primary)
                        
                        VStack(spacing: 0) {
                            ForEach(Array(contacts.enumerated()), id: \.element.id) { index, contact in
                                HStack(spacing: 12) {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 18, height: 18)
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(Color.blue, in: Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(contact.department)
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundStyle(.primary)
                                        
                                        HStack(spacing: 4) {
                                            Text(contact.phone)
                                            Text("•")
                                            Text(contact.email)
                                        }
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 10)
                               
                                .onTapGesture {
                                    selectedContact = contact
                                }
                                
                                if index < contacts.count - 1 {
                                    Divider()
                                        .padding(.leading, 50)
                                }
                            }
                        }.navigationDestination(item: $selectedContact){index in
                            ContactDetails(contact: index)
                            }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                            
                        )
                    }.padding(.bottom, 20)
                    
                    
                    //FAQ Section
                    VStack(alignment: .leading, spacing: 12){
                        Text("FAQs")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.primary)
                        
                        VStack{
                            ForEach(sampleFAQs){ Faq in
                                HStack{
                                    Text(Faq.title)
                                        .font(.system(size: 14, weight: .medium))
                                    Spacer()
                                    Button{
                                       //showFaqDetail.toggle()
                                    }label: {
                                        Image(systemName: showFaqDetail ? "chevron.up"  : "chevron.down")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(.black)
                                    }
                                    
                                }.padding(.bottom, 10)
                                
                                
                            }
                        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                            )
                    }.padding(.bottom, 20)
                    
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
                                Image(systemName: "ellipsis.message.fill")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.blue )
                            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                                )
                        }
                        
                    }.padding(.bottom, 20)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    MorePage()
}
