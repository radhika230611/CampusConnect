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
        content: """
To register for a campus event, open the Events section from the bottom navigation bar and browse the available events.

Follow these steps:

• Select the event you wish to attend.
• Review the event details, including date, time, venue, eligibility, and organizer.
• Tap the Register button.
• Confirm your registration when prompted.

After successful registration:

• A confirmation message will appear in the app.
• You may also receive a confirmation email or notification.
• You can revisit the event page anytime to view your registration status or any updates posted by the organizers.

If registration is closed or seats are full, the event page will display the current availability.
"""
    ),

    FAQ(
        title: "Where can I view my class schedule?",
        content: """
Your personalized class schedule is available in the Academics section on the Home page.

The timetable includes:

• Lecture timings
• Laboratory sessions
• Classroom numbers
• Faculty information
• Course names

Please note:

• Any timetable updates made by your department are automatically reflected in the app.
• Cancelled or rescheduled lectures will also appear here.
• Students are encouraged to check their timetable daily before attending classes.

If your schedule is missing or incorrect, contact your department office.
"""
    ),

    FAQ(
        title: "How do I contact technical support?",
        content: """
If you experience any problems while using the Campus Connect application, our IT Support team is available to help.

Common issues include:

• Login problems
• App crashes
• Missing notices or events
• Slow performance
• Password reset requests

You can contact support by:

• Email: support@campusconnect.edu
• Visiting the IT Helpdesk in the Main Library
• Calling the support number listed in the Important Contacts section

When reporting an issue, include:

• Your Student ID
• Device model
• App version
• Screenshots (if available)

Providing complete information helps us resolve your issue faster.
"""
    ),

    FAQ(
        title: "How can I update my profile details?",
        content: """
You can manage most of your personal information from the **More** section of the application.

To update your profile:

• Open More.
• Tap Edit Profile.
• Modify the required information.
• Tap Save Changes.

You can update:

• Phone number
• Profile photo
• Emergency contact
• Communication preferences

Please note:

• Student ID
• University email
• Department
• Enrollment details

cannot be edited by students. Contact the administration office if any of this information is incorrect.
"""
    ),

    FAQ(
        title: "What should I do if I lose my student ID card?",
        content: """
If your student ID card is lost or stolen, report it immediately to avoid unauthorized access.

You should:

• Inform the Campus Security Office.
• Contact Student Affairs.
• Report the incident through the Important Contacts section in the app.

After reporting:

• Your old ID card will be deactivated.
• You can apply for a replacement card.
• Pay the prescribed replacement fee if applicable.
• Collect the new ID card once it has been issued.

Until your replacement card is ready, carry any temporary identification provided by the university whenever required.
"""
    )
]





