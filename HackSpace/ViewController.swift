//
//  ViewController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 20.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var hackathones: NSMutableArray=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hackathones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "menuHacksSell", for: indexPath) as! MenuHacksCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
        //dateFormatter.locale = Locale.init(identifier: "en_GB")
        let hack = hackathones[indexPath.row] as? Hackathon
        //let dateObj = dateFormatter.date(from: (hack?.date as? Date)!)
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        //cell.imageViewHack.image = UIImage(data: images[indexPath.row] as! Data);
        cell.labelDate.text = dateFormatter.string(from: (hack?.date)!)
        cell.labelTitle.text = hack?.title
        
        return cell
        
        
        
    }
      func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        //self.navigationController?.navigationBar.backgroundColor = UIColor.blue
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateObj = dateFormatter.date(from: "2018-05-05")
        tableView.delegate = self
        tableView.dataSource = self;
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        /*let h = Hackathon(date: dateObj! , title: "HackSpace", description: "The Best Hackathon")
        hackathones.add(h)
        hackathones.add(h)
        hackathones.add(h)
        hackathones.add(h)
        hackathones.add(h)*/
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func applyClick(_ sender: Any) {
    }
    
}

