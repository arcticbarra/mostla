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
  @IBOutlet weak var startLabel: UILabel!
  
  let fadeDuration: TimeInterval = 0.3
  let rotateDuration: TimeInterval = 3
  let waitDuration: TimeInterval = 0.5
  
  lazy var fadeAndSpinAction: SCNAction = {
    return .sequence([
      .fadeIn(duration: fadeDuration),
      .rotateBy(x: 0, y: 0, z: CGFloat.pi * 360 / 180, duration: rotateDuration)
      ])
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      startLabel.layer.masksToBounds = true
      startLabel.layer.cornerRadius = 6
        sceneView.delegate = self
    }
  
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    DispatchQueue.main.async {
      guard let imageAnchor = anchor as? ARImageAnchor,
        let imageName = imageAnchor.referenceImage.name else { return }
      self.startLabel.isHidden = true
      let overlayNode = self.getNode(withImageName: imageName)
      overlayNode.opacity = 0
      overlayNode.position.y = 0.2
      overlayNode.runAction(self.fadeAndSpinAction)
      
      node.addChildNode(overlayNode)
    }
  }
  
  lazy var shipNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/ship.scn"),
      let node = scene.rootNode.childNode(withName: "ship", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  func getPlaneNode(withReferenceImage image: ARReferenceImage) -> SCNNode {
    let plane = SCNPlane(width: image.physicalSize.width,
                         height: image.physicalSize.height)
    let node = SCNNode(geometry: plane)
    return node
  }
  
  func getNode(withImageName name: String) -> SCNNode {
    var node = SCNNode()
    switch name {
    case "vr360":
      node = shipNode
    case "artificialintelligence":
      node = shipNode
    case "video":
      node = shipNode
    case "drones":
      node = shipNode
    case "3dprinting":
      node = shipNode
    case "iot":
      node = shipNode
    default:
      break
    }
    return node
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    resetTrackingConfiguration()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    sceneView.session.pause()
  }
  
  func resetTrackingConfiguration() {
    guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
    let configuration = ARWorldTrackingConfiguration()
    configuration.detectionImages = referenceImages
    let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
    sceneView.session.run(configuration, options: options)
  }

}
