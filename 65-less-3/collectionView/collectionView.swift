//
//  tableView.swift
//  65-less-3
//
//  Created by maxim mironov on 27.08.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
class collectionViewController:UIViewController {

    var sectionHeaderhight : CGFloat = 0.0
    var collectionView :UICollectionView!
    var items = MocData.init().items
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func endAppearanceTransition() {
        setUpLauout()
    }
    override func viewDidLayoutSubviews() {
         setUpLauout()
    }

    func setupTableView() {
        setUpLauout()
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.register(CollectionViewHeaderCell.self, forCellWithReuseIdentifier: CollectionViewHeaderCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.layoutIfNeeded()
      }
    
    
    func setUpLauout()   {
        self.collectionView = {
            let layout = FlowLayout()
            layout.estimatedItemSize = CGSize(
                width: view.frame.width,
                height: 200
            )
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
            return cv
        }()
    }
}
extension collectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = items[indexPath.row]
        if item.type == MocDataItemType.header{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewHeaderCell.identifier, for: indexPath) as! CollectionViewHeaderCell
            cell.headerLabel.text = item.title
            cell.view.backgroundColor = .blue
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.setup(title: item.title, text: item.text)
       // cell.frame.size.width = self.view.frame.width
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
//        cell.topLable.text = "header"
//        cell.view.backgroundColor = .blue
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
}


