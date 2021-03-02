//
//  SuscriptionButton.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 02/03/2021.
//

import UIKit

class SuscriptionButton: UIButton {
    public init() {
       super.init(frame: .zero)
       setupButton()
    }
    public required init?(coder: NSCoder) {
       fatalError("coder not implemented.")
    }

}

extension SuscriptionButton {
    private func setupButton() {
        enable()
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
    }
    public func enable() {
        isEnabled = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    public func disable() {
        isEnabled = false
    }
}
