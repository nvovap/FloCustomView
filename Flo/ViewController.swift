//
//  ViewController.swift
//  Flo
//
//  Created by Vladimir Nevinniy on 9/26/17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    
    //Label outlets
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var isGraphViewShowing = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
    }

    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer?) {
        
        if isGraphViewShowing {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
        isGraphViewShowing = !isGraphViewShowing
        
    }
    

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if isGraphViewShowing {
            counterViewTap(nil)
        }
        
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        
        counterLabel.text = String(counterView.counter)
    }
    
}

