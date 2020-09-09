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
        self.minimumInteritemSpacing = 1
        self.minimumLineSpacing = 1
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare() {
        super.prepare()
        // Make sure the collection view is valid
        guard let collectionView = collectionView else { return }
        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(gridSize - 1)
 
        collectionView.setNeedsLayout()
        collectionView.layoutIfNeeded()
        let cellSize = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(gridSize)).rounded(.down)
        itemSize = CGSize(width: cellSize, height: cellSize)

        
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
    
}
