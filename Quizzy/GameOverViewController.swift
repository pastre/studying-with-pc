//
//  GameOverViewController.swift
//  Quizzy
//
//  Created by Bruno Pastre on 11/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    let provider: PerguntaProvider = PerguntaProvider.instance
    var perguntaViewController: PerguntaViewController!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var frasePcLabel: UILabel!
    @IBOutlet weak var playAgainBtt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let score = self.provider.acertadas!
        let max = self.provider.nQuestions!
        var frasePc, fraseBtt: String!
        
        self.scoreLabel.text = "\(score)/\(max)"
        
        if score < 4 {
            frasePc = "Uh oh, maybe we need to study a little more. Would you let me help you? I'm sure you can do better!"
            fraseBtt = "Alright"
        } else if score < 7{
            frasePc = "You did alright, but I believe you can do better! Let me help you study a little more?"
            fraseBtt = "Ok"
        }else{
            frasePc = "Awesome! You answered \(score == 10 ? "" : "almost") all of the questions correctly! That was fun, wanna try again?"
            fraseBtt = "Sure!"
        }
        
        self.frasePcLabel.text = frasePc
        self.playAgainBtt.setTitle(fraseBtt, for: .normal)
        
    }
    
    @IBAction func onReplayPressed(_ sender: Any) {
        
        if self.provider.hasMoreQuestions(){
            self.dismiss(animated: true, completion: nil)
            self.provider.updateRound()
            self.perguntaViewController.updateQuestion()
            
        }else{
            self.provider.setupSingleton()
            self.performSegue(withIdentifier: "modal", sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
