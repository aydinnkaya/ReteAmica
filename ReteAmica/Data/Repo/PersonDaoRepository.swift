//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation


class PersonDaoRepository {
    
    func personSave(kisi_ad:String, kisi_tel:String){
        print("Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    
    func personUpdate(kisi_id: Int, kisi_ad:String, kisi_tel:String){
        print("Kisi id: \(kisi_id), Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
}
