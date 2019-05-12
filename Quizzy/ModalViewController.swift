//
//  ModalViewController.swift
//  Quizzy
//
//  Created by Bruno Pastre on 11/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBAction func onBlurPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onRestartPressed(_ sender: Any) {
        PerguntaProvider.instance.setupSingleton()
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
