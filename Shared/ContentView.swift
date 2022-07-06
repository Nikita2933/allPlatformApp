//
//  ContentView.swift
//  Shared
//
//  Created by Никита Иванов on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(viewModel.helloNameMessage)
                }
                List {
                    NavigationLink(destination: {
                        PlayView(viewModel: viewModel)
                    }, label: {
                        Text("Play")
                    })
                    NavigationLink(destination: {
                        SettingsView(viewModel: viewModel)
                    }, label: {
                        Text("Settings")
                    })
                    NavigationLink(destination: {
                        LeaderBoard(viewModel: viewModel)
                    }, label: {
                        Text("Leaderboard")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
