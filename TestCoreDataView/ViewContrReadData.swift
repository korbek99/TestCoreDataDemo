//
//  ViewContrReadData.swift
//  TestCoreDataView
//
//  Created by Jose David Bustos H on 31-03-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewContrReadData: UIViewController {
    @IBOutlet weak var LabelIde: UILabel!
    
    @IBOutlet weak var LabelNombre: UILabel!
    
    @IBOutlet weak var LabelApellido: UILabel!
    
    @IBOutlet weak var LabelEdad: UILabel!
    
    
    @IBOutlet weak var TextIDE: UITextField!
    
    
    @IBOutlet weak var TextNombre: UITextField!
    
    
    @IBOutlet weak var TextApellido: UITextField!
    
    
    @IBOutlet weak var TextIEdad: UITextField!
   
    
    @IBAction func ReadData(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
       /* let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let usur = UsuarioEnt(context: context)
        
            self.TextIDE.text = usur.ide
            self.TextNombre.text = usur.nombre
            self.TextApellido.text = usur.apellido
            self.TextIEdad.text = usur.edad*/
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UsuarioEnt")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                let IdeString:String! = data.value(forKey: "ide") as? String
                //var IdeString:String?  = nil
                // IdeString = data.value(forKey: "ide") as? String
                
                if IdeString != nil {
                   self.TextIDE.text = IdeString
                   // print(IdeString ?? <#default value#>)
                }
                
                //print(data.value(forKey: "username") as! String)
                
                self.TextNombre.text = data.value(forKey: "nombre") as? String
                self.TextApellido.text = data.value(forKey: "apellido") as? String
                self.TextIEdad.text = data.value(forKey: "edad") as? String
                
            }
            
        } catch {
            
            print("Failed")
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
    
    
}
