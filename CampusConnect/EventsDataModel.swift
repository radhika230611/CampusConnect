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
            content: """
            HACKATHON 2026 is a 24-hour coding competition where students work in teams to design, develop, and present innovative technology-based solutions to real-world problems.

            Participants will have the opportunity to work with different technologies, collaborate with other students, and turn their ideas into working prototypes.

            Key Highlights:
            • 24-hour coding and development challenge
            • Team-based participation
            • Real-world problem statements
            • Mentorship from industry professionals
            • Prototype development and final presentation
            • Prizes and certificates for winners

            Participants are encouraged to bring their own laptops and necessary development tools. Teams should be prepared to explain their solution, implementation, and future scope during the final presentation.
            """,
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
            content: """
            Sarang Fest is the annual cultural celebration of the college, bringing together students from different departments to showcase their creativity, talent, and passion for performing arts.

            The evening will feature a variety of performances, competitions, and entertainment activities in a vibrant campus atmosphere.

            Event Highlights:
            • Live music performances
            • Solo and group dance performances
            • Drama and theatre acts
            • Cultural competitions
            • Student talent showcases
            • Special performances
            • Food and refreshment stalls

            Students are encouraged to participate in the competitions and support their friends during the performances. The event is open to all students and promises an evening filled with music, entertainment, and celebration.
            """,
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
            content: """
            The AI Workshop is a hands-on technical session designed to introduce students to the fundamentals of Artificial Intelligence and Machine Learning.

            Participants will learn how modern AI systems work and gain practical experience by building simple AI-powered applications. The workshop will also demonstrate how AI technologies can be integrated into mobile applications using Swift.

            Topics Covered:
            • Introduction to Artificial Intelligence
            • Machine Learning fundamentals
            • Understanding AI models
            • Working with datasets
            • Basic model training concepts
            • AI integration with Swift
            • Building an AI-powered application

            Participants should have basic programming knowledge. Laptops are recommended so that students can follow the practical exercises during the workshop.
            """,
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
            content: """
            Dance Battle is an exciting inter-college dance competition where talented dancers compete through solo and group performances.

            Participants will get the opportunity to showcase their creativity, choreography, stage presence, and individual dance styles in front of a live audience.

            Competition Highlights:
            • Solo and group categories
            • Multiple dance styles
            • Inter-college participation
            • Professional judging panel
            • Live audience
            • Certificates for participants
            • Exciting prizes for winners

            Participants should report to the registration desk before the event and complete the required registration formalities. Teams are responsible for preparing their own music tracks and choreography.
            """,
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
            content: """
            The Inter College Cricket Tournament brings together cricket teams from multiple colleges for a competitive tournament designed to promote sportsmanship, teamwork, and athletic excellence.

            Teams will compete through a series of matches leading to the final championship round.

            Tournament Highlights:
            • Participation from multiple colleges
            • Team-based competition
            • League and knockout matches
            • Experienced referees and officials
            • Player performance recognition
            • Championship trophy
            • Certificates and prizes for winners

            All participating teams must report to the sports ground before their scheduled match. Players should carry their college identification and required sports equipment.
            """,
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
            content: """
            The Football League is an inter-department tournament where college teams compete in a series of knockout matches to determine the campus champion.

            The tournament focuses on teamwork, strategy, discipline, and competitive spirit while giving students an opportunity to represent their departments.

            League Highlights:
            • Inter-department competition
            • Knockout-style matches
            • Team registration
            • Qualified referees
            • Live match scoring
            • Championship final
            • Trophy, certificates, and prizes

            Teams should arrive at the football field before their scheduled match for registration and team verification. Players are expected to follow the tournament rules and maintain proper sportsmanship throughout the competition.
            """,
            organizer: Organizer(
                name: "Football Club",
                img: "Football",
                mail: "football@college.edu",
                contact: "+91 9876543215"
            )
        )
    ),
    Event(
        img: "Robotics",
        title: "Robotics Expo",
        date: "Fri, 2 August",
        time: "10:00 AM",
        location: "Innovation Lab",
        category: .technical,
        details: EventDetails(
            content: """
            Robotics Expo is an exciting technical exhibition where students showcase innovative robots, automation projects, and smart technology solutions developed throughout the academic year.

            The event provides students with an opportunity to demonstrate their engineering skills, creativity, and understanding of robotics and automation.

            Expo Highlights:
            • Live robot demonstrations
            • Autonomous and manually controlled robots
            • Innovative engineering projects
            • Automation and IoT demonstrations
            • Student project presentations
            • Interactive technology exhibits
            • Certificates and recognition for outstanding projects

            Who Can Participate:
            • Open to students from technical departments
            • Individual and team projects are welcome
            • Participants should be able to explain their project and implementation

            Important Instructions:
            • Projects must be registered before the exhibition
            • Participants should report before their presentation slot
            • All electronic equipment must be handled safely
            • Students should carry their college identification

            Visitors can interact with participating teams and learn about the technologies used in each project.
            """,
            organizer: Organizer(
                name: "Robotics Club",
                img: "Robotics",
                mail: "robotics@college.edu",
                contact: "+91 9876543216"
            )
        )
    ),

    Event(
        img: "Basketball",
        title: "Inter College Basketball",
        date: "Sat, 3 August",
        time: "9:00 AM",
        location: "Basketball Court",
        category: .sports,
        details: EventDetails(
            content: """
            The Inter College Basketball Tournament brings together talented basketball teams from different colleges for a competitive series of matches.

            The tournament aims to encourage teamwork, discipline, fitness, and competitive spirit while providing players with an opportunity to represent their college.

            Tournament Highlights:
            • Inter-college basketball competition
            • League and knockout matches
            • Experienced referees
            • Live match scoring
            • Best player recognition
            • Championship trophy
            • Certificates and prizes for winners

            Team Requirements:
            • Teams must submit their final player list
            • Players must carry valid college identification
            • All players should wear appropriate sports uniforms
            • Only registered players can participate

            Important Instructions:
            • Teams should report at least 30 minutes before their match
            • Players must follow official tournament rules
            • Proper sports equipment is required
            • Respect referees, organizers, and opposing teams

            The tournament promises an exciting day of competitive basketball and will conclude with a championship final between the top-performing teams.
            """,
            organizer: Organizer(
                name: "Basketball Club",
                img: "Basketball",
                mail: "basketball@college.edu",
                contact: "+91 9876543217"
            )
        )
    ),

    Event(
        img: "Photography",
        title: "Campus Photography Contest",
        date: "Sun, 4 August",
        time: "2:00 PM",
        location: "Seminar Hall",
        category: .cultural,
        details: EventDetails(
            content: """
            The Campus Photography Contest invites students to capture the beauty, energy, and everyday moments of campus life through creative photography.

            Participants can explore different locations around the campus and use their photography skills to tell a story through images.

            Contest Highlights:
            • Open theme photography challenge
            • Campus and student-life photography
            • Creative composition and storytelling
            • Professional judging panel
            • Display of selected photographs
            • Certificates for participants
            • Prizes for the best photographs

            Categories:
            • Campus Architecture
            • Nature and Environment
            • Student Life
            • Events and Activities
            • Creative Photography

            Registration:
            • Students must register before the submission deadline
            • Participants can submit their original photographs
            • Basic editing is allowed according to contest guidelines

            Important Instructions:
            • Photographs must be captured by the participant
            • Previously submitted photographs are not allowed
            • Participants should respect privacy while taking photographs
            • Final photographs must be submitted in the required format

            The best photographs will be displayed during the college exhibition, giving participants an opportunity to showcase their creativity to the campus community.
            """,
            organizer: Organizer(
                name: "Photography Club",
                img: "Photography",
                mail: "photography@college.edu",
                contact: "+91 9876543218"
            )
        )
    )
]
