//
//  CharacterTableViewDataSource.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 28.01.2025.
//

import Foundation
import UIKit
//
//final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
//    private let viewModel = CharacterViewModel()
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.numberOfCharacters()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: CharacterTableViewCell.id,
//            for: indexPath) as? CharacterTableViewCell else {
//            return UITableViewCell()
//        }
//
//        let character = viewModel.character(at: indexPath.row)
//        let imageURL = character.image
//
//        NetworkManager.shared.loadImage(from: imageURL) { loadedImage in
//            DispatchQueue.main.async {
//                guard let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell  else {
//                    return
//                }
//                cell.configure(with: character, image: loadedImage)
//            }
//        }
//
//        return cell
//    }
//}
