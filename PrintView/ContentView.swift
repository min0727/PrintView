//
//  ContentView.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        Text("メインウインドウのコンテンツ")
            .padding()
    }
}
