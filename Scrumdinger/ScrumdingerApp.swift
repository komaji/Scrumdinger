//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/04.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @ObservedObject private var data = ScrumData()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}
