//
//  CounterModel.swift
//  CloudCounter
//
//  Created by Surasak Phetmanee on 17/02/2026.
//

import Foundation
import Combine

final class CounterModel: ObservableObject {

    @Published private(set) var value: Int = 0

    func increment() {
        value += 1
    }

    func decrement() {
        value -= 1
    }

    func reset() {
        value = 0
    }

    func isEven() -> Bool {
        return value % 2 == 0
    }
}
