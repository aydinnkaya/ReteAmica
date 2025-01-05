//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift
import Alamofire


class PersonDaoRepository  {
    
    var personList = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func personSave(kisi_ad:String, kisi_tel:String){
        let param: Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post, parameters: param).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    func personUpdate(kisi_id: Int, kisi_ad:String, kisi_tel:String){
        let param: Parameters = ["kisi_id": kisi_id,"kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post, parameters: param).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func personDelete(kisi_id: Int){
        let param: Parameters = ["kisi_id": kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post, parameters: param).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    self.personLoading()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func personSearch(inputText: String){
        let param: Parameters = ["kisi_ad": inputText]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post, parameters: param).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(KisilerResponse.self, from: data)
                    if let liste = cevap.kisiler {
                        self.personList.onNext(liste)//Tetikleme
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func personLoading(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(KisilerResponse.self, from: data)
                    if let liste = cevap.kisiler {
                        self.personList.onNext(liste)//Tetikleme
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
