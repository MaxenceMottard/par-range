//
//  ParRangeApp.swift
//  ParRange
//
//  Created by Maxence Mottard on 24/04/2021.
//

import SwiftUI

@main
struct ParRangeApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                PartyListView()
            }.background(Color.backgroundColor.ignoresSafeArea())
        }
    }
}
