//
//  StorageManagerProtocol.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 29.01.2025.
//

import Foundation

protocol StorageManagerProtocol {
    func saveCharacters(_ characters: [Character])

    func loadCharacters() -> [Character]?

    func clearCharacters()

    func saveImage(_ image: Data, key: String)

    func loadImage(key: String) -> Data?

    func clearImage(key: String)
}
