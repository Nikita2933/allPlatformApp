//
//  SettingsView.swift
//  AllPlatformTV
//
//  Created by Никита Иванов on 04.07.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: ViewModel
    @State var hasOpenChangeName: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(viewModel.person.name)
                    Text(viewModel.person.age?.description ?? "")
                }
            }
            Divider()
            VStack {
                Group {
                    Button {
                        hasOpenChangeName.toggle()
                    } label: {
                        Text("Change name")
                    }
                    Button {
                        viewModel.removeLeaderBoard()
                    } label: {
                        Text("Remove leaderboard")
                    }
                }
            }
            .sheet(isPresented: $hasOpenChangeName) {
                ChangeNameView(viewModel: viewModel)
            }
        }

    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: ViewModel())
    }
}
