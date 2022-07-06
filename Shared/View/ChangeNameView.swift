//
//  ChangeNameView.swift
//  AllPlatformTask
//
//  Created by Никита Иванов on 05.07.2022.
//

import SwiftUI

struct ChangeNameView: View {
    @StateObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var newName: String = ""
    
    var body: some View {
        VStack {
            TextField("Change your name", text: $newName)
            Spacer()
            Button {
                viewModel.person.name = newName
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
            .disabled(newName.isEmpty)
        }
    }
}

struct ChangeNameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNameView(viewModel: ViewModel())
    }
}
