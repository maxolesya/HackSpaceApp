//
//  ViewController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 20.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var hackathones: [Hackathon]=[]
    var images: NSMutableArray=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hackathones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "menuHacksSell", for: indexPath) as! MenuHacksCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz"
        //dateFormatter.locale = Locale.init(identifier: "en_GB")
        let hack = hackathones[indexPath.row]
        //let dateObj = dateFormatter.date(from: (hack?.date as? Date)!)
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        cell.labelDate.text = hack.dateStart
        cell.labelTitle.text = hack.title
        cell.imageViewHack.image = UIImage(data: images[indexPath.row] as! Data);
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
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateObj = dateFormatter.date(from: "2018-05-05")*/
        tableView.delegate = self
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 80
        super.viewDidLoad()
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
                print("error=\(String(describing: error))")
                return
            }
            let httpStatus = response as? HTTPURLResponse
            responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            print("responseString = \(responseString)")
            if (httpStatus?.statusCode == 200){
                print("success")
                do{
                    self.hackathones = try JSONDecoder().decode([Hackathon].self, from: data!)
                    for i in 0...self.hackathones.count-1 {
                        if self.hackathones[i].preview == nil {
                            let url = URL(string: "https://get.wallhere.com/photo/digital-art-blue-technology-circle-lens-flare-laser-light-shape-line-screenshot-computer-wallpaper-atmosphere-of-earth-229495.jpg")
                            let data = try? Data(contentsOf: url!)
                            self.images.add(data!)
                        } else {
                            let url = URL(string: (self.hackathones[i].preview)!)
                            let data = try? Data(contentsOf: url!)
                            if data == nil {let url = URL(string: "https://get.wallhere.com/photo/digital-art-blue-technology-circle-lens-flare-laser-light-shape-line-screenshot-computer-wallpaper-atmosphere-of-earth-229495.jpg")
                                let data = try? Data(contentsOf: url!)
                                self.images.add(data!)
                            } else {self.images.add(data!)}
                        }
                        
                       
                    }
                    DispatchQueue.main.async {self.tableView.reloadData()}
                }
                catch{
                    print(error)
                    let alert = UIAlertController(title: "Something is wrong in !", message:"Check your username, password and try again!", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else {
                let alert = UIAlertController(title: "Wrong format!", message:"Make sure you are scanning an appropriate autorization tag", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)}
            
        
             }
 
             
             
             task.resume()
        }
    
}

