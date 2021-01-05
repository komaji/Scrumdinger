//
//  AVPlayer+Scrumdinger.swift
//  Scrumdinger
//
//  Created by kojima.t on 2021/01/05.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
