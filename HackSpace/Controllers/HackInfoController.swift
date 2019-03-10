//
//  HackInfoController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 24.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class HackInfoController: UIViewController, UITableViewDataSource,UITableViewDelegate
{
   
    
    @IBOutlet var tableView: UITableView!
    var id:Int?
    var hack:HackInfo?
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
        get_info(url: "https://facepalm.host/api/events/"+String(id!))
        
        super.viewDidLoad()
        textViewDesc.text="Сегодня на нашей платформе стартовал чемпионат Telecom Data Cup совместно с компанией «МегаФон». Задача участников чемпионата — проанализировать массив данных и с помощью известных им методов машинного обучения предсказать, насколько абоненты удовлетворены качеством связи телеком-оператора."

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeCell
        
     
        return cell
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
                print("success")}
            do {
                self.hack = try JSONDecoder().decode(HackInfo.self, from: data!)
                
               DispatchQueue.main.async {
                self.labelTitle.text = self.hack?.title
                self.labelPlace.text = self.hack?.city
                self.labelSubmissionDL.text = String((self.hack?.submissionDue?.prefix(10))!)
                self.labelDates.text = String((self.hack?.dateStart.prefix(10))!) + " - " + String((self.hack?.dateEnd.prefix(10))!)
                self.hackImageView.image = self.image
                self.navigationItem.title = self.hack?.title}
               
                
            }
            catch{
                print(error)
                let alert = UIAlertController(title: "Something is wrong in !", message:"Check your username, password and try again!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
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
