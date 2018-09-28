//
//  ActivityController.swift
//  Le Baluchon
//
//  Created by Levent Bostanci on 13/09/2018.
//  Copyright © 2018 Levent Bostanci. All rights reserved.
//

import Foundation
import UIKit

//extension UIViewController {
class ActivityIndicator {

    static func activityIndicator(activityIndicator: UIActivityIndicatorView, button: UIButton, showActivityIndicator: Bool){
        activityIndicator.isHidden = !showActivityIndicator
        button.isHidden = showActivityIndicator
    }
}
