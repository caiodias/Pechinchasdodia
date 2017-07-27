//
//  BaseViewController.swift
//  Pechinchasdodia
//
//  Created by Juliana Lima on 18/10/16.
//  Copyright © 2016 Parada Desce. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,  UITextFieldDelegate {

    var scrollView:UIScrollView?
    var currentTextField:UITextField?
    var dataScroll:UIEdgeInsets?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        for view in self.view.subviews {
            if let noticeSubView = view as? UIScrollView {
                scrollView = noticeSubView
                dataScroll = scrollView?.contentInset
            }
        }
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView!.contentInset = contentInsets
        self.scrollView!.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeFieldPresent = currentTextField {
            if (!aRect.contains(activeFieldPresent.frame.origin)) {
                self.scrollView!.scrollRectToVisible(activeFieldPresent.frame, animated: true)
            }
        }
        
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        
        currentTextField = nil
        
        self.scrollView!.contentInset = dataScroll!
        self.scrollView!.scrollIndicatorInsets = dataScroll!
        
    }
    
    //MARK: UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentTextField = nil
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
