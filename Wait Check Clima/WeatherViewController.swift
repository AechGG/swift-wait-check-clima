//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self;
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true);
        let text = searchTextField.text!;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true);
        let text = searchTextField.text!;
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        searchTextField.text = "";
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true;
        }
        textField.placeholder = "Type something here";
        return false;
    }
    
}

