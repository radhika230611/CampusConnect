


import SwiftUI

struct SuggestionPage: View {

    enum FeedbackType: String, CaseIterable {
        case suggestion = "Suggestion"
        case complaint = "Complaint"
    }
    
    var suggestion : [String] = []
    @State private var selectedType: FeedbackType = .suggestion
    @State private var message = ""
    @State private var submitted = false
    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {

                    //Type
                    Text("Type")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.black)

                    Picker("", selection: $selectedType) {
                        ForEach(FeedbackType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                        }
                    }
                   .pickerStyle(.segmented)
                

                    //Message
                    Text("Message")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.black)

                    ZStack(alignment: .topLeading) {

                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            .frame(height: 180)

                        TextEditor(text: $message)
                            .padding(8)
                            .frame(height: 180)
                            .scrollContentBackground(.hidden)

                        if message.isEmpty {
                            Text(selectedType == .suggestion ?
                                 "Describe your suggestion..." :
                                 "Describe your complaint...")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .padding(.leading, 14)
                                .allowsHitTesting(false)
                        }
                    }

                    //Submit Button
                    Button {

                        if !message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            submitted = true
                            message = ""
                        }

                    } label: {

                        Text("Submit")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.blue)
                            .cornerRadius(12)

                    }

                    //Success Message
                    if submitted {

                        HStack(spacing: 10) {

                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.title3)

                            Text("Thank you for your feedback!")
                                .font(.subheadline)
                                .foregroundColor(.primary)

                        }
                        .transition(.opacity)
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Send Suggestion / Complaint")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SuggestionPage()
}
