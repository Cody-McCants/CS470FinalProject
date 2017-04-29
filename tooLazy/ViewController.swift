//
//  ViewController.swift
//  tooLazy
//
//  Created by student on 4/12/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit


    class ViewController: UIViewController {
        
        let URL_Login = "http://cs370group.com/Login.php"
        
        
        @IBOutlet weak var testFieldMail: UITextField!
        
        
        @IBOutlet weak var testFieldPassword: UITextField!
        
        @IBAction func LoginButton(_ sender: UIButton) {
            
            let requestURL = NSURL(string: URL_Login)
            
            let request = NSMutableURLRequest(url: requestURL! as URL)
            
            request.httpMethod = "POST"
            let teamName=testFieldMail.text
            let memberCount = testFieldPassword.text
            
            //creating the post parameter by concatenating the keys and values from text field
            let postParameters = "Email="+teamName!+"&Password="+memberCount!;
            
            //adding the parameters to request body
            request.httpBody = postParameters.data(using: String.Encoding.utf8)
            
            
            //creating a task to send the post request
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if error != nil{
                    print("error is \(error)")
                    return;
                }
                
                //parsing the response
                do {
                    //converting resonse to NSDictionary
                    let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    //parsing the json
                    if let parseJSON = myJSON {
                        
                        //creating a string
                        var msg : Bool?
                        
                        //getting the json response
                        msg = (parseJSON["message"] as! Bool?)!
                        
                        //printing the response
                        // checking to see if the returned value is true or false
                        
                        if(msg == true) {
                            print ("This is Working")
                        } else {
                            print ("no work")
                            
                        }
                        
                        
                    }
                } catch {
                    print(error)
                }
                
            }
            //executing the task
            task.resume()
            
            
            
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }



