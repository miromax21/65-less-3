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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
       
        
        
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.register(CollectionViewHeaderCell.self, forCellWithReuseIdentifier: CollectionViewHeaderCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.layoutIfNeeded()
      }
    
    
    func setUpLauout()   {
        self.collectionView = {
            let customFlowLayout = FlowLayout()
            customFlowLayout.sectionInsetReference = .fromContentInset // .fromContentInset is default
            customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            customFlowLayout.minimumInteritemSpacing = 10
            customFlowLayout.minimumLineSpacing = 10
            customFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            customFlowLayout.headerReferenceSize = CGSize(width: 0, height: 40)
            let cv = UICollectionView(frame: .zero, collectionViewLayout: customFlowLayout)
        
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
        return cell
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var yOffset: [CGFloat] = .init(repeating: 0, count: 2)
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


