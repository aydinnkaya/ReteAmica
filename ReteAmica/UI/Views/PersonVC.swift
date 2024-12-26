//
//  ViewController.swift
//  ReteAmica
//
//  Created by AydınKaya on 25.12.2024.
//

import UIKit

class PersonVC: UIViewController{

    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var personList = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        let p1 = Kisiler(kisi_id: 1, kisi_ad: "Aydin", kisi_tel: "5314681288")
        let p2 = Kisiler(kisi_id: 2, kisi_ad: "Kelebek", kisi_tel:"5314681288")
        let p3 = Kisiler(kisi_id: 3, kisi_ad: "Bebis", kisi_tel: "5314681288")
        let p4 = Kisiler(kisi_id: 4, kisi_ad: "Hatun", kisi_tel: "5314681288")
        
        personList += [p1,p2,p3,p4]

    }

    
  

}

extension PersonVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         
        print("Person Search : \(searchText)")
        
    }
}

extension PersonVC : UITableViewDelegate, UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = personList[indexPath.roww]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Kisiler")
        
    }
    
    
}

