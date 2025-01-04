//
//  DetailVM.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation


class DetailVM{
    
    var pRepo = PersonDaoRepository()
    
    func personUpdate(kisi: KisilerModel, kisi_ad:String, kisi_tel:String){
    
        pRepo.personUpdate(kisi: kisi, kisi_ad: kisi_ad, kisi_tel: kisi_tel)

    }
    
    
}
