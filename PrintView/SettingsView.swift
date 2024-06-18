//
//  SettingsView.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/18.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var userSettings: UserSettings

    var body: some View {
        Form {
            TextField("テキスト1", text: $userSettings.text1)
                .padding()
        }
        .frame(width: 300, height: 100)
        .padding()
    }
}
