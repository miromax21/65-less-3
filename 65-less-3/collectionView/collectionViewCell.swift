//
//  collectionViewCell.swift
//  65-less-3
//
//  Created by maxim mironov on 07.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewCell: UICollectionViewCell, MyCollectionViewCellWithImage {
    
    
    var view:UIView!

    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var bottomLable: UILabel!
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    func setup(title: String, text: String, image imageUrl: URL? = nil) {
        self.topLable.text = title
        self.bottomLable.text =  text
    }
    
    fileprivate func xibSetup()
    {
        view = loadViewFromNib()
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)])
        view.frame = self.bounds
 
    }
    
    fileprivate func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CollectionViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        layoutAttributes.frame.size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}

