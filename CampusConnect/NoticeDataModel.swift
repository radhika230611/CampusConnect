import SwiftUI

enum NoticeCategory: String, CaseIterable, Hashable {
    case academics = "Academics"
    case exams = "Exams"
    case hostel = "Hostel"
    case admin = "Admin"
    case all = "All"
    
    var color: Color {
        switch self {
        case .academics:
            return .green
            
        case .exams:
            return .yellow
            
        case .hostel:
            return .orange
            
        case .admin:
            return .blue
            
        case .all:
            return .gray
        }}
}

struct Notice: Identifiable, Hashable {
    let id = UUID()
    let img: String
    let title: String
    let message: String
    let date: String
    let category: NoticeCategory
    let details: String
   
}


let notices: [Notice] = [
    Notice(
        img: "calendar.badge",
        title: "Semester Registration Open",
        message: "Registration for the odd semester has started.",
        date: "24 July 2026",
        category: .academics,
        details: "Students must complete their semester registration before 31 July 2026 through the college portal. Late registrations may incur additional charges."
    ),

    Notice(
        img: "note.text",
        title: "Mid Semester Exams",
        message: "Exam timetable has been published.",
        date: "25 July 2026",
        category: .exams,
        details: "Mid-semester examinations will begin on 10 August 2026. Students should download the timetable from the examination portal."
    ),

    Notice(
        img: "wallet.bifold",
        title: "Water Supply Maintenance",
        message: "Temporary water shutdown.",
        date: "26 July 2026",
        category: .hostel,
        details: "Water supply in all hostels will remain unavailable from 9:00 AM to 1:00 PM due to maintenance work."
    ),

    Notice(
        img: "personalhotspot",
        title: "Fee Payment Reminder",
        message: "Last date for fee payment announced.",
        date: "27 July 2026",
        category: .admin,
        details: "Students are requested to pay their semester fees before 5 August 2026 to avoid a late fee."
    ),

    Notice(
        img: "calendar.badge",
        title: "Library Orientation",
        message: "Orientation for first-year students.",
        date: "28 July 2026",
        category: .academics,
        details: "The orientation session will be held in the Central Library at 11:00 AM. Attendance is recommended for all first-year students."
    ),

    Notice(
        img: "note.text",
        title: "Admit Cards Available",
        message: "Download your admit card.",
        date: "29 July 2026",
        category: .exams,
        details: "Students can download their admit cards from the student portal. Carry a printed copy to every examination."
    )
]



