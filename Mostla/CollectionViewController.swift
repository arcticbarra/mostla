//
//  CollectionViewController.swift
//  Mostla
//
//  Created by Enrique Barragán on 10/17/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var technologies : [Technology]!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      technologies = []
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Virtual Reality", info: "Bla bla", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return technologies.count
    }
  
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      let padding: CGFloat =  0
      let collectionViewSize = collectionView.frame.size.width - padding
      return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
      cell.name.text = technologies[indexPath.row].name
      cell.image.image = technologies[indexPath.row].image
      cell.image.frame.size.width = collectionView.frame.size.width / 2
      return cell
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
