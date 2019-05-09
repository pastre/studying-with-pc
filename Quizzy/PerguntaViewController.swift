//
//  PerguntaViewController.swift
//  Quizzy
//
//  Created by Bruno Pastre on 08/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class PerguntaViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var option1View: RoundedView!
    @IBOutlet weak var option2View: RoundedView!
    @IBOutlet weak var option3View: RoundedView!
    @IBOutlet weak var option4View: RoundedView!
    
    let provider: PerguntaProvider = PerguntaProvider.instance
    var currentQuestion: Pergunta!
//    lazy var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
    
    override func viewDidLoad() {
        print("ASDADSADASDSDDS")
        super.viewDidLoad()
        print("ASDADSADASDSDDS")
        self.setupViews()
        self.updateQuestion()
        // Do any additional setup after loading the view.
    }
    

    func updateQuestion(){
        guard let newQuestion = self.provider.getPergunta() else{
            self.performSegue(withIdentifier: "onFinished", sender: nil)
            return
        }
        
        self.currentQuestion = newQuestion
        self.updateView()
//        self.view.setNeedsLayout()
    }
    
    func updateView(){
//        self.questionImage.image = self.currentQuestion.
        self.questionLabel.text = self.currentQuestion.titulo
        let respostas = self.currentQuestion.respostas!
        
        option1View.titleLabel.text = respostas[0]
        option2View.titleLabel.text = respostas[1]
        option3View.titleLabel.text = respostas[2]
        option4View.titleLabel.text = respostas[3]
//        if self.stackView.arrangedSubviews.count != 0{
//            self.clearStackView()
//        }
//
//        for (i, option) in options.enumerated(){
//            let view = OptionView(number: i, title: option)
//            self.stackView.addArrangedSubview(view)
//        }
    }
    
    
    func setupViews(){
        self.option1View.viewController = self
        self.option2View.viewController = self
        self.option3View.viewController = self
        self.option4View.viewController = self
        
    }
    
    
    
    
    func handleOptionChanged(_ option: Int){
        print("New option is ", option)
        if self.currentQuestion.rightIndex == option{
            // acertou
            
        }else{
//            errou
        }
        
        self.updateQuestion()
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
