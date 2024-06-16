//
//  ContentView.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/16.
//

import SwiftUI
import AppKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button(action: {
                printView()
            }) {
                Text("Print")
            }
        }
    }
}

func makeNSView<Content: View>(view: Content, frame: NSRect) -> NSView {
    let hostingView = NSHostingView(rootView: view)
    hostingView.frame = frame
    return hostingView
}

func printView() {
    let printInfo = NSPrintInfo.shared
    printInfo.horizontalPagination = .automatic
    printInfo.verticalPagination = .automatic
    printInfo.topMargin = 10.0
    printInfo.leftMargin = 10.0
    printInfo.rightMargin = 10.0
    printInfo.bottomMargin = 10.0

    let contentView = ContentView()
    let printView = makeNSView(view: contentView, frame: NSRect(x: 0, y: 0, width: 612, height: 792)) // A4サイズのページ

    let printOperation = NSPrintOperation(view: printView, printInfo: printInfo)
    printOperation.printPanel.options = [.showsCopies, .showsPageSetupAccessory]
    printOperation.run()
}
