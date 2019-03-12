//
//  ProfileController.swift
//  HackSpace
//
//  Created by Юрий Дубинин on 11/03/2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

   
    @IBAction func addSkillsClick(_ sender: Any) {
        self.performSegue(withIdentifier: "skillsSegue", sender:0)
    }
    
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
