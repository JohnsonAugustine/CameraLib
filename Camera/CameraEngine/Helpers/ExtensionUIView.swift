///
//  ExtensionUINavigationBar.swift
//  Camera
//
//  Created by Mohamed Shaat on 1/24/19.
//  Copyright © 2019 Mohamed Shaat. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false   // 5
        contentView.layoutAttachAll(to: self)
        return contentView
        
    }
    
    public func layoutAttachAll(to childView:UIView)
    {
        var constraints = [NSLayoutConstraint]()
        childView.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(NSLayoutConstraint(item: childView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
        childView.addConstraints(constraints)
        
    }
    
}
