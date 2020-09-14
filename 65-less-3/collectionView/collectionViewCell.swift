//
//  collectionViewCell.swift
//  65-less-3
//
//  Created by maxim mironov on 07.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewCell: UICollectionViewCell{
    var view:UIView!
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var bottomLable: UILabel!
    var text = [
        "weoqienqwjkenqiwebqwebqjweklqwebqwjebqjkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb",
        "weoqienqwjkenqiwebq webqjw eklqwebqwjebq jkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb weoqienqwjkenqiwebqwebqjweklqwebqwj ebqjkwebqjwebqkwebqkjwebqjkwe lqlwebqjlwebqj lwebqwejqwejqweb",
        "weoqienqwjkenqiwebq webqjw eklqwebqwjebq jkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb weoqienqwjkenqiwebqwebqjweklqwebqwj ebqjkwebqjwebqkwebqkjwebqjkwe lqlwebqjlwebqj lwebqwejqwejqweb weoqienqwjkenqiwebq webqjw eklqwebqwjebq jkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb weoqienqwjkenqiwebqwebqjweklqwebqwj ebqjkwebqjwebqkwebqkjwebqjkwe lqlwebqjlwebqj lwebqwejqwejqweb"
        
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }


    func xibSetup()
    {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizesSubviews = true
        addSubview(view)
    }


    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "collectionViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

        return view
    }
    func setup(index: Int){
        let item = index % 3 > 3 ? 0 : (index % 3) ?? 0
           self.topLable.text = text[item]
           self.bottomLable.text = "adlasndjaksbds;as;idbai;sdbai;sdba;sdba;sdas;dbausdbau;sda;usdba;usdas;dbasdbaus"
       }
}

