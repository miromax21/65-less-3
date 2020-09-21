//
//  FlowLayout.swift
//  65-less-3
//
//  Created by maxim mironov on 07.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    var gridSize: Int = 1
    override init() {
        super.init()
    }
    convenience init(gridSize:Int = 1) {
        self.init()
        self.gridSize = gridSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributesObjects = super.layoutAttributesForElements(in: rect)?.map{ $0.copy() } as? [UICollectionViewLayoutAttributes]
        layoutAttributesObjects?.forEach({ layoutAttributes in
            if layoutAttributes.representedElementCategory == .cell {
                if let newFrame = layoutAttributesForItem(at: layoutAttributes.indexPath)?.frame {
                    layoutAttributes.frame = newFrame
                }
            }
        })
        
        
        return layoutAttributesObjects
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else {
            fatalError()
        }
        guard let layoutAttributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes else {
            return nil
        }

        layoutAttributes.frame.origin.x = sectionInset.left
        layoutAttributes.frame.size.width = collectionView.safeAreaLayoutGuide.layoutFrame.width / CGFloat(self.gridSize)  - sectionInset.left - sectionInset.right
        return layoutAttributes
    }
    
    

}
