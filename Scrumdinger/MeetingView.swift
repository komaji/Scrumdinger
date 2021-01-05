//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/04.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)

            VStack {
                MeetingHeaderView(secondsElapsed: .constant(60), secondsRemaining: .constant(180))
                Circle()
                    .strokeBorder(lineWidth: 24.0, antialiased: true)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MeetingView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
