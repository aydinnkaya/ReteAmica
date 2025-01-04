//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift


class PersonDaoRepository {
    
    
    var personList = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    func personSave(kisi_ad:String, kisi_tel:String){
        print("Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    
    func personUpdate(kisi: KisilerModel, kisi_ad:String, kisi_tel:String){ // id changed Object
        print("Kisi id: \(kisi), Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    func personDelete(kisi: KisilerModel){
        
    }
    
    func personSearch(inputText: String){
        print("")
    }
    
    func personLoading(){
        
        /*
         let initialList = [
         Kisiler(kisi_id: 1, kisi_ad: "Aydin", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 2, kisi_ad: "Kelebek", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 3, kisi_ad: "Bebis", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 4, kisi_ad: "Hatun", kisi_tel: "5314681288")
         ]
         personList.onNext(initialList)
         
         */
        
        
        
    }
    
}
