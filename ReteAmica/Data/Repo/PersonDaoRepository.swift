//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift
import FirebaseFirestore


class PersonDaoRepository {
    
    var personList = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionPersons = Firestore.firestore().collection("Kisiler")
    
    func personSave(kisi_ad:String, kisi_tel:String){
        let newPerson : [String : Any] =  ["kisi_id" : "" ,"kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collectionPersons.document().setData(newPerson)
    }
    
    
    func personUpdate(kisi_id: String, kisi_ad:String, kisi_tel:String){
        let updatePErson : [String : Any] =  ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collectionPersons.document(kisi_id).updateData(updatePErson)
    }
    
    func personDelete(kisi_id: String){
        
    }
    
    func personSearch(inputText: String){
        
    }
    
    func personLoading(){
        
        collectionPersons.addSnapshotListener{ snapshot, error in
            var list = [Kisiler]()
            
            if let documents = snapshot?.documents {
                for document  in documents {
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let person = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    list.append(person)
                }
            }
            
            self.personList.onNext(list)
            
        }
    }
    
}
