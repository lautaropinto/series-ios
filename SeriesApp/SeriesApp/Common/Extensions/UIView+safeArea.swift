//
//  UIView+safeArea.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

public extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.bottomAnchor
    }
}


