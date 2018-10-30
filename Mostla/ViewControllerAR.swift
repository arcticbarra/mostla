//
//  ViewControllerAR.swift
//  Mostla
//
//  Created by Enrique Barragán on 10/22/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewControllerAR: UIViewController, ARSCNViewDelegate {
  @IBOutlet weak var sceneView: ARSCNView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      sceneView.delegate = self
      let scene = SCNScene(named: "art.scnassets/ship.scn")!
      sceneView.scene = scene

        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    let configuraton = ARWorldTrackingConfiguration()
    sceneView.session.run(configuraton)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    sceneView.session.pause()
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
