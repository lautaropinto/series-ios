//
//  UIImageView+untint.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 16/03/2021.
//

import UIKit

extension UIImageView {
    func untint() {
        guard let currentCGImage = self.image?.cgImage else { return }
        let currentCIImage = CIImage(cgImage: currentCGImage)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")

        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")

        filter?.setValue(1, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return }

        let context = CIContext()

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            self.image = processedImage
            self.backgroundColor = UIColor.clear
        }
    }
}
