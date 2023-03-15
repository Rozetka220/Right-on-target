//
//  SelectNumberViewController.swift
//  Rightandtarget_attempt2
//
//  Created by Аделия Исхакова on 14.03.2023.
//

import UIKit

class SelectNumberViewController: UIViewController {
    
    var gameNubmer: GameProtocol!
    
    
    @IBOutlet weak var secretNumberLabel: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameNubmer = GameNumbers()
        secretNumberLabel.text = String(gameNubmer.currentSecretValue)
        print("SelectNumber")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkButton(_ sender: Any) {
        let numSlider = Int(slider.value.rounded())
        if gameNubmer.isGameEnded {
            showAlert(score: gameNubmer.score)
            gameNubmer.restartGame()
        }
        else {
            gameNubmer.calculateScore(value: numSlider)
            gameNubmer.nextRound()
            secretNumberLabel.text = String(gameNubmer.currentSecretValue)
        }
    }
    
    private func showAlert(score: Int){
        let alert = UIAlertController(title: "Игра окончена!", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
}
