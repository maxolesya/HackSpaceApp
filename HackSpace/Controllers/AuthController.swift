//
//  AuthController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 06.03.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class AuthController: UIViewController {

    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func validateEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
   
    @IBAction func signUpClick(_ sender: Any) {
        
    }
    @IBAction func logInClick(_ sender: Any) {
        if (textFieldEmail.text?.isEmpty)! || (textFieldPassword.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message:"Please, enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if !validateEmail(testStr:textFieldEmail.text!) {
                let alert = UIAlertController(title: "The email is incorrect", message:"Please, enter your email correctly", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                auth(email: textFieldEmail.text!, password: textFieldPassword.text!)
                
            }
            
        }
    }
    func auth(email: String,password:String) {
        var request = URLRequest(url: NSURL(string: "https://facepalm.host/api/login")! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(email, forHTTPHeaderField: "email")
        request.addValue(password, forHTTPHeaderField: "pwd")
        var responseString = ""
        var body: [String: AnyObject]
        body = ["email": email as AnyObject, "pwd": password as AnyObject]
        do{
        let jsonBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        
        request.httpBody = jsonBody
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            // Print out response string
            responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            print("responseString = \(responseString)")
        }
            task.resume()
            
        } catch{}
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
