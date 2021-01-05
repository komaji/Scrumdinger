//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/05.
//

import Foundation

class ScrumData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        documentsFolder.appendingPathComponent("scrums.data")
    }

    @Published var scrums: [DailyScrum] = []
}
