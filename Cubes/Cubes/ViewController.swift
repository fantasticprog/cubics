//
//  ViewController.swift
//  Cubes
//
//  Created by Александр Зацаренский on 26.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var leftCubic: UIImageView!
    @IBOutlet weak var rightCubic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButton(_ sender: UIButton) {
        let element: [UIImageView] = [leftCubic, rightCubic]
        for imageView in element {
            let random = Int.random(in: 1...6)
            let image = UIImage(named: "cubic\(random)")
            shake(imageView)
            UIView.transition(with: imageView, duration: 0.2, options: .transitionCrossDissolve) {
                imageView.image = image
            }
        }
    }
    
    private func shake(_ view: UIImageView) {
        let random = Double.random(in: -0.4...0.4)
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.duration = Double.random(in: 0.5...0.8)
        animation.values = [-random, random, -random, random, -random, random, -random, -random/2, random/2, 0]
        view.layer.add(animation, forKey: "shake")
    }
}

