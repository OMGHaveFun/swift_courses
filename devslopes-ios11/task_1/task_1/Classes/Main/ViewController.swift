//
//  Copyright © 2017 HaveFun. All rights reserved.
//

import UIKit
import AVFoundation

let audioPlayerVolume: Float = 0.2
let audioPlayerFadeDuration = 0.5
let audioPlayerPlayDuration = 4.0
let rocketFlightDistance: CGFloat = 100.0

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var rocketView: UIView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketBottomConstraint: NSLayoutConstraint!
    
    var audioPlayer: AVAudioPlayer!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        initAudioWithUrl(url)
    }
    
    // MARK: - Actions
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        self.rocketView.isHidden = false
        audioPlayer.play()
        animateRocket()
    }
    
    // MARK: - Private Methods
    
    func initAudioWithUrl(_ url: URL) {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            self.audioPlayer.setVolume(audioPlayerVolume, fadeDuration: audioPlayerFadeDuration)
            self.audioPlayer.prepareToPlay()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    
    func animateRocket() {
        UIView.animate(
            withDuration: audioPlayerPlayDuration,
            animations: {
                self.rocketBottomConstraint.constant = rocketFlightDistance
                self.rocketView.layoutIfNeeded()
        },
            completion: { finished in
                print("Nuclear launch detected! (c)starcraft")
        })
    }
}

