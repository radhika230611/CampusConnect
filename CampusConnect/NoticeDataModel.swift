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
            return Color(red: 0.95, green: 0.67, blue: 0.12)
            
        case .exams:
            return Color(red: 0.88, green: 0.25, blue: 0.28)
            
        case .hostel:
            return Color(red: 0.00, green: 0.68, blue: 0.84)
            
        case .admin:
            return Color(red: 0.16, green: 0.27, blue: 0.55)
            
        case .all:
            return .blue
        }}
}

struct Notice: Identifiable, Hashable {
    let id = UUID()
    let img: String
    let title: String
    let message: String
    let date : Date
    let category: NoticeCategory
    let details: String
   
}

enum NoticeSortOption: CaseIterable, Hashable {
    case az
    case za
    case latest
    case oldest

}


let notices: [Notice] = [
    Notice(
        img: "calendar.badge",
        title: "Semester Registration Open",
        message: "Registration for the odd semester has started.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 7,day: 28))!,
        category: .academics,
        details: "Students must complete their semester registration before 31 July 2026 through the college portal. Late registrations may incur additional charges."
    ),

    Notice(
        img: "note.text",
        title: "Mid Semester Exams",
        message: "Exam timetable has been published.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 8,day: 20))!,
        category: .exams,
        details: "Mid-semester examinations will begin on 10 August 2026. Students should download the timetable from the examination portal."
    ),

    Notice(
        img: "wallet.bifold",
        title: "Water Supply Maintenance",
        message: "Temporary water shutdown.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 7,day: 12))!,
        category: .hostel,
        details: "Water supply in all hostels will remain unavailable from 9:00 AM to 1:00 PM due to maintenance work."
    ),

    Notice(
        img: "personalhotspot",
        title: "Fee Payment Reminder",
        message: "Last date for fee payment announced.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 8,day: 10))!,
        category: .admin,
        details: "Students are requested to pay their semester fees before 5 August 2026 to avoid a late fee."
    ),

    Notice(
        img: "calendar.badge",
        title: "Library Orientation",
        message: "Orientation for first-year students.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 7,day: 1))!,
        category: .academics,
        details: "The orientation session will be held in the Central Library at 11:00 AM. Attendance is recommended for all first-year students."
    ),

    Notice(
        img: "note.text",
        title: "Admit Cards Available",
        message: "Download your admit card.",
        date: Calendar.current.date(from: DateComponents(year: 2026,month: 8,day: 2))!,
        category: .exams,
        details: "Students can download their admit cards from the student portal. Carry a printed copy to every examination."
    )
]



