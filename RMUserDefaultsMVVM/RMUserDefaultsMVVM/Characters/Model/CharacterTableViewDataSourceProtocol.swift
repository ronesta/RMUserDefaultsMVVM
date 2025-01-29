//
//  CharacterTableViewDataSourceProtocol.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 29.01.2025.
//

import Foundation
import UIKit

protocol CharacterDataSourceProtocol: UITableViewDataSource {
    var viewModel: CharacterViewModelProtocol? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
}
