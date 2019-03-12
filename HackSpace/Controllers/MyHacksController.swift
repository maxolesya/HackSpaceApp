//
//  MyHacksController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 12.03.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class MyHacksController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "menuHacksSell", for: indexPath) as! MenuHacksCell
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
