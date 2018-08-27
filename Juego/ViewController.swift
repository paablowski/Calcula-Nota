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
        displayPromedio.text = String(5.7)
        
    }
    @IBAction func slider1Changed(_ sender: UISlider) {
        self.display1.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        self.display2.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func slider3Changed(_ sender: UISlider) {
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
    }
    
    
    /*
    @IBAction func btnExamenPress(_ sender: UIButton) {
        
        if self.slider.value <= 3.6 {
            let vaAExamen = UIAlertController(title: "Nota: \(self.slider.value)",
                message: "Tendrás que dar examen",
                preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok 😥",
                                       style: .default,
                                       handler: nil)
            vaAExamen.addAction(accion)
            present(vaAExamen, animated: true, completion: nil)
            
        }else{
            let noVaAExamen = UIAlertController(title: "Nota: \(self.slider.value)",
                message: "Te salvaste de dar examen 💪🏻",
                preferredStyle: .alert)
            let accion = UIAlertAction(title: "Cool 🤩",
                                       style: .default,
                                       handler: nil)
            noVaAExamen.addAction(accion)
            present(noVaAExamen, animated: true, completion: nil)
        }
     
    }*/
    
}
