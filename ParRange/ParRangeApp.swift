//
//  ParRangeApp.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import SwiftUI
import NetFox

@main
struct ParRangeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            Group {
                NavigationView {
                    ViewProvider.partyList()
                }
            }.background(Color.backgroundColor.ignoresSafeArea())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif

        return true
    }
}
