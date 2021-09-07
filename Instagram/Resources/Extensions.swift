//
//  Extensions.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 29/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import UIKit

extension UIView {
    
    
    public var width:CGFloat {
        return frame.size.width
    }
    public var height:CGFloat {
        return frame.size.height
    }
    
    public var top:CGFloat {
        return frame.origin.y
    }
    
    public var bottom:CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left:CGFloat {
        return frame.origin.x
    }
    
    public var right:CGFloat {
        return frame.origin.x + frame.size.width
    }
}
    extension String {
         func safeDataBaseKey() -> String {
          
           return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        }
    }

