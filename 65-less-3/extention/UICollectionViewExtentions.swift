//
//  UICollectionViewExtentions.swift
//  65-less-3
//
//  Created by maxim mironov on 14.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionView {
    var widestCellWidth: CGFloat {
        let insets = contentInset.left + contentInset.right
        return bounds.width - insets
    }
}
