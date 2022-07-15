//
//  RetryButton.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-12.
//

import SwiftUI

//struct RetryButton: View {
//    var title: LocalizedStringKey = "Retry"
//
//    @Environment(\.refresh) private var action
//    @StateObject private var actionPerformer = RefreshActionPerformer()
//
//    var body: some View {
//        if let action = action {
//            Button(action: {
////                 actionPerformer.perform(action)
//            }, label: {
//                ZStack {
//                    if actionPerformer.isPerforming {
//                        Text(title).hidden()
//                        ProgressView()
//                    } else {
//                        Text(title)
//                    }
//                }
//            })
//            .disabled(actionPerformer.isPerforming)
//        }
//    }
//}
