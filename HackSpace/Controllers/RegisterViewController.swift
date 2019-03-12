//
//  RegisterViewController.swift
//  HackSpace
//
//  Created by Олеся Максакова on 06.03.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldSurname: UITextField!
    @IBOutlet var textFieldName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.layer.borderColor = UIColor.white.cgColor
        textFieldSurname.layer.borderColor = UIColor.white.cgColor
        textFieldEmail.layer.borderColor = UIColor.white.cgColor
        textFieldPassword.layer.borderColor = UIColor.white.cgColor

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        if (textFieldEmail.text?.isEmpty)! || (textFieldPassword.text?.isEmpty)! || (textFieldName.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message:"Please, enter your name, email and password", preferredStyle: .alert)
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
                if (textFieldPassword.text?.count)! >= 8 {
                    signUpPost(username: textFieldName.text!, email: textFieldEmail.text!, psw: textFieldPassword.text!)}
                else {
                    let alert = UIAlertController(title: "The password is too simple", message:"The password must contain at least 8 symbols", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
        
        }
        
    }
    func validateEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func signUpPost(username:String,email:String,psw:String) {
        var request = URLRequest(url: NSURL(string: "https://facepalm.host/api/hackers")! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var body: [String: AnyObject]
        body = ["username": username as AnyObject, "pwd": psw as AnyObject,"email":email as AnyObject]
        do {
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            
            request.httpBody = jsonBody
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil { // обработка ошибки при отправке
                    
                    print("error=\(String(describing: error))")
                    
                    return
                    
                }
                
                print("response = \(String(describing: response))")
                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                
                print("responseString = \(responseString)")
                
                if((responseString.contains("Bad")) ) {
                    DispatchQueue.main.async {
                        print("SMTH wrong")
                        return}
                    
                    
                }
                if (responseString.contains("success")) {
                    DispatchQueue.main.async {
                        /*let alert = UIAlertController(title: NSLocalizedString("Thank you!", comment: "thanks"), message: NSLocalizedString("You voted successfully", comment: "successful voting"), preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(defaultAction)
                        self.present(alert, animated: true, completion: nil)*/
                        print("ok ___!!!!")
                    }
                    
                }
            }
            task.resume()
        }
        catch{}
        
        
        
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
