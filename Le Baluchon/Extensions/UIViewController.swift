//
//  UIViewController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 09/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Error Messages
    func showErrorPopup(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
