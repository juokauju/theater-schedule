//
//  PerformanceFormViem.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-29.
//

import SwiftUI

struct PerformanceFormView: View {
    @EnvironmentObject var viewModel: ViewModel
    @ObservedObject var formViewModel: FormViewModel
    
    @State private var showSaveAlert: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("General info") {
                    
            //MARK: TextField
                    TextField("Title", text: $formViewModel.name)

            //MARK: DatePicker
                    DatePicker("Select date", selection: $formViewModel.date, displayedComponents: [.date])

                    NavigationLink {
                        VStack {
                            Spacer()
                                .frame(height: 80)
                            MultiDatePicker(anyDays: $formViewModel.selectedDays, minDate: Date().dayBefore)
                                .navigationTitle("Select dates")
                            Spacer()
                        }
                        .padding()
                    } label: {
                        Text("Select dates")
                    }
                }
                
            //MARK: Selecting Place
                Section("Hall") {
                    Picker("Hall", selection: $formViewModel.selectedPlace) {
                        ForEach(formViewModel.place.allCases) { place in
                            Text(place.rawValue.uppercased()).tag(place)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            //MARK: MultiSelectPickerView with Employees names
                Section("Employees") {
                    NavigationLink {
                        MultiSelectPickerView(formViewModel: formViewModel)
                            .navigationTitle("Choose team members")
                    } label: {
                        HStack(alignment: .top) {
                            Text("Video team:")
                            Spacer()
                            Text(formViewModel.selectedMembers.joined(separator: "\n"))
                        }
                    }
                }
                
            //MARK: Save button
                Section {
                    Button {
                        formViewModel.saveTapped()
                        showSaveAlert = true
                    } label: {
                        Text("Save")
                    }
                }
            }
            
            .navigationTitle(Text("Add"))
            
            //MARK: Alert
            // Would be better if it could check if save method was commited
            .alert("Done", isPresented: $showSaveAlert) {
                Button(role: .cancel) {
                } label: {
                Text("OK")
            }
            }
        }
    }
}


struct PerformanceFormView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FormViewModel()
        PerformanceFormView(formViewModel: viewModel)
    }
}

