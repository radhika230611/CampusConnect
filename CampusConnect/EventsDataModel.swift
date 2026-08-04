import SwiftUI

enum EventCategory: String, CaseIterable, Hashable {
    case technical = "Technical"
    case cultural = "Cultural"
    case sports = "Sports"
    case all = "All"
}

struct Event: Identifiable, Hashable {
    let id = UUID()
    let img: String
    let title: String
    let date: String
    let time: String
    let location: String
    let category: EventCategory
    let details: EventDetails
}

struct EventDetails: Identifiable, Hashable {
    let id = UUID()
    let content: String
    let organizer: Organizer
}

struct Organizer: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let img: String
    let mail: String
    let contact: String
}

let events: [Event] = [
    Event(
        img: "Hackathon",
        title: "HACKATHON 2026",
        date: "Sat, 27 July",
        time: "10:00 AM",
        location: "Auditorium",
        category: .technical,
        details: EventDetails(
            content: "A 24-hour coding competition where teams build innovative solutions.",
            organizer: Organizer(
                name: "Coding Club",
                img: "codingclub",
                mail: "codingclub@college.edu",
                contact: "+91 9876543210"
            )
        )
    ),

    Event(
        img: "Fest",
        title: "Sarang Fest",
        date: "Sun, 28 July",
        time: "5:00 PM",
        location: "Open Air Theatre",
        category: .cultural,
        details: EventDetails(
            content: "Annual cultural fest featuring music, dance, and drama performances.",
            organizer: Organizer(
                name: "Cultural Committee",
                img: "cultural",
                mail: "cultural@college.edu",
                contact: "+91 9876543211"
            )
        )
    ),

    Event(
        img: "Workshop",
        title: "AI Workshop",
        date: "Mon, 29 July",
        time: "11:30 AM",
        location: "Lab Block 2",
        category: .technical,
        details: EventDetails(
            content: "Hands-on workshop covering AI, Machine Learning, and Swift integration.",
            organizer: Organizer(
                name: "AI Club",
                img: "Workshop",
                mail: "ai@college.edu",
                contact: "+91 9876543212"
            )
        )
    ),

    Event(
        img: "Dance",
        title: "Dance Battle",
        date: "Tue, 30 July",
        time: "4:00 PM",
        location: "Main Stage",
        category: .cultural,
        details: EventDetails(
            content: "An inter-college dance competition with solo and group performances.",
            organizer: Organizer(
                name: "Dance Club",
                img: "Dance",
                mail: "dance@college.edu",
                contact: "+91 9876543213"
            )
        )
    ),

    Event(
        img: "Cricket",
        title: "Inter College Cricket",
        date: "Wed, 31 July",
        time: "8:00 AM",
        location: "Sports Ground",
        category: .sports,
        details: EventDetails(
            content: "Cricket tournament featuring teams from multiple colleges.",
            organizer: Organizer(
                name: "Sports Committee",
                img: "Cricket",
                mail: "sports@college.edu",
                contact: "+91 9876543214"
            )
        )
    ),

    Event(
        img: "Football",
        title: "Football League",
        date: "Thu, 1 August",
        time: "3:30 PM",
        location: "Football Field",
        category: .sports,
        details: EventDetails(
            content: "Inter-department football league with knockout matches.",
            organizer: Organizer(
                name: "Football Club",
                img: "Football",
                mail: "football@college.edu",
                contact: "+91 9876543215"
            )
        )
    )
]
