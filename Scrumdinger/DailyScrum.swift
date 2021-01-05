//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/04.
//

import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    init(title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.init(
            id: UUID(),
            title: title,
            attendees: attendees,
            lengthInMinutes: lengthInMinutes,
            color: color
        )
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(
                title: "Design",
                attendees: [
                    "Cathy",
                    "Daisy",
                    "Simon",
                    "Jonathan"
                ],
                lengthInMinutes: 10,
                color: Color("Design")
            ),
            DailyScrum(
                title: "App Dev",
                attendees: [
                    "Katie",
                    "Gray",
                    "Euna",
                    "Luis",
                    "Darla"
                ],
                lengthInMinutes: 5,
                color: Color("App Dev")
            ),
            DailyScrum(
                title: "Web Dev",
                attendees: [
                    "Chella",
                    "Chris",
                    "Christina",
                    "Eden",
                    "Karla",
                    "Lindsey",
                    "Aga",
                    "Chad",
                    "Jenn",
                    "Sarah"
                ],
                lengthInMinutes: 1,
                color: Color("Web Dev")
            )
        ]

    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }

    var data: Data {
        return .init(
            title: title,
            attendees: attendees,
            lengthInMinutes: Double(lengthInMinutes),
            color: color
        )
    }
}
