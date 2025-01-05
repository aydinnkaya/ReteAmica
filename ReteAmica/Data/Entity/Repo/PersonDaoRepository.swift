//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift
import CoreData


class PersonDaoRepository {
    
    var personList = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    let context = appDelegate.persistentContainer.viewContext // acces database
    
    func personSave(kisi_ad:String, kisi_tel:String){
        let kisi = KisilerModel(context: context)
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    
    
    func personUpdate(kisi: KisilerModel, kisi_ad:String, kisi_tel:String){ // id changed Object
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        appDelegate.saveContext()
    }
    
    func personDelete(kisi: KisilerModel){
        context.delete(kisi)
        appDelegate.saveContext()
        personLoading()
    }
    
    func personSearch(inputText: String){
        do{
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS [c] %@", inputText)
            
            let liste = try context.fetch(fr)
            personList.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
            
        }
    }
    
    func personLoading(){
        
        do{
            let liste = try context.fetch(KisilerModel.fetchRequest())
            personList.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
            
        }
    }
    
}
