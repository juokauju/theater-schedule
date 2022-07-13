//
//  RefreshActionPerformer.swift
//  TheaterSchedule
//
//  Created by jimi bird on 2022-07-12.
//

import SwiftUI

class RefreshActionPerformer: ObservableObject {
    @Published private(set) var isPerforming = false

    func perform(_ action: RefreshAction) async {
        guard !isPerforming else { return }
        isPerforming = true
        await action()
        isPerforming = false
    }
}
