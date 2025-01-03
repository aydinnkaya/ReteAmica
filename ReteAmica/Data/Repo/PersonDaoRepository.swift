//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift


class PersonDaoRepository {
    
    var personList = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func personSave(kisi_ad:String, kisi_tel:String){
        print("Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    
    func personUpdate(kisi_id: Int, kisi_ad:String, kisi_tel:String){
        print("Kisi id: \(kisi_id), Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    func personDelete(kisi_id: Int){
        
    }
    
    func personSearch(inputText: String){
        
    }
    
    func personLoading(){
        var list = Kisiler()
        let initialList = [
            Kisiler(kisi_id: 1, kisi_ad: "Aydin", kisi_tel: "5314681288"),
            Kisiler(kisi_id: 2, kisi_ad: "Kelebek", kisi_tel: "5314681288"),
            Kisiler(kisi_id: 3, kisi_ad: "Bebis", kisi_tel: "5314681288"),
            Kisiler(kisi_id: 4, kisi_ad: "Hatun", kisi_tel: "5314681288")
        ]
        personList.onNext(initialList)
    }
    
}
