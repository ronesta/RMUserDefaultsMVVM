//
//  StatusLabel.swift
//  RMUserDefaultsMVVM
//
//  Created by Ибрагим Габибли on 24.01.2025.
//

import Foundation
import UIKit

final class StatusLabel: UILabel {
    var textInsets = UIEdgeInsets(top: 5, left: 9, bottom: 5, right: 9)

    override func drawText(in rect: CGRect) {
        let paddedRect = rect.inset(by: textInsets)
        super.drawText(in: paddedRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right,
                       height: size.height + textInsets.top + textInsets.bottom)
    }
}
