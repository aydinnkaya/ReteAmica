//
//  Kisiler.swift
//  ReteAmica
//
//  Created by AydınKaya on 26.12.2024.
//

import Foundation


class Kisiler{
   
    var kisi_id:String?
    var kisi_ad:String?
    var kisi_tel:String?
    
    init(){
         
     }
     
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
