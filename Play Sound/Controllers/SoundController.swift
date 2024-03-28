//
//  SoundController.swift
//  Play Sound
//
//  Created by Marco Fura on 28/03/24.
//

import Foundation
import AVFoundation

class SoundController {
    var audioPlayer: AVAudioPlayer?

        init?(soundURL: URL) {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                return nil
            }
        }

        func play() {
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.play()
        }
}
