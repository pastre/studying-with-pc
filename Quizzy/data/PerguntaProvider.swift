//
//  Singleton.swift
//  Quizzy
//
//  Created by Bruno Pastre on 08/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import Foundation

class PerguntaProvider{
    
    static let instance: PerguntaProvider = PerguntaProvider()
    var nRounds: Int! = 0
    var nQuestions: Int! = 10
    
    var perguntas: [Pergunta] = {
        
        var perguntas:[Pergunta] = [Pergunta]()
//        let titulos: [String] = ["a", "b", "c", "d"]
//        let respostas: [[String]] = [["a", "b", "c", "d"], ["a1", "b1", "c1", "d1"], ["a2", "b2", "c2", "d2"], ["a3", "b3", "c3", "d3"], ]
    
        if let path = Bundle.main.path(forResource: "perguntas", ofType: "json") { // TODO: Mudar esse nome
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let dicts = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
                for anyDict in dicts{
                    let dict = anyDict as! [String : Any]
                    let toAppend = Pergunta(titulo: dict["titulo"] as! String, respostas: dict["respostas"] as! [String], rightIndex: dict["rightIndex"] as! Int)
                    perguntas.append(toAppend)
                }
            } catch let error{
                print("Error loading movies", error)
                // handle error
            }
        }
        return perguntas
    }()
    
    var jaMostrou: [Pergunta]!
    var aindaNaoMostrou: [Pergunta]!
    var acertadas: Int!
    
    private init(){
        self.setupSingleton()
    }
    
    func getPergunta() -> Pergunta?{
        if self.aindaNaoMostrou.count == 0{
            return nil
        }
        let ret = self.aindaNaoMostrou.randomElement()!
        self.jaMostrou.append(ret)
        
        for (i, p) in self.aindaNaoMostrou.enumerated(){ // TODO pesquisar como fazer isso sem for, deve ter algum metodo dentro das listas
            if p.titulo == ret.titulo{
                self.aindaNaoMostrou.remove(at: i)
                break
            }
        }
        
        return ret
    }
    
    func setupSingleton(){
        self.perguntas.shuffle()
        let mult = nRounds * nQuestions
        let cut = nQuestions + mult - 1
        print("Mult", mult, "Cut", cut)
        self.jaMostrou = [Pergunta]()
        self.acertadas = 0
        self.aindaNaoMostrou = Array(self.perguntas[mult...cut])
        print(aindaNaoMostrou.count)
        // Colocar coisas que podem ser legais aqui
        
    }
    
}
