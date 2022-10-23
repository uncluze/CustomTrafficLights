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
        
        startButton.layer.cornerRadius = 10
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
    
        startButton.setTitle("NEXT", for: .normal)
        
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

