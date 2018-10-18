//
//  ViewControllerTecnologias.swift
//  Mostla
//
//  Created by Alumno on 10/17/18.
//  Copyright © 2018 Enrique Barragán. All rights reserved.
//

import UIKit

class ViewControllerTecnologias: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var info: UITextView!
    
    var tit : String!
    var inf : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titulo.text = tit
        info.text = inf
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
