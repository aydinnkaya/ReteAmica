//
//  KisiKayıt.swift
//  ReteAmica
//
//  Created by AydınKaya on 25.12.2024.
//

import UIKit

class PersonSave: UIViewController {
    @IBOutlet weak var tfPersonName: UITextField!
    @IBOutlet weak var tfPersonPhone: UITextField!
    @IBOutlet weak var tfPersonLastName: UITextField!
    
    var viewModel = PersonSaveVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonCancel(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func buttonDone(_ sender: UIBarButtonItem) {

        if let personName = tfPersonName.text , let personPhone = tfPersonPhone.text {
            viewModel.personSave(kisi_ad: personName, kisi_tel: personPhone)
            
        }
        
        self.dismiss(animated: true)

        
    }
    
    
    
}
