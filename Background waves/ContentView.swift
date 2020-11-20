//
//  ContentView.swift
//  Background waves
//
//  Created by Cloutier, Vincent on 2020-11-19.
//

import SwiftUI

struct ContentView: View {
    //initializes screen size
    let universalSize = UIScreen.main.bounds
    //boolean to change if its animated
    @State var isAnimated = false

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
