//
//  LeaderBoard.swift
//  AllPlatformTask
//
//  Created by Никита Иванов on 04.07.2022.
//

import SwiftUI

struct LeaderBoard: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
        ScrollView {
            ForEach(viewModel.getScoreboard(), id: \.self) { element in
                HStack {
                    Text(element.name)
                    Spacer()
                    Text(element.score.description)
                }
                .padding(.horizontal, 16)
                Divider()
            }
        }
    }
}

struct LeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoard(viewModel: ViewModel())
    }
}
