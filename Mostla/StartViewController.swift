//
//  StartViewController.swift
//  Mostla
//
//  Created by Enrique Barragán on 10/17/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

  @IBOutlet weak var button: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.darkGray.cgColor
    }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.landscape
  }
  override var shouldAutorotate: Bool { return false
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
