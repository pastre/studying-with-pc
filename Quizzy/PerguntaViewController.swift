//
//  PerguntaViewController.swift
//  Quizzy
//
//  Created by Bruno Pastre on 08/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class PerguntaViewController: UIViewController, OptionDelegate {
    func onOptionSelected(new option: Int!) { //
        self.optionsView.disableTouch()
        let pickedView = self.optionsView.views[option]
        let rightView = self.optionsView.views[self.currentQuestion.rightIndex]
        let acertou: Bool = option == self.currentQuestion.rightIndex
//        pickedView.animateRight()
        if acertou { self.provider.acertadas += 1 }
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            rightView.animateRight()
            if !acertou{
                pickedView.animateWrong()
            }
        }) { (_) in
            var rotationCount = 0
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn, .autoreverse], animations: {
                UIView.setAnimationRepeatCount(5)
                
                if acertou{
                    pickedView.transform = pickedView.transform.scaledBy(x: 1.2, y: 1.2)
                }else{
                    var mult: Double = rotationCount % 2 == 0 ? 32 : -32
                    pickedView.transform = rightView.transform.rotated(by: CGFloat(Double.pi/mult ))
                    rotationCount += 1
                }
                
            }, completion: { (_) in
                
                self.clearOptions()
                self.updateQuestion()
            })
        }
    }
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var optionsView: OptionsView!
    
    //    @IBOutlet weak var option1View: RoundedView!
//    @IBOutlet weak var option2View: RoundedView!
//    @IBOutlet weak var option3View: RoundedView!
//    @IBOutlet weak var option4View: RoundedView!
//
    let provider: PerguntaProvider = PerguntaProvider.instance
    var currentQuestion: Pergunta!
//    lazy var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupViews()
        self.updateQuestion()
        print("Loadou a view!")
        // Do any additional setup after loading the view.
    }
    

    func updateQuestion(){
        guard let newQuestion = self.provider.getPergunta() else{
            print("Deu ruim irmao")
            self.performSegue(withIdentifier: "onFinished", sender: nil)
            return
        }
        print("Got a new question", newQuestion)
        self.currentQuestion = newQuestion
        self.optionsView.questions = self.currentQuestion.respostas
        self.optionsView.updatePerguntas()
        self.updateView()
//        self.view.setNeedsLayout()
    }
    
    func clearOptions(){
        for view in self.optionsView.views{
            view.clear()
            UIView.animate(withDuration: 0.1, animations: {
                
                view.transform = .identity
            }) { (_) in
                print("Resetei as views")
            }
        }
        
        self.optionsView.enableTouch()
    }
    
    
    func updateView(){
        self.questionLabel.text = self.currentQuestion.titulo
    }
    
    
    func setupViews(){
        for view in self.optionsView.views{
            view.delegate = self
        }
//        self.option1View.viewController = self
//        self.option2View.viewController = self
//        self.option3View.viewController = self
//        self.option4View.viewController = self
        
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
