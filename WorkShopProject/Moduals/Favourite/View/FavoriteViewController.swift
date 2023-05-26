//
//  FavoriteViewController.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 26/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       activeView()
    }
    

    func activeView(){
        favTable.delegate = self
        favTable.dataSource = self
        
        favTable.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
    }

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}
