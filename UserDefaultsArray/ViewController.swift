//
//  ViewController.swift
//  UserDefaultsArray
//
//  Created by Pierre Juarez U. on 29/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myArray = UserDefaults.standard.stringArray(forKey: "arrayUD"){
            txt1.text = myArray[0]
            txt2.text = myArray[1]
            txt3.text = myArray[2]
        }
    }

    
    @IBAction func btnSave(_ sender: Any) {
        if txt1.text == ""{
            alertCustom(title: "Error", message: "Llena el primer campo")
            return
        }
        if txt2.text == ""{
            alertCustom(title: "Error", message: "Llena el segundo campo")
            return
        }
        if txt3.text == ""{
            alertCustom(title: "Error", message: "Llena el tercer campo")
            return
        }
        
        array.append(txt1.text ?? "")
        array.append(txt2.text ?? "")
        array.append(txt3.text ?? "")
        
        UserDefaults.standard.set(array, forKey: "arrayUD")
        
        alertCustom(title: "Completado", message: "Se guardaron correctamente los valores")
    }
    
    func alertCustom(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btn = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(btn)
        present(alert, animated: true)
    }
}

