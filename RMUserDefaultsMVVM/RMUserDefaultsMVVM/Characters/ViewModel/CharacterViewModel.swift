//
//  CharacterViewModel.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 26.01.2025.
//

import Foundation

final class CharacterViewModel {
    private var characters = [Character]()

    var charactersUpdated: (() -> Void)?

    func getCharacters() {
        if let savedCharacters = StorageManager.shared.loadCharacters() {
            characters = savedCharacters
            charactersUpdated?()
            return
        }

        NetworkManager.shared.getCharacters { [weak self] result in
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self?.characters = character
                    self?.charactersUpdated?()
                    StorageManager.shared.saveCharacters(character)
                }
            case .failure(let error):
                print("Failed to fetch drinks: \(error.localizedDescription)")
            }
        }
    }

    func numberOfCharacters() -> Int {
        return characters.count
    }

    func character(at index: Int) -> Character {
        return characters[index]
    }
}
