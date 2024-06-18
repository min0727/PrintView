//
//  UserSettings.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/18.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var text1: String {
        didSet {
            UserDefaults.standard.set(text1, forKey: "text1")
        }
    }

    init() {
        self.text1 = UserDefaults.standard.string(forKey: "text1") ?? ""
    }
}
