//
//  MyCollectiveViewControllerCollectionViewController.swift
//  Assignment7
//
//  Created by dexunzhu on 2018-05-30.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoView"

class MyCollectiveViewController: UICollectionViewController {
    
    static var photos = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10")]
    static var photoCategories = ["Vancouver", "Hongkong", "Others"]
    static var vancouver = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    static var hongkong = [UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]
    static var others = [UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9")]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return MyCollectiveViewController.photoCategories.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        let image = cell.imageView!
        cell.isUserInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture(sender:)))
        cell.addGestureRecognizer(pinch)
        
        if indexPath.section == 0 {
            image.image = MyCollectiveViewController.vancouver[indexPath.row]
            return cell
        } else if indexPath.section == 1  {
            image.image = MyCollectiveViewController.hongkong[indexPath.row]
            return cell
        } else {
            image.image = MyCollectiveViewController.others[indexPath.row]
            return cell
        }

    }

    @objc func pinchGesture(sender:  UIPinchGestureRecognizer)  {
        switch sender.state {
        case .began, .changed:
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        case .ended:
            sender.view?.transform = CGAffineTransform.identity
        default:
            break
        }
        
        
    }
  
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        let category = MyCollectiveViewController.photoCategories[indexPath.section]
        sectionHeaderView.catergoryTitle = category
        return sectionHeaderView
    }
    
    @IBAction func locationSort(_ sender: Any) {
        MyCollectiveViewController.photoCategories = ["Vancouver", "Hongkong", "Others"]
        MyCollectiveViewController.vancouver = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
        MyCollectiveViewController.hongkong = [UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]
        MyCollectiveViewController.others = [UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9")]
        self.collectionView?.reloadData()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
    }
    
    @IBAction func objectSort(_ sender: Any) {
        MyCollectiveViewController.photoCategories = ["Object1", "Object2", "Object3"]
        MyCollectiveViewController.vancouver = [UIImage(named: "1"),UIImage(named: "4"),UIImage(named: "7")]
        MyCollectiveViewController.hongkong = [UIImage(named: "2"),UIImage(named: "5"),UIImage(named: "8")]
        MyCollectiveViewController.others = [UIImage(named: "3"),UIImage(named: "6"),UIImage(named: "9")]
        self.collectionView?.reloadData()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
}
