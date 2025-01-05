//
//  DetailVC.swift
//  ReteAmica
//
//  Created by AydınKaya on 25.12.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    
    var kisi : Kisiler?
    var viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            
            tfFirstName.text = k.kisi_ad
            tfPhone.text = k.kisi_tel
        }
        
    }
    
    
    @IBAction func buttonUpdate(_ sender: UIButton) {
        
        if let personName = tfFirstName.text, let personPhone = tfPhone.text, let personId = kisi?.kisi_id {
            viewModel.personUpdate(kisi_id: Int(personId)!, kisi_ad: personName, kisi_tel: personPhone)
        }
    }
    
    
    
}
