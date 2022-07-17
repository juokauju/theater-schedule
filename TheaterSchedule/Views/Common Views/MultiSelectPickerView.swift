//
//  MultiSelectPickerView.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-05.
//

import SwiftUI

struct MultiSelectPickerView: View {
//    @State var allTeamMembers: [String]
//    @Binding var selectedMembers: [String]
    
    @ObservedObject var formViewModel: FormViewModel
    
    var body: some View {
        Form {
            List {
                ForEach(formViewModel.allTeamMembers, id: \.self) { member in
                Button {
                    withAnimation {
                        // Checks if pressed button title contains selectedMember array. If yes, than it removes it from array, if not, then adds.
                        if formViewModel.selectedMembers.contains(member) {
                            formViewModel.selectedMembers.removeAll(where: { $0 == member })
                        } else {
                            formViewModel.selectedMembers.append(member)
                            print(formViewModel.selectedMembers)
                        }
                    }
                } label: {
                    HStack {
                        Text(member)
                        Spacer()
                        // Depending if array of selectedMembers contains pressed button title, checkmark appears or disappears.
                        Image(systemName: "checkmark")
                            .opacity(formViewModel.selectedMembers.contains(member) ? 1.0 : 0.0)
                    }
                }

                }
            }
        }
    }
}

struct MultiSelectPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FormViewModel()
        viewModel.selectedMembers.append(viewModel.allTeamMembers.first ?? "Test value")
        return MultiSelectPickerView(formViewModel: viewModel)
    }
}
