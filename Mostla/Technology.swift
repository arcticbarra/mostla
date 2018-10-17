//
//  Technology.swift
//  Mostla
//
//  Created by Enrique Barragán on 10/17/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit

class Technology: NSObject {
  var name: String!
  var info: String!
  var image: UIImage?
  
  init(name: String, info: String, image: UIImage) {
    self.name = name
    self.info = info
    self.image = image
  }
}
