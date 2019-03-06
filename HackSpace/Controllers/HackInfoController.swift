//
//  HackInfoController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 24.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class HackInfoController: UIViewController {
    var hack:Hackathon?
    @IBOutlet var hackImageView: UIImageView!
    var image = UIImage();
    @IBOutlet var textViewDesc: UITextView!
    @IBOutlet var labelSubmissionDL: UILabel!
    @IBOutlet var labelDates: UILabel!
    @IBOutlet var labelPlace: UILabel!
    @IBAction func applyClick(_ sender: Any) {
    }
    @IBOutlet var labelTitle: UILabel!
    override func viewDidLoad() {
        get_info(url: "https://facepalm.host/api/events/"+String((hack?.id)!))
        labelTitle.text = hack?.title
        labelPlace.text = hack?.city
        
        labelSubmissionDL.text = String((hack?.submissionDue?.prefix(10))!)
        labelDates.text = String((hack?.dateStart?.prefix(10))!) + " - " + String((hack?.dateEnd?.prefix(10))!)
        hackImageView.image = image
        navigationItem.title = hack?.title
        super.viewDidLoad()
        textViewDesc.text="Сегодня на нашей платформе стартовал чемпионат Telecom Data Cup совместно с компанией «МегаФон». Задача участников чемпионата — проанализировать массив данных и с помощью известных им методов машинного обучения предсказать, насколько абоненты удовлетворены качеством связи телеком-оператора."

        // Do any additional setup after loading the view.
    }
    func get_info(url:String)  {
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
                /*do{
                    self.hackathones = try JSONDecoder().decode([Hackathon].self, from: data!)
                    DispatchQueue.main.async {self.tableView.reloadData()}
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
                        
                        
                    }*/
                    //DispatchQueue.main.async {super.viewDidLoad()}
                }
            
            
            
        }
        
        
        
        task.resume()
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
