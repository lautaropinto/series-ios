//
//  GradientColors.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 16/03/2021.
//

import UIKit

class GradientColors {
    var layer:CAGradientLayer!

    init() {
        let slate = UIColor(red: 60.0 / 255.0, green: 86.0 / 255.0, blue: 99.0 / 255.0, alpha: 1)
        let darkBlueGrey = UIColor(red: 9.0 / 255.0, green: 25.0 / 255.0, blue: 32.0 / 255.0, alpha: 1)

        self.layer = CAGradientLayer()
        self.layer.type = .axial
        self.layer.colors = [
                          darkBlueGrey.withAlphaComponent(0.7).cgColor,
                          slate.withAlphaComponent(0.5).cgColor,
                          darkBlueGrey.withAlphaComponent(0.5).cgColor,
                          slate.withAlphaComponent(0.5).cgColor,
                          darkBlueGrey.withAlphaComponent(0.7).cgColor,
                        ]
        self.layer.locations = [0.0, 1.0]
    }
}
