//
//  ErrorHandler.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-06-26.
//

import SwiftUI

class ErrorHandler {
    
    static let shared = ErrorHandler()
    
    func consoleLogError(_ error: NSError) {
        print("Unresolved error \(error), \(error.userInfo)")
    }
    
    func alertErrorMessage(_ error: NSError) {
        // implement alert
        print("Unsolved error \(error)")
    }
    
}

struct ErrorView: View {
    @Binding var error: Error?

    var body: some View {
        if let error = error {
            VStack {
                Text(error.localizedDescription)
                    .bold()
                HStack {
                    Button("Dismiss") {
                        self.error = nil
                    }
//                    RetryButton()
                }
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
