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
    
    var longPressGesture : UILongPressGestureRecognizer!
    
    static var photos = [MyImage(image: UIImage(named: "1")!, tag1: "Vancouver", tag2: "Object1"), MyImage(image: UIImage(named: "2")!, tag1: "Vancouver", tag2: "Object2") ,MyImage(image: UIImage(named: "3")!, tag1: "Vancouver", tag2: "Object3"), MyImage(image: UIImage(named: "4")!, tag1: "Hongkong", tag2: "Object1"),MyImage(image: UIImage(named: "5")!, tag1: "Hongkong", tag2: "Object2"),MyImage(image: UIImage(named: "6")!, tag1: "Hongkong", tag2: "Object3   "),MyImage(image: UIImage(named: "7")!, tag1: "Others", tag2: "Object1"),MyImage(image: UIImage(named: "8")!, tag1: "Others", tag2: "Object2"),MyImage(image: UIImage(named: "9")!, tag1: "Others", tag2: "Object3"),MyImage(image: UIImage(named: "10")!, tag1: "Vancouver", tag2: "Object3")]
    static var photoCategories = ["Vancouver", "Hongkong", "Others"]
    static var vancouver = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"), UIImage(named: "10")]
    static var hongkong = [UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]
    static var others = [UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gestureRecognizer:)))
        self.collectionView?.addGestureRecognizer(longPressGesture)
        let width = (self.view.frame.size.width - 20) / 3  // getting the size of the screen width - the size of 2 cell spacings
        let layout =  collectionViewLayout as? UICollectionViewFlowLayout //geting the layout of the collective view item and casting a flow layout
        layout?.itemSize = CGSize(width: width, height: width) //setting up the size of the item
        layout?.sectionHeadersPinToVisibleBounds = true //setting up the section header pin to the top (or stick to the top) when scrolling
       
        let refresh = UIRefreshControl() //pull down to refresh to add items
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView?.refreshControl = refresh
        
        navigationItem.leftBarButtonItem = editButtonItem //editing button from IOS - decidce isediting and func setEditing
    }
    
    @objc func refresh() {
        if isEditing {
            addItem()
        }
        collectionView?.refreshControl?.endRefreshing()
    }
    
    func addItem() {
        //adding new item
        MyCollectiveViewController.photos.append(MyImage(image: UIImage(named: "10")!, tag1: "Vancouver", tag2: "Object3"))
        if MyCollectiveViewController.photoCategories[0] == "Vancouver" {
            MyCollectiveViewController.vancouver.append(UIImage(named: "10"))
            let index = IndexPath(item: MyCollectiveViewController.vancouver.count-1, section: 0)
            collectionView?.insertItems(at: [index])
        } else {
            MyCollectiveViewController.others.append(UIImage(named: "10"))
            let index = IndexPath(item: MyCollectiveViewController.others.count-1, section: 2)
            collectionView?.insertItems(at: [index])
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView?.allowsMultipleSelection = editing
        let indices = collectionView?.indexPathsForVisibleItems
        for index in indices! {
            let cell  = collectionView?.cellForItem(at: index) as! MyCollectionViewCell
            cell.isEditing = editing
            cell.check.image = UIImage(named: "Unchecked")!
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   @objc func handleLongGesture(gestureRecognizer: UIGestureRecognizer) {
        if isEditing {
            let longPress = gestureRecognizer as! UILongPressGestureRecognizer
            let state = longPress.state
            let locationInView = longPress.location(in: self.collectionView)
            let indexPath =  collectionView?.indexPathForItem(at: locationInView)
            
            struct My {
                static var cellSnapshot : UIView? = nil
                static var cellIsAnimating : Bool = false
                static var cellNeedToShow : Bool = false
            }
            struct Path {
                static var initialIndexPath : IndexPath? = nil
            }
            
            switch state {
            case UIGestureRecognizerState.began:
                if indexPath != nil {
                    Path.initialIndexPath = indexPath
                    let cell = collectionView?.cellForItem(at: indexPath!)
                    My.cellSnapshot  = snapshotOfCell(inputView: cell!)
                    
                    var center = cell?.center
                    My.cellSnapshot!.center = center!
                    My.cellSnapshot!.alpha = 0.0
                    collectionView?.addSubview(My.cellSnapshot!)
                    
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        center?.y = locationInView.y
                        My.cellIsAnimating = true
                        My.cellSnapshot!.center = center!
                        My.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                        My.cellSnapshot!.alpha = 0.98
                        cell?.alpha = 0.0
                    }, completion: { (finished) -> Void in
                        if finished {
                            My.cellIsAnimating = false
                            if My.cellNeedToShow {
                                My.cellNeedToShow = false
                                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                                    cell?.alpha = 1
                                })
                            } else {
                                cell?.isHidden = true
                            }
                        }
                    })
                }
                
            case UIGestureRecognizerState.changed:
                if My.cellSnapshot != nil {
                    var center = My.cellSnapshot!.center
                    center.y = locationInView.y
                    My.cellSnapshot!.center = center
                    
                    if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                        MyCollectiveViewController.vancouver.insert(MyCollectiveViewController.vancouver.remove(at: Path.initialIndexPath!.row), at: indexPath!.row)
                        collectionView?.moveItem(at: Path.initialIndexPath!, to: indexPath!)
                        Path.initialIndexPath = indexPath
                    }
                }
            default:
                if Path.initialIndexPath != nil {
                    let cell = collectionView?.cellForItem(at: Path.initialIndexPath!)
                    if My.cellIsAnimating {
                        My.cellNeedToShow = true
                    } else {
                        cell?.isHidden = false
                        cell?.alpha = 0.0
                    }
                    
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        My.cellSnapshot!.center = (cell?.center)!
                        My.cellSnapshot!.transform = CGAffineTransform.identity
                        My.cellSnapshot!.alpha = 0.0
                        cell?.alpha = 1.0
                        
                    }, completion: { (finished) -> Void in
                        if finished {
                            Path.initialIndexPath = nil
                            My.cellSnapshot!.removeFromSuperview()
                            My.cellSnapshot = nil
                        }
                    })
                }
            }
        }
    }
    
    func snapshotOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height:  0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return MyCollectiveViewController.photoCategories.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return MyCollectiveViewController.vancouver.count
        } else if section == 1  {
            return MyCollectiveViewController.hongkong.count
        } else {
            return  MyCollectiveViewController.others.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        let image = cell.imageView!
        cell.isUserInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture(sender:)))
        let doubletaps = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapped(sender:)))
        doubletaps.numberOfTapsRequired = 2
        cell.addGestureRecognizer(pinch)
        cell.addGestureRecognizer(doubletaps)
        if indexPath.section == 0 {
            image.image = MyCollectiveViewController.vancouver[indexPath.row]
            cell.isEditing = isEditing
            return cell
        } else if indexPath.section == 1  {
            image.image = MyCollectiveViewController.hongkong[indexPath.row]
            cell.isEditing = isEditing
            return cell
        } else {
            image.image = MyCollectiveViewController.others[indexPath.row]
            cell.isEditing = isEditing
            return cell
        }

    }

    @objc func pinchGesture(sender:  UIPinchGestureRecognizer)  {
        switch sender.state {
        case .began, .changed:
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        case .ended:
            sender.view?.transform = CGAffineTransform.identity
            sender.scale = 1.0
        default:
            break
        }
    }
    
    @objc func doubleTapped(sender:  UITapGestureRecognizer) {
        if isEditing {
            if let indexPath = collectionView?.indexPathForItem(at: sender.location(in: self.collectionView)){
                var removedImage: UIImage
                if indexPath.section == 0 {
                    removedImage = MyCollectiveViewController.vancouver.remove(at: indexPath.row)!
                } else if indexPath.section == 1  {
                    removedImage =  MyCollectiveViewController.hongkong.remove(at: indexPath.row)!
                } else {
                    removedImage =  MyCollectiveViewController.others.remove(at: indexPath.row)!
                }
                for image in MyCollectiveViewController.photos {
                    if image.image == removedImage {
                        if let index = MyCollectiveViewController.photos.index(of: image) {
                            MyCollectiveViewController.photos.remove(at: index)
                            break
                        }
                    }
                }
                self.collectionView?.deleteItems(at: [indexPath])
            }
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
        MyCollectiveViewController.vancouver.removeAll()
        MyCollectiveViewController.hongkong.removeAll()
        MyCollectiveViewController.others.removeAll()
        for image in MyCollectiveViewController.photos {
            if image.tag1 == "Vancouver" {
                MyCollectiveViewController.vancouver.append(image.image)
            } else if image.tag1 == "Hongkong" {
                MyCollectiveViewController.hongkong.append(image.image)
            } else {
                MyCollectiveViewController.others.append(image.image)
            }
        }
        self.collectionView?.reloadData()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
    }
    
    @IBAction func objectSort(_ sender: Any) {
        MyCollectiveViewController.photoCategories = ["Object1", "Object2", "Object3"]
        MyCollectiveViewController.vancouver.removeAll()
        MyCollectiveViewController.hongkong.removeAll()
        MyCollectiveViewController.others.removeAll()
        for image in MyCollectiveViewController.photos {
            if image.tag2 == "Object1" {
                MyCollectiveViewController.vancouver.append(image.image)
            } else if image.tag2 == "Object2" {
                MyCollectiveViewController.hongkong.append(image.image)
            } else {
                MyCollectiveViewController.others.append(image.image)
            }
        }
        self.collectionView?.reloadData()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
}
