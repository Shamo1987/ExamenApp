//
//  ResultScreenViewController.swift
//  FlaggorQuiz
//
//  Created by Shamo Zahidov on 27.05.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit

class ResultScreenViewController: UIViewController {

    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var labelProcent: UILabel!
    
    
    var rattAntal:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        if let d = rattAntal {
            labelResult.text = "\(d) RÄTT \(5-d) FEL"
            labelProcent.text = "% \(d*100/5) Framgång"
        }

    }
    

    @IBAction func provaIgen(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
            
            
        }
    
   
    
}
