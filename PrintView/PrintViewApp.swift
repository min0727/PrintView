//
//  PrintViewApp.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/16.
//

import SwiftUI

@main
struct PrintViewApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .printItem) {
                Button("印刷...") {
                    NotificationCenter.default.post(name: .init("PrintNotification"), object: nil)
                }
                .keyboardShortcut("p", modifiers: .command)
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, NSMenuItemValidation {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NotificationCenter.default.addObserver(self, selector: #selector(printWindow), name: .init("PrintNotification"), object: nil)
    }
    
    @objc func printWindow() {
        if let window = NSApp.keyWindow {
            let printOperation = NSPrintOperation(view: window.contentView!)
            printOperation.run()
        }
    }
    
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        return true
    }
}
