//
//  Observable.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 28.01.2025.
//

import Foundation

final class Observable<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
        listener(value)
    }
}
