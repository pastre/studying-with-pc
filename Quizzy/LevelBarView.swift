//
//  LevelBarView.swift
//  Quizzy
//
//  Created by Bruno Pastre on 11/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

@IBDesignable
class LevelBarView: UIView {

    
    let provider: PerguntaProvider = PerguntaProvider.instance
//
    let views: [UIView] = {
        var levels: [UIView] = [UIView]()
        let nLevels = PerguntaProvider.instance.nQuestions!
        for i in 0...nLevels{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            view.translatesAutoresizingMaskIntoConstraints = false
            levels.append(view)
        }

        return levels
    }()
//
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
//        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }
    
    
    func commonInit(){
        print("I have", self.views.count)
//        self.setupLevels()
        
//        self.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    }
    
    func setupLevels(){
        let mult =  CGFloat(1)
        
//        let mult =  self.frame.width /  CGFloat(self.provider.getLevelCount())
        for view in self.views {
            self.addSubview(view)
        }
        
        for (i, view) in self.views.enumerated(){
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: mult).isActive = true
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: mult).isActive = true
            if i == 0{
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            }else{
                let prevView = self.views[i - 1]
                
                let spacing = (self.frame.width - (CGFloat(self.views.count) * views[0].frame.height) ) / self.frame.width
                
                print("Spacing is ", spacing)
                view.leftAnchor.constraint(equalTo: prevView.rightAnchor, constant: CGFloat(5)).isActive = true
            }

        }

        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
