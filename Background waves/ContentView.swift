//
//  ContentView.swift
//  Background waves
//
//  Created by Cloutier, Vincent on 2020-11-19.
//https://www.youtube.com/watch?v=iBgQRpIzY9g

import SwiftUI

struct ContentView: View {
    //initializes screen size
    let universalSize = UIScreen.main.bounds
    //boolean to change if its animated
    @State var isAnimated = false

    var body: some View {
        ZStack {
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: isAnimated ? -1*universalSize.width : 0)
            .animation(
                Animation.linear(duration: 2)
                .repeatForever(autoreverses: false)
            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 5)
                .repeatForever(autoreverses: false)
            )
            getSinWave(interval: universalSize.width*1.7, amplitude: 180, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.3, green: 0.9, blue: 1).opacity(0.4))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 1.9)
                .repeatForever(autoreverses: false)
            )
        }.onAppear(){
            self.isAnimated = true
        }
    }
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 , baseline : CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            //give the actual curve in the wave
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            //give the actual curve in the wave

            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
        }
    
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
