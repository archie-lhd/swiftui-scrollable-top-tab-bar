//
//  ContentView.swift
//  Scrollable Top Tab Bar
//
//  Created by Archie Liu on 2021-05-16.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack {
            TabBarView(index: $index)
            TabView(selection: $index) {
                ForEach (0..<5) { pageId in
                    Text("Page \(pageId)").tag(pageId)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
