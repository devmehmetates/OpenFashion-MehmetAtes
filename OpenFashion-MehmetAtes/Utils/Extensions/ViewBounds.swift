//
//  ViewBounds.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 2.08.2022.
//

import UIKit

extension Double {
    
    var responsiveH: Double { return (UIScreen.main.bounds.size.height * self) / 100 }
    var responsiveW: Double { return (UIScreen.main.bounds.size.width * self) / 100 }
}
