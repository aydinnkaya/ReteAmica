//
//  DetailVM.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation


class DetailVM{
    
    var pRepo = PersonDaoRepository()
    
    func personUpdate(kisi_id: String, kisi_ad:String, kisi_tel:String){
    
        pRepo.personUpdate(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)

    }
    
    
}
