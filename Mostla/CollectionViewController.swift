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
    
    var VR : String = "Virtual Reality (VR) and Augmented Reality (AR) \n\n\tVirtual reality aims to achieve total immersion, sensory experience so real that we forget it is a virtual-artificial environment and begin to interact with it as we would naturally do.\n\n\tAugmented reality is the ability to integrate digital data into a real-time experience. Unlike virtual reality there are no bulky video headsets to contend with. Augmented reality has advanced and expanded, today, it is used in sports, medicine, education and marketing.\n\nThe difference between VR, AR, and mixed reality: \n\n -Virtual reality (VR) immerses users in a fully artificial digital environment.\n\n -Augmented reality (AR) overlays virtual objects on the real-world environment.\n\n -Mixed reality (MR) not just overlays but anchors virtual objects to the real world."
    
    var IOT : String = "'It's about networks, it's about devices, and it's about data' \n\t\t- Caroline Gorski \n\nIn the broadest sense, the term IoT encompasses everything connected to the internet, but it is increasingly being used to define objects that 'talk' to each other.\n\nBy combining these connected devices with automated systems, it is possible to 'gather information, analyse it and create an action' to help someone with a particular task, or learn from a process. \n\n'IoT offers us opportunity to be more efficient in how we do things, saving us time, money and often emissions in the process', Evans says. It allows companies, governments and public authorities to rethink how they deliver services and produce goods."
    
    var ThreeD : String = "3D printing, also known as additive manufacturing, is empowering artists, designers and makers with affordable, easily accessible tools, not just for dreaming up masterpieces of craft and design but also for creating, exhibiting and monetizing them. It’s a whole new kind of digital craftsmanship revolution.\n\nRecent advancements in speed, printing technology and material capabilities are now aligned, and together they will push the entire industry forward.\n\nPrototyping (55%), production (43%) and Proof of Concept models (41%) are the three most popular 3D printing applications in 2018 with R&D departments being the most active adopters."
    
    var AI : String = "AI means that machines can perform tasks in ways that are 'intelligent.' These machines aren't just programmed to do a single, repetitive motion -- they can do more by adapting to different situations.People are seeking to create machines that can make decisions in similar ways to humans and use those decisions to complete tasks.\n\nNeural networks are a type of computer system that's made to classify information like our own brains do. These networks use the data they have access to make determinations. The data doesn't allow them to be perfectly accurate, but they can make decisions based on what's most likely to be right.\n\nMost importantly, these systems involve a feedback loop for 'learning'. The machine can find out whether or not its decisions were right, and then change its approach to do better next time."
    
    var drones : String = "Unmanned Aerial Systems (UAS), is the all-encompassing term that includes the UAV, or drone.  drones are filling a totally different niche, as improvements in software and management of drones simplify their use and allow for greater autonomy in functions such as collision avoidance, data collection, pre-programmed flight routing, Bluetooth capability, active tracking, terrain follow, etc.\n\nIt was in 2013 that consumer drones really began to take off. That's when a company called Dà-Jiāng Innovations Science and Technology Co. Ltd, better known as DJI, introduced the Phantom.\n\nDrones could become the secret weapon that gives local businesses a chance to compete against the increasingly speedy delivery of online giants like Amazon and Walmart.  Regulations need to catch up with technology, the technology is not yet mature."

    

    override func viewDidLoad() {
        super.viewDidLoad()
      
      technologies = []
      technologies.append(
        Technology(name: "Virtual Reality and Augmented Reality", info: VR, image: #imageLiteral(resourceName: "OculusRift01"))
      )
      technologies.append(
        Technology(name: "Natural Language Processing", info: "[Not Provided Yet]", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Internet of Things", info: IOT, image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Gesture-based Computing", info: "[Not Provided Yet]", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "3D Printing and Scanning", info: ThreeD, image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Holographics and telepresence", info: "[Not Provided Yet]", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Articial Intelligence", info: AI, image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Academic Video Production", info: "[Not Provided At All]", image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      technologies.append(
        Technology(name: "Drones and Robotics", info: drones, image: #imageLiteral(resourceName: "Xiaomi-VR"))
      )
      
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! ViewControllerTecnologias
        
        let indice = collectionView.indexPathsForSelectedItems
        
        destination.tit = technologies[(indice?.first?.row)!].name
        destination.inf = technologies[(indice?.first?.row)!].info
        destination.img = technologies[(indice?.first?.row)!].image
    }

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
