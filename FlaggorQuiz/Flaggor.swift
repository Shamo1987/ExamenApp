//
//  Flaggor.swift
//  FlaggorQuiz
//
//  Created by Shamo Zahidov on 26.05.2020.
//  Copyright © 2020 info. All rights reserved.
//

import Foundation

class Flaggor:Equatable,Hashable {
    var flagga_id:Int?
    var flagga_name:String?
    var flagga_photo:String?
    
    init() {
        
    }
    
    init(flagga_id:Int,flagga_name:String,flagga_photo:String) {
        self.flagga_id = flagga_id
        self.flagga_name = flagga_name
        self.flagga_photo = flagga_photo
    }
    
    var hashValue : Int {
        get {
            return flagga_id.hashValue
        }
    }
    
    static func == (lhs:Flaggor,rhs:Flaggor)->Bool {
        return lhs.flagga_id == rhs.flagga_id
    }
    
    
}
