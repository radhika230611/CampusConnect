import SwiftUI
import FirebaseFirestore
import FirebaseAuth

private extension Error {
    var userFriendlyAuthmessage: String {
        if
            localizedDescription
                .localizedCaseInsensitiveContains("Malformed") ||
                localizedDescription
                .localizedCaseInsensitiveContains("expired")
        {
            return "Please check your email and password"
        }
        return localizedDescription
    }
    
}

enum authservice {
    static func SignUp(email:String , username : String, Password: String , completion: @escaping(String,Bool)->Void){
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !trimmedUsername.isEmpty, !Password.isEmpty else {
            completion("Please fill in all fields",false)
            return
        }
        Auth.auth() .createUser(withEmail: trimmedEmail, password: Password) { result, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(error.localizedDescription,false)
                }
                return
                
            }
            guard let userID = result?.user.uid else {
                DispatchQueue.main.async {
                    completion("unable to create user.", false)
                }
                return
                
            }
            Firestore.firestore().collection("users").document(userID).setData([
                "username": trimmedUsername,
                "email": trimmedEmail,
                "created": FieldValue.serverTimestamp()
            ]) { error in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(error.localizedDescription,false)
                    } else {
                        completion("ACCOUNT CREATED SUCCESSFULLY",true)
                    }
                }
            }
        }
    }
    static func logIn(email:String, Password: String, completion: @escaping(String,Bool)->Void){
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedEmail.isEmpty, !Password.isEmpty else {
            completion("Please fill in all fields",false)
            return
        }
        Auth.auth().signIn(withEmail: trimmedEmail, password: Password ) { _, error in
            
                DispatchQueue.main.async {
                    if let error  {
                        completion(error.userFriendlyAuthmessage,false)
                    }else{
                        completion("account is created Successfully",true)
                    }
                }
            }
        }
    }
    

