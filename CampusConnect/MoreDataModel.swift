import SwiftUI

struct Contact_info : Identifiable, Hashable{
    let id = UUID()
    let name: String
    let department: String
    let email: String
    let phone: String
    let sitting: String
}

struct FAQ : Identifiable, Hashable{
    let id = UUID()
    let title: String
    let content: String
}


let contacts : [Contact_info] = [
    Contact_info(name: "Dr. Neha Sharma",
                 department: " HOD, Computer Science",
                 email: "hodcs@campus.in",
                 phone: "9123456780",
                 sitting: "A-Block, Room 201"),
    Contact_info(name: "Mr. Amit Kumar",
                 department: "Head, Exam Cell",
                 email: "examcell@campus.in",
                 phone: "9123456780",
                 sitting: "C-Block, Room 103"),
    Contact_info(name: "Mrs. Priya Sharma",
                 department: "Warden, Hostel",
                 email: "warden@campus.in",
                 phone: "9123452380",
                 sitting: "Hostel-2, Room 101")
]

let sampleFAQs: [FAQ] = [
    FAQ(
        title: "How do I register for campus events?",
        content: "Navigate to the Events tab, select the event you want to attend, and tap the 'Register' button at the bottom of the screen."
    ),
    FAQ(
        title: "Where can I view my class schedule?",
        content: "Your personalized schedule is available under the Academics section on your Home dashboard."
    ),
    FAQ(
        title: "How do I contact technical support?",
        content: "For app issues or portal login assistance, email support@campusconnect.edu or visit the IT Helpdesk in the main library."
    ),
    FAQ(
        title: "How can I update my profile details?",
        content: "Go to the More tab, tap on 'Edit Profile', make your desired updates, and tap 'Save Changes'."
    ),
    FAQ(
        title: "What should I do if I lose my student ID card?",
        content: "Report lost cards immediately at the Campus Security office or through the 'Important Contacts' section to prevent unauthorized access."
    )
]





