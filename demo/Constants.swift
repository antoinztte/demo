//
//  Constants.swift
//  demo
//
//  Created by Antoinette Marie Torres on 2/28/25.
//

import SwiftUI

struct Constants {
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
