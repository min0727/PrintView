//
//  ContentView.swift
//  PrintView
//
//  Created by 松崎勝治 on 2024/06/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("印刷する内容")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
