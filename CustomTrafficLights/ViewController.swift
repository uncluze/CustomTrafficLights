//
//  ViewController.swift
//  CustomTrafficLights
//
//  Created by uncluze on 23.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    enum TrafficLightColors {
        case red, yellow, green
    }
    
    private var trafficLightColors = TrafficLightColors.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.configuration = setupButton(with: "Get Start")
       // startButton.layer.cornerRadius = 10
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        startButton.configuration = setupButton(with: "NEXT")
        // startButton.setTitle("NEXT", for: .normal)
        
        switch trafficLightColors {
        case .red:
            greenLightView.alpha = lightOff
            redLightView.alpha = lightOn
            trafficLightColors = .yellow
        case .yellow:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            trafficLightColors = .green
        case .green:
            greenLightView.alpha = lightOn
            yellowLightView.alpha = lightOff
            trafficLightColors = .red
        }
    }
}

private func setupButton(with title: String) -> UIButton.Configuration {
    
    var buttonConfiguration = UIButton.Configuration.filled()
    buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.8093360066, green: 0.8442705274, blue: 0.9972055554, alpha: 1)
    buttonConfiguration.title = title
    buttonConfiguration.buttonSize = .large
    buttonConfiguration.cornerStyle = .large
    buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    return buttonConfiguration
}
