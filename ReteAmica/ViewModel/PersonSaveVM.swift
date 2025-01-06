//
//  PersonSaveVM.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation


class PersonSaveVM{
    
    var pRepo = PersonDaoRepository()
    
    func personSave(kisi_ad:String, kisi_tel:String){
        pRepo.personSave(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    
    func personLoading(){
        pRepo.personLoading()
    }
}
