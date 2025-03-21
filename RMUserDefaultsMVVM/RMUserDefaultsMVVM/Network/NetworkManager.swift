//
//  NetworkManager.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 24.01.2025.
//

import Foundation
import UIKit

final class NetworkManager: NetworkManagerProtocol {
    var dataCounter = 1
    var imageCounter = 1

    private let storageManager: StorageManagerProtocol?
    private let urlString = "https://rickandmortyapi.com/api/character"

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data else {
                print("No data")
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.noData))
                }
                return
            }

            do {
                let character = try JSONDecoder().decode(PostCharacters.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(character.results))
                    print("Load data \(self.dataCounter)")
                    self.dataCounter += 1
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {

        if let imageData = storageManager?.loadImage(key: urlString),
           let image = UIImage(data: imageData) {
            completion(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            if let data,
               let image = UIImage(data: data) {
                self.storageManager?.saveImage(data, key: urlString)
                DispatchQueue.main.async {
                    completion(image)
                    print("Load image \(self.imageCounter)")
                    self.imageCounter += 1
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
