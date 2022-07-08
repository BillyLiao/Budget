//
//  ContentView.swift
//  Shared
//
//  Created by 廖慶麟 on 2022/7/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView2: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView2()
    }
}
