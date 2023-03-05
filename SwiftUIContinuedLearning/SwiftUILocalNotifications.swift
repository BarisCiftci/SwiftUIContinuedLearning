//
//  SwiftUILocalNotifications.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 05/03/2023.
//

import SwiftUI
import UserNotifications
class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAutorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This is not dificult to implement"
        content.sound = .default
        content.badge = 1
        
        //TIME
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //CALENDAR
        
        //LOCATION
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct SwiftUILocalNotifications: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAutorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct SwiftUILocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILocalNotifications()
    }
}
