//
//  ViewContrSaveData.swift
//  TestCoreDataView
//
//  Created by Jose David Bustos H on 31-03-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewContrSaveData: UIViewController {
    
     var str_mensaje:String = "";
    
    @IBOutlet weak var LabelIde: UILabel!
    
    @IBOutlet weak var LabelNombre: UILabel!
    
    @IBOutlet weak var LabelApellido: UILabel!
    
    @IBOutlet weak var LabelEdad: UILabel!
    

    @IBOutlet weak var TextIDE: UITextField!
    
    
    @IBOutlet weak var TextNombre: UITextField!
    
    
    @IBOutlet weak var TextApellido: UITextField!
    
    
    @IBOutlet weak var TextIEdad: UITextField!
    
    
    @IBAction func GrabarDatos(_ sender: Any) {
        
        if ValidField() == true {

            
            do {
               /* let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let usur = UsuarioEnt(context: context)
                
                usur.ide = self.TextIDE.text
                usur.nombre = self.TextNombre.text
                usur.apellido = self.TextApellido.text
                usur.edad = self.TextIEdad.text
                
                (UIApplication.shared.delegate as! AppDelegate).saveContext()*/
                
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                
                let context = appDelegate.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "UsuarioEnt", in: context)
                let newUser = NSManagedObject(entity: entity!, insertInto: context)
                
                
                newUser.setValue(self.TextIDE.text, forKey: "ide")
                newUser.setValue(self.TextNombre.text, forKey: "nombre")
                newUser.setValue(self.TextApellido.text, forKey: "apellido")
                newUser.setValue(self.TextIEdad.text, forKey: "edad")
                
                do {
                    
                    try context.save()
                    
                } catch {
                    
                    print("Failed saving")
                }

                
                print("saving Datas")
                
                ClearField()
                
                str_mensaje = "Se Grabaron sus Datos"
                
                let alert = UIAlertController(title: "Alert", message: str_mensaje, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            } catch {
                print("Failed Saving")
            }
            
            
           
        }else{
        
            let alert = UIAlertController(title: "Alert", message: str_mensaje, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ClearField()
    {
        TextIDE.text = ""
        TextNombre.text = ""
        TextApellido.text = ""
        TextIEdad.text = ""
    }
    func ValidField() -> Bool
    {
        var isValid = true;
        
        
        if TextIDE.text == ""   {
            str_mensaje = "Campo IDE vacio"
            isValid = false
            return isValid
        }
        if TextNombre.text == ""   {
            str_mensaje = "Campo Nombre vacio"
            isValid = false
            return isValid
        }
        if TextApellido.text == ""   {
            str_mensaje = "Campo Apellido vacio"
            isValid = false
            return isValid
        }
        if TextIEdad.text == ""   {
            str_mensaje = "Campo Edad vacio"
            isValid = false
            return isValid
        }
        
        return isValid;
    }
}
