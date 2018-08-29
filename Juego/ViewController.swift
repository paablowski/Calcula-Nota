//
//  ViewController.swift
//  Juego
//
//  Created by Pablo Felipe on 8/25/18.
//  Copyright © 2018 Pablo Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var display1: UILabel!
    @IBOutlet weak var display2: UILabel!
    @IBOutlet weak var display3: UILabel!
    @IBOutlet weak var displayPromedio: UILabel!
    @IBOutlet weak var btnCalcula: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider1.value = 7
        slider2.value = 6
        slider3.value = 5
        display1.text = String(slider1.value)
        display2.text = String(slider2.value)
        display3.text = String(slider3.value)
        displayPromedio.text = String(5.9)
        
    }
    @IBAction func slider1Changed(_ sender: UISlider) {
        
        if sender.value < 4 {
            self.display1.textColor = UIColor(hexString: "#ff3b30")
        }else{
            self.display1.textColor = UIColor(hexString: "#007aff")
        }
        self.display1.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        if sender.value < 4 {
            self.display2.textColor = UIColor(hexString: "#ff3b30")
        }else{
            self.display2.textColor = UIColor(hexString: "#007aff")
        }
        self.display2.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func slider3Changed(_ sender: UISlider) {
        if sender.value < 4 {
            self.display3.textColor = UIColor(hexString: "#ff3b30")
        }else{
            self.display3.textColor = UIColor(hexString: "#007aff")
        }
        self.display3.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func btnCalculaPressed(_ sender: UIButton) {
        let nota1 = self.slider1.value * 0.3
        let nota2 = self.slider2.value * 0.3
        let nota3 = self.slider3.value * 0.4
        calculaPromedio(nota1: nota1, nota2: nota2, nota3: nota3)
        
    }
    
    func calculaPromedio(nota1: Float, nota2: Float, nota3: Float){
        let suma = nota1 + nota2 + nota3
        displayPromedio.text = String(String(format:"%.3f", suma))
        
        if suma < 4 {
            let vaAExamen = UIAlertController(title: "⚠️ ¡Alerta! ⚠️",
                message: "Tendrás que dar examen",
                preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok 😥",
                                       style: .default,
                                       handler: nil)
            vaAExamen.addAction(accion)
            present(vaAExamen, animated: true, completion: nil)
        }
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
