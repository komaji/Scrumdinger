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

    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                #endif
                return
            }

            guard let dailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }

            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
}
