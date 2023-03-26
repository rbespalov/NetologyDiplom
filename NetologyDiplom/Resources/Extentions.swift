//
//  File.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
