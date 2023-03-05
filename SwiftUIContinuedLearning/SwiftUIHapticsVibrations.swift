//
//  SwiftUIHapticsVibrations.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 05/03/2023.
//

import SwiftUI

class HapticManager {
    static var instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct SwiftUIHapticsVibrations: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("error") {HapticManager.instance.notification(type: .error)}
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            
            Divider()
            
            Button("soft") {HapticManager.instance.impact(style: .soft)}
            Button("light") {HapticManager.instance.impact(style: .light)}
            Button("medium") {HapticManager.instance.impact(style: .medium)}
            Button("rigid") {HapticManager.instance.impact(style: .rigid)}
            Button("heavy") {HapticManager.instance.impact(style: .heavy)}
        }
    }
}

struct SwiftUIHapticsVibrations_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIHapticsVibrations()
    }
}
