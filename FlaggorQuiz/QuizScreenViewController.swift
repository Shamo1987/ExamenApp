//
//  QuizScreenViewController.swift
//  FlaggorQuiz
//
//  Created by Shamo Zahidov on 26.05.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit

class QuizScreenViewController: UIViewController {
    
    
    @IBOutlet weak var labelRatt: UILabel!
    
    
    @IBOutlet weak var labelFel: UILabel!
    
    
   
    
    @IBOutlet weak var labelAntalFrogor: UILabel!
    
    @IBOutlet weak var imageViewFlagga: UIImageView!
    
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    
    var frogor = [Flaggor]()
    var felAlternativ = [Flaggor]()
    
    var rattFroga = Flaggor()
    
    var frogaRakna = 0
    var rattRakna = 0
    var felRakna = 0
    
    var alternativ = [Flaggor]()
    var alternativBlandningLisa = Set <Flaggor>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frogor = Flaggordao().bring5Randomly()
        
        for s in frogor {
            print(s.flagga_name!)
        }
        
        laddaFroga()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let togoVC = segue.destination as! ResultScreenViewController
        togoVC.rattAntal = rattRakna
    }
    
    
    func laddaFroga(){
        labelAntalFrogor.text = "\(frogaRakna+1). FRÅGA"
        labelRatt.text = "Rätt : \(rattRakna)"
        labelFel.text = "Fel : \(felRakna)"
        
        rattFroga = frogor[frogaRakna]
        
        imageViewFlagga.image = UIImage(named: rattFroga.flagga_photo!)
        
        felAlternativ = Flaggordao().bring3FelAlternativ(flagga_id: rattFroga.flagga_id!)
        
        alternativBlandningLisa.removeAll()
        
        alternativBlandningLisa.insert(rattFroga)
        alternativBlandningLisa.insert(felAlternativ[0])
        alternativBlandningLisa.insert(felAlternativ[1])
        alternativBlandningLisa.insert(felAlternativ[2])
        
        alternativ.removeAll()
        
        for s in alternativBlandningLisa {
            alternativ.append(s)
        }
        
        buttonA.setTitle(alternativ[0].flagga_name, for: .normal)
        buttonB.setTitle(alternativ[1].flagga_name, for: .normal)
        buttonC.setTitle(alternativ[2].flagga_name, for: .normal)
        buttonD.setTitle(alternativ[3].flagga_name, for: .normal)
        
    }
    
    
    func rattControl(button:UIButton){
        let buttonText = button.titleLabel?.text
        let rattSvar = rattFroga.flagga_name
        
        print("Button Text : \(buttonText!)")
        print("Ratt Svar : \(rattSvar!)")
        
        if rattSvar == buttonText {
            rattRakna += 1
        }else{
            felRakna += 1
        }
        
        labelRatt.text = "Rätt : \(rattRakna)"
        labelFel.text = "Fel : \(felRakna)"
        
    }
    
    func frogaRaknaControl(){
        frogaRakna += 1
        
        if frogaRakna != 5 {
            laddaFroga()
        }else{
            performSegue(withIdentifier: "toResultScreen", sender: nil)
        }
    }
    
    
    @IBAction func buttonAKlick(_ sender: Any) {
        rattControl(button: buttonA)
        frogaRaknaControl()
        }
    
    @IBAction func buttonBKlick(_ sender: Any) {
        rattControl(button: buttonB)
        frogaRaknaControl()
    }
    
    
    @IBAction func buttonCKlick(_ sender: Any) {
        rattControl(button: buttonC)
        frogaRaknaControl()
        
    }
    
    
    
    @IBAction func buttonDKlick(_ sender: Any) {
        rattControl(button: buttonD)
        frogaRaknaControl()
    }
    
    
 
}
