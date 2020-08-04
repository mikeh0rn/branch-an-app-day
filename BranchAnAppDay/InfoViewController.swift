//
//  InfoViewController.swift
//  BranchAnAppDay
//
//  Created by Michael Horn on 7/31/20.
//  Copyright © 2020 Mike Horn. All rights reserved.
//

import Foundation
import UIKit
import Branch

class InfoViewController: UIViewController {
    
    public var name: String = ""
    public var role: String = ""
    public var location: String = ""
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldRole: UITextField!
    @IBOutlet weak var textFieldLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTextFields() {
        textFieldName.delegate = self
        textFieldRole.delegate = self
        textFieldLocation.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(InfoViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("handle tap was called")
        view.endEditing(true)
    }
    
    @IBAction func createBranchLinkTapped(_ sender: Any) {
    }
}

extension UIViewController: UITextFieldDelegate {
   
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

