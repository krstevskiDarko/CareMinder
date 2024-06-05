//
//  AudioRecorder.swift
//  CareMinder
//
//  Created by Darko Krstevski on 13.2.24.
//

import Foundation
import SwiftUI
import AVFoundation

struct AudioRecorderView: View {
    @State private var isRecording = false
    @State private var audioRecorder: AVAudioRecorder!

    var body: some View {
        VStack {
            if isRecording {
                Text("Recording...")
            } else {
                Button(action: startRecording) {
                    Text("Start Recording")
                }
            }
        }
        .onAppear(perform: requestPermission)
    }

    func requestPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {
                print("Microphone permission granted")
            } else {
                print("Microphone permission denied")
            }
        }
    }

    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            isRecording = true
        } catch {
            print("Error recording audio: \(error.localizedDescription)")
        }
    }

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
