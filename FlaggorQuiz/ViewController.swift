//
//  ViewController.swift
//  FlaggorQuiz
//
//  Created by Shamo Zahidov on 26.05.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseCopy()
    }
    
    func databaseCopy(){
        
        let bundleWay = Bundle.main.path(forResource: "flaggaquiz", ofType: ".sqlite")
        
        let targetfWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let PlacetobeCopied = URL(fileURLWithPath: targetfWay).appendingPathComponent("flaggaquiz.sqlite")
        
        if fileManager.fileExists(atPath: PlacetobeCopied.path) {
            print("Det finns redan en databas och behöver inte kopiera")
        }else{
            do {
                
                try fileManager.copyItem(atPath: bundleWay!, toPath: PlacetobeCopied.path)
                
            }catch{
                print(error)
            }
        }
    }


}

