//
//  PrintViewApp.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/16.
//

import SwiftUI

@main
struct PrintViewApp: App {
    @StateObject var userSettings = UserSettings()
    @State private var showSettings = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
                .frame(minWidth: 400, minHeight: 300)
        }
        .commands {
            CommandGroup(after: CommandGroupPlacement.appInfo) {
                Button("設定...") {
                    showSettings.toggle()
                }
                .keyboardShortcut(",", modifiers: .command)
                .sheet(isPresented: $showSettings) {
                    SettingsView(userSettings: userSettings)
                }
            }
            CommandGroup(replacing: .printItem) {
                Button("印刷...") {
                    printMainWindow()
                }
                .keyboardShortcut("p", modifiers: .command)
            }
        }
    }

    func printMainWindow() {
        guard let window = NSApplication.shared.windows.first else { return }
        let printOperation = NSPrintOperation(view: window.contentView!)
        printOperation.run()
    }
}
