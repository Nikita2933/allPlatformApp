//
//  PlayView.swift
//  AllPlatformTV
//
//  Created by Никита Иванов on 04.07.2022.
//

import SwiftUI
import Combine

struct PlayView: View {
    @StateObject var viewModel: ViewModel
    
    @State private var timerCancellable: Cancellable?
    @State var timer = Timer.publish(every: 0.3, on: .main, in: .common)
    @State var playRandomInt = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text(String(playRandomInt))
                .font(.system(size: 40))
                .onReceive(timer) { _ in
                    playRandomInt = Int.random(in: 1...1000000)
                }
            Group {
                Button {
                    if timerCancellable == nil {
                        self.timer = Timer.publish(every: 0.3, on: .main, in: .common)
                        self.timerCancellable = self.timer.connect()
                    } else {
                        timerCancellable?.cancel()
                        timerCancellable = nil
                    }
                } label: {
                    Text(timerCancellable == nil ? "Start" : "Stop")
                        .padding()
                        
                }
                Button {
                    viewModel.addToLeaderBoard(playRandomInt)
                } label: {
                    Text("Add to LeaderBoard")
                }
                .disabled(timerCancellable != nil || playRandomInt == 0)
            }
        }
    }
}
