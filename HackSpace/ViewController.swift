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
        print("jhbhjbj")
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "menuHacksSell", for: indexPath) as! MenuHacksCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
        //dateFormatter.locale = Locale.init(identifier: "en_GB")
        let hack = hackathones[indexPath.row] as? Hackathon
        //let dateObj = dateFormatter.date(from: (hack?.date as? Date)!)
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        //cell.imageViewHack.image = UIImage(data: images[indexPath.row] as! Data);
        cell.labelDate.text = hack?.dateStart
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
       get_list_of_hacks(url: "https://facepalm.host/api/events/")
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
    
    func get_list_of_hacks(url:String)  {
        var request = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        var responseString = ""
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            print("responseString = \(responseString)")
            DispatchQueue.main.async {
             
             do {
             if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray {
             for i in 0...convertedJsonIntoDict.count-1 {/*
             let info = convertedJsonIntoDict[i] as! NSDictionary
                let org =
                hackathones.add(Hackathon(title: info["title"], description: info["description"], link: info["link"], dateEnd: info["dateEnd"], dateStart: info["dateStart"], city: info["city"], preview: info["preview"], organization: <#T##Organization#>, schedule: <#T##String#>, eventType: <#T##String#>, id: <#T##Int#>, status: <#T##String#>, isSearchable: <#T##Bool#>, submissionDue: <#T##String#>))
             self.names.add((info["name"] as! String))
             self.titles.add(info["topic"] as! String);
             self.types.add(info["event_type"] as! String);
             self.id.add(info["id"] as! Int);
             self.places.add(info["place"] as! String)
             self.time.add(info["date_start"] as! String);
             self.desc.add(info["description"]  is NSNull ? "" : info["description"] as! String)//проверить!!!!!
             let url = URL(string: info["photo"] as! String)
             let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
             self.images.add(data)
             */}
             
             }
             
             
             }
             
             
             
             catch let error as NSError {
             print(error.description)
             if error.localizedDescription.contains("NSURL") {
             let alert = UIAlertController(title: NSLocalizedString("Error",  comment: "Error statement"), message: NSLocalizedString("Check the internet connection!",  comment: "request of internet"), preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alert.addAction(defaultAction)
             
             self.present(alert, animated: true, completion: nil)
             
             }
             
             }
             
             self.tableView.reloadData()
             
             
             
             }
            
             }
 
             
             
             task.resume()
        }
    
}

