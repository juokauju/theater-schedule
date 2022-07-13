//
//  PerformanceFormViem.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-29.
//

import SwiftUI

struct PerformanceFormView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var showSaveAlert: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("General info") {
                    TextField("Title", text: $viewModel.formViewModel.name)

                    DatePicker("Select date", selection: $viewModel.formViewModel.date, displayedComponents: [.date])
                }
                
                Section("Hall") {
                    Picker("Hall", selection: $viewModel.formViewModel.selectedPlace) {
                        ForEach(viewModel.formViewModel.place.allCases) { place in
                            Text(place.rawValue.uppercased()).tag(place)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section("Employees") {
                    NavigationLink {
                        MultiSelectPickerView(allTeamMembers: viewModel.formViewModel.allTeamMembers, selectedMembers: $viewModel.formViewModel.selectedMembers)
                            .navigationTitle("Choose team members")
                    } label: {
                        HStack(alignment: .top) {
                            Text("Video team:")
                            Spacer()
                            Text(viewModel.formViewModel.selectedMembers.joined(separator: "\n"))
                        }
                    }
                }
                
                Section {
                    Button {
                        viewModel.save()
                        showSaveAlert = true
                    } label: {
                        Text("Save")
                    }
                }
            }
            
            .navigationTitle(Text("Add"))
            .alert("Saved!", isPresented: $showSaveAlert) {
                Button(role: .cancel) {
                    viewModel.formViewModel.clearFields()
                } label: {
                    Text("OK")
                }
            }
        }
    }
}


struct PerformanceFormView_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceFormView()
    }
}
