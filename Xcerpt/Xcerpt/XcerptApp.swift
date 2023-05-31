//
//  XcerptApp.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import SwiftUI

@main
struct XcerptApp: App {
    @StateObject var bookStore = BookStore()
    var body: some Scene {
        WindowGroup {
            ContentView(bookStore: bookStore)
        }
    }
}
