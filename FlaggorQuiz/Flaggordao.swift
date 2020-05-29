//
//  Flaggordao.swift
//  FalggorQuiz
//
//  Created by Shamo Zahidov on 26.05.2020.
//  Copyright © 2020 info. All rights reserved.
//

import Foundation

class Flaggordao {
    
    let db:FMDatabase?
    
    init() {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("flaggaquiz.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    func bring5Randomly() -> [Flaggor] {
        var list = [Flaggor]()
        
        db?.open()
        
        
        do {
            
            
            let rs = try db!.executeQuery("SELECT * FROM flaggor ORDER BY RANDOM() LIMIT 5 ", values:nil)
            
            while(rs.next()){
                
                let flagga = Flaggor(flagga_id: Int(rs.string(forColumn: "flagga_id"))!, flagga_name: rs.string(forColumn: "flagga_name")!, flagga_photo: rs.string(forColumn: "flagga_photo")!)
                
                list.append(flagga)
                
            }
  
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return list
    }
    
    func bring3FelAlternativ(flagga_id:Int) -> [Flaggor] {
        var list = [Flaggor]()
        
        db?.open()
        
        
        do {
            
            
            let rs = try db!.executeQuery("SELECT * FROM flaggor WHERE flagga_id != ? ORDER BY RANDOM() LIMIT 3 ", values:[flagga_id])
            
            while(rs.next()){
                
                let flagga = Flaggor(flagga_id: Int(rs.string(forColumn: "flagga_id"))!, flagga_name: rs.string(forColumn: "flagga_name")!, flagga_photo: rs.string(forColumn: "flagga_photo")!)
                
                list.append(flagga)
                
            }
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return list
    }
    
    

}
