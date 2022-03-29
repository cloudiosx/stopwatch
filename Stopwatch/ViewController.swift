//
//  ViewController.swift
//  Stopwatch
//
//  Created by John Kim on 3/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    
    var seconds = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        
        if let _ = timer {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        stopTimer()
        updateSeconds(0)
    }
    
    private func startTimer() {
        startStopButton.setTitle("Stop", for: .normal)

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateSeconds(self.seconds + 1)
        })
    }
    
    private func stopTimer() {
        startStopButton.setTitle("Start", for: .normal)
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSeconds(_ seconds: Int) {
        print("UPDATE \(seconds)")
        
        self.seconds = seconds
        
        let s = seconds % 60
        secondsLabel.text = String(format: "%02d", s)
        
        let m = seconds / 60
        minutesLabel.text = String(format: "%02d", m)
    }
}
