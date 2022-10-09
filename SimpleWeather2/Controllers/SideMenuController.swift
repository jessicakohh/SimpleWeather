//
//  SideMenuController.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/09.
//

import UIKit

class SideMenuController: UIViewController {
    
    var items = [ "현재 위치정보", "문의하기", "개인정보 처리방침", "개발자 정보" ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LinkSelected" {
            let vc = segue.destination as! MenuController
            vc.titleText = sender as! String
        }
    }
}


extension SideMenuController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCell
        cell.menuLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}


extension SideMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let title = items[indexPath.row]
        performSegue(withIdentifier: "LinkSelected", sender: title)
    }
}
