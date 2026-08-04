import SwiftUI

struct ContactDetails: View {
    let contact: Contact_info
    var body: some View {
        NavigationStack {
                VStack(spacing: 0) {
                    
                    //section1
                    VStack(spacing: 0){
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                            .padding(20)
                            .background(Color.blue, in: Circle())
                            .padding(.bottom,15)
                        
                        Text(contact.name)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom,5)

                        Text(contact.department)
                            .font(.system(size: 17, weight: .semibold))
                    }.padding(.bottom, 20)
                    
                    
                    //phone
                    HStack(spacing: 20){
                        Image(systemName: "phone.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.gray.opacity(0.3), in: Circle())
                        
                        Text(contact.phone)
                            .font(.system(size: 15))
                            .foregroundStyle(.primary)
                        
                        Spacer()
                    }.padding(.bottom, 10)
                    
                    Divider()
                        .padding(.bottom, 10)
                    
                    //email
                    HStack(spacing: 20){
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.gray.opacity(0.3), in: Circle())
                        
                        Text(contact.email)
                            .font(.system(size: 15))
                            .foregroundStyle(.primary)
                        
                        Spacer()
                    }.padding(.bottom, 10)
                    
                    Divider()
                        .padding(.bottom, 10)
                    
                    //sitting
                    HStack(spacing: 20){
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.gray.opacity(0.3), in: Circle())
                        
                        Text(contact.sitting)
                            .font(.system(size: 15))
                            .foregroundStyle(.primary)
                        
                        Spacer()
                    }.padding(.bottom, 10)
                    
                    Spacer()
                    
                    HStack(spacing: 30){
                        Button{
                            //call
                        }label:{
                            HStack{
                                Image(systemName: "phone")
                                Text("Call")
                            }.padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            }
                        }
                        
                        Button{
                            //mail
                        }label:{
                            HStack{
                                Image(systemName: "envelope")
                                Text("Mail")
                            }.padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
        }.navigationTitle("Contact Details")
        
    }
}


