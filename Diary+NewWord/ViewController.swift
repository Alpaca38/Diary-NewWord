//
//  ViewController.swift
//  Diary+NewWord
//
//  Created by 조규연 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    @IBOutlet var fifthButton: UIButton!
    @IBOutlet var sixthButton: UIButton!
    @IBOutlet var seventhButton: UIButton!
    @IBOutlet var eighthButton: UIButton!
    @IBOutlet var ninethButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    let labels = ["행복해","사랑해","좋아해","당황해","속상해","우울해","심심해","원통해","비참해"]
    
    // Dictionary
    var buttonDic: [UIButton:(label: String, count: Int)] = [:]
    
    var counts: [Int] {
        get {
            UserDefaults.standard.array(forKey: "counts") as? [Int] ?? [0,0,0,0,0,0,0,0,0]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "counts")
            configureButtons()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        
        resetButton.setTitle("리셋", for: .normal)
        resetButton.layer.cornerRadius = 5
        resetButton.layer.borderWidth = 1
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    func configureButtons() {
        let buttons = [firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton, seventhButton, eighthButton, ninethButton]
        
        for (index, button) in buttons.enumerated() {
            // Dictionary
            if let button {
                button.configuration?.imagePlacement = .top
                button.configuration?.imagePadding = 8
                buttonDic[button] = (labels[index], counts[index])
                button.setImage(configureImage(name: "slime\(index + 1)"), for: .normal)
                button.setTitle("\(labels[index]) \(counts[index])", for: .normal)
            }
        }
    }
    
    func configureImage(name: String) -> UIImage? {
        let image = UIImage(named: name)?.resize(targetSize: CGSize(width: 100, height: 100))?.withRenderingMode(.alwaysOriginal)
        
        return image
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        if var data = buttonDic[sender] {
            data.count += 1
            buttonDic[sender] = data
            counts[sender.tag] = data.count
        }
    }
    
    @objc func resetButtonTapped() {
        counts = [0,0,0,0,0,0,0,0,0]
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.interpolationQuality = .high
        draw(in: newRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
