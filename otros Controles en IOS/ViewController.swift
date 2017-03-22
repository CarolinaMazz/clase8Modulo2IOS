//
//  ViewController.swift
//  otros Controles en IOS
//
//  Created by Alumno on 21/03/17.
//  Copyright © 2017 area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var stpNumero: UIStepper!
    @IBOutlet weak var lblNumero: UILabel!
    @IBOutlet weak var prgProgreso: UIProgressView!
    @IBOutlet weak var btnProgreso: UIButton!
    
    
    @IBOutlet weak var actProgreso: UIActivityIndicatorView!
    
    
    @IBOutlet weak var vwContenido: UIView!
    
    
    @IBOutlet weak var scrContenedor: UIScrollView!
    
    var opciones = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblNumero.text = "\(stpNumero.value)"
        
        for i in 0...5 {
            opciones.append("Opcion \(i)")
        }
        
        scrContenedor.addSubview(vwContenido)
        
        scrContenedor.contentSize = vwContenido.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stpNumeroValueChanged(_ sender: UIStepper) {
        
        lblNumero.text = "\(sender.value)"
        
        prgProgreso.progress = Float(sender.value) / Float(sender.maximumValue)
        
        //<0.3 rojo
        //>0.3 < 0.8 amarillo
        //>0.8 verde
        
        let progreso = sender.value / sender.maximumValue
        
        prgProgreso.progress = Float(progreso)
        
        if (progreso<0.3){
            prgProgreso.progressTintColor = UIColor.red
        }
        
        if (progreso>0.0 && progreso < 1.0){
            actProgreso.isHidden = false
        }else{
            actProgreso.isHidden = true
        }
    }
    
    
    /*@IBAction func btnProgresoTouch(_ sender: UIButton) {
        
        for i in 0...1000 {
            prgProgreso.progress = (Float(i)/1000.0)
        }
    }*/

    @IBAction func datFechaValueChange(_ sender: UIDatePicker) {
        
        //print(sender.date)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy H:mm:ss"
        
        let resultado = dateFormatter.string(from: sender.date)
        
        //dateFormatter.date(from: "31/03/2017 08:00:00 AM")
        
        print(resultado)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return opciones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opciones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(opciones[row])
    }
    
}

