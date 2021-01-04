//
//  DetailView.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/04.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
                HStack {
                    Label("Length", systemImage: "clock")
                        .foregroundColor(.black)
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }

            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label("\(attendee)", systemImage: "person")
                        .foregroundColor(.black)
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text("\(attendee)"))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
