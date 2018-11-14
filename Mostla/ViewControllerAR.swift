//
//  ViewControllerAR.swift
//  Mostla
//
//  Created by Enrique Barragán on 10/22/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit
import SceneKit
import WebKit
import ARKit

class ViewControllerAR: UIViewController, ARSCNViewDelegate {
  @IBOutlet weak var sceneView: ARSCNView!
  @IBOutlet weak var startLabel: UILabel!
  
  let fadeDuration: TimeInterval = 0.3
  let rotateDuration: TimeInterval = 3
  let waitDuration: TimeInterval = 0.5
  var nodes: [SCNNode] = []
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.landscape
  }
  override var shouldAutorotate: Bool { return false
  }
  
  lazy var fadeAndSpinAction: SCNAction = {
    return .sequence([
      .fadeIn(duration: fadeDuration)
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
      let removeNode = self.nodes.popLast()
      removeNode?.removeFromParentNode()
      let overlayNode = self.getNode(withImageName: imageName)
      overlayNode.opacity = 0
      overlayNode.position.y = 0.2
      overlayNode.runAction(self.fadeAndSpinAction)
      
      node.addChildNode(overlayNode)
      self.nodes.append(overlayNode)
    }
  }
  
  lazy var aiNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/ai.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  lazy var printingNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/printing.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  lazy var dronesNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/drones.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  lazy var iotNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/iot.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  lazy var arNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/ar.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
    let scaleFactor  = 0.1
    node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
    node.eulerAngles.x += -.pi / 2
    return node
  }()
  
  lazy var videoNode: SCNNode = {
    guard let scene = SCNScene(named: "art.scnassets/holographic.scn"),
      let node = scene.rootNode.childNode(withName: "box", recursively: false) else { return SCNNode() }
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
      node = arNode
    case "artificialintelligence":
      node = aiNode
    case "video":
      node = videoNode
    case "drones":
      node = dronesNode
    case "3dprinting":
      node = printingNode
    case "iot":
      node = iotNode
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
