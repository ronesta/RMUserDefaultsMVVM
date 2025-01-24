//
//  StorageManager.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 24.01.2025.
//

import Foundation
import UIKit

final class StorageManager {
    static let shared = StorageManager()
    private let charactersKey = "charactersKey"

    private init() {}

    func saveCharacters(_ characters: [Character]) {
        do {
            let data = try JSONEncoder().encode(characters)
            UserDefaults.standard.set(data, forKey: charactersKey)
        } catch {
            print("Failed to encode characters: \(error)")
        }
    }

    func saveImage(_ image: Data, key: String) {
        UserDefaults.standard.set(image, forKey: key)
    }

    func loadCharacters() -> [Character]? {
        if let data = UserDefaults.standard.data(forKey: charactersKey) {
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                return characters
            } catch {
                print("Failed to encode: \(error)")
                return nil
            }
        } else {
            return nil
        }
    }

    func loadImage(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }

    func clearCharacters() {
        UserDefaults.standard.removeObject(forKey: charactersKey)
    }

    func clearImage(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
