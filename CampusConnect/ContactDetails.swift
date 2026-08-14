import SwiftUI

struct ContactDetails: View {
    let contact: Contact_info

    var body: some View {
        
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1.00).ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    // Profile
                    VStack(spacing: 8) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 76, height: 76)
                            .background(Color.blue, in: Circle())

                        Text(contact.name)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.primary)

                        Text(contact.department)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                    .background(Color.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .blue.opacity(0.06), radius: 10, y: 4)

                    
                    // Information
                    VStack(spacing: 0) {
                        //phone
                        HStack(spacing: 14) {
                            Image(systemName: "phone.fill")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(.blue)
                                .frame(width: 38, height: 38)
                                .background(Color.blue.opacity(0.10), in: Circle())

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Phone")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundStyle(.secondary)

                                Text(contact.phone)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(.primary)
                                    .lineLimit(2)
                            }

                            Spacer()
                        }
                        .padding(.vertical, 14)
                        
                        //mail
                        HStack(spacing: 14) {
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(.blue)
                                .frame(width: 38, height: 38)
                                .background(Color.blue.opacity(0.10), in: Circle())

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Email")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundStyle(.secondary)

                                Text(contact.email)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(.primary)
                                    .lineLimit(2)
                            }

                            Spacer()
                        }
                        .padding(.vertical, 14)
                        
                        //sitting
                        HStack(spacing: 14) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(.blue)
                                .frame(width: 38, height: 38)
                                .background(Color.blue.opacity(0.10), in: Circle())

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Office")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundStyle(.secondary)

                                Text(contact.sitting)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(.primary)
                                    .lineLimit(2)
                            }

                            Spacer()
                        }
                        .padding(.vertical, 14)
                    }
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.04), radius: 8, y: 3)

                    Spacer()

                    
                    // Action Buttons
                    HStack(spacing: 12) {
                        Button {
                            // call
                        } label: {
                            Label("Call", systemImage: "phone.fill")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 13)
                                .background(Color.blue, in: RoundedRectangle(cornerRadius: 12))
                        }

                        Button {
                            // mail
                        } label: {
                            Label("Mail", systemImage: "envelope.fill")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.blue)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 13)
                                .background(Color.blue.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            .navigationTitle("Contact Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}
