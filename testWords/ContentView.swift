//
//  ContentView.swift
//  testWords
//
//  Created by Arash Kashi on 2019-11-09.
//  Copyright © 2019 Arash Kashi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var words: [String] = ["Welcome", "to", "the", "show"]//    ["a","b","c","d","e","f","g","h",]//["Welcome", "to", "the", "show"]
    @State var currentIndex: Int = 0
    @State var state: Int = 0
    @State var timeToReadACharMiliSecond: Int = 120
    
    func tt() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(timeToReadACharMiliSecond * self.words[currentIndex].count)) {
            self.state = (self.state + 1) % 3
            if self.state == 2 {
                self.currentIndex = (self.currentIndex + 1) % (self.words.count)
            }
            self.tt()
        }
    }
    var body: some View {
    
        Text(words[currentIndex]).opacity(state == 1 || state == 2 ? 0.0 : 1.0).font(.system(size: 500)).lineLimit(nil)
            .minimumScaleFactor(0.1).animation(state != 2 ? .easeIn(duration: Double(timeToReadACharMiliSecond * self.words[currentIndex].count)/1000.0) : nil)
            .onAppear {
                self.tt()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
