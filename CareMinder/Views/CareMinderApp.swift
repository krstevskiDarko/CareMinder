//
//  StepByStepApp.swift
//  CareMinder
//
//  Created by Darko Krstevski on 10.02.2023.
//

import SwiftUI
import UserNotifications
import AVFoundation
/**
 The main entry point of the StepByStep application.
 */

@main
struct CareMinderApp: App {
    @State var currentView: AnyView = AnyView(AppLogoView())
    @State private var isNotificationPermissionRequested = false
    @State private var isMicrophonePermissionRequested = false
    
    var body: some Scene {
        WindowGroup {
            contentView
        }
    }
    
    private var contentView: some View {
        VStack {
            currentView
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.currentView = AnyView(GetStartedView().onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.currentView = AnyView(BeforeSettingBigGoalsView())
                            }
                        }
                    })
                }
            }
            
            // Request permissions after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isNotificationPermissionRequested = true
                isMicrophonePermissionRequested = true
            }
        }
        .alert(isPresented: $isNotificationPermissionRequested) {
            Alert(
                title: Text("Enable Notifications"),
                message: Text("Would you like to enable notifications for habit reminders?"),
                primaryButton: .default(Text("Yes")) {
                    requestNotificationPermission()
                },
                secondaryButton: .cancel()
            )
        }
        .alert(isPresented: $isMicrophonePermissionRequested) {
            Alert(
                title: Text("Microphone Access"),
                message: Text("Would you like to enable microphone access for recording audio?"),
                primaryButton: .default(Text("Yes")) {
                    requestMicrophonePermission()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    // Request microphone permission
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {
                print("Microphone permission granted")
                // Microphone permission granted, you can proceed with recording
            } else {
                print("Microphone permission denied")
                // Microphone permission denied, handle this case accordingly
            }
        }
    }
    
    // Request notification permission
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }
}
