//
//  MultiSelectPickerView.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-05.
//

import SwiftUI

struct MultiSelectPickerView: View {
    @State var allTeamMembers: [String]
    @Binding var selectedMembers: [String]
    
    var body: some View {
        Form {
            List {
                ForEach(allTeamMembers, id: \.self) { member in
                Button {
                    withAnimation {
                        if self.selectedMembers.contains(member) {
                            self.selectedMembers.removeAll(where: { $0 == member })
                        } else {
                            self.selectedMembers.append(member)
                        }
                    }
                } label: {
                    HStack {
                        Text(member)
                        Spacer()
                        Image(systemName: "checkmark")
                            .opacity(self.selectedMembers.contains(member) ? 1.0 : 0.0)
                    }
                }

                }
            }
        }
    }
}

struct MultiSelectePickerView_PreviewContainer: View {
    @State private var members = ["Adomas"]
    
    var body: some View {
        MultiSelectPickerView(allTeamMembers:  ["Adomas", "Moze", "Ricka"], selectedMembers: $members)
    }
}

struct MultiSelectPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectePickerView_PreviewContainer()
    }
}
