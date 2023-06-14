//
//  ViewController.swift
//  TicTacToe
//
//  Created by Akanksha Pakhale on 02/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var turnLbl: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    enum Turn{
        case Nought
        case Cross
    }
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    var noughtScore = 0
    var crossScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initBoard()
    }
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkForVictory(CROSS)
        {
            crossScore += 1
            resultAlert(title: "Cross Win")
        }
        if checkForVictory(NOUGHT){
            noughtScore += 1
            resultAlert(title: "Nought Win")
        }
        if (fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    func resultAlert (title: String){
        let message = "\nNoughts" + String(noughtScore) + "\n\nCrosses" + String(crossScore)
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Rest", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    func checkForVictory(_ s :String) -> Bool{
        //Horizontal victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        //Vertical victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        //Diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        return false
    }
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
        
    }
    func resetBoard(){
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought{
            firstTurn = Turn.Cross
            turnLbl.text = CROSS
        }
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            turnLbl.text = NOUGHT
        }
         currentTurn = firstTurn
    }
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    func fullBoard() -> Bool{
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    func addToBoard(_ sender: UIButton){
        if (sender.title(for: .normal) == nil){
            if (currentTurn == Turn.Nought)
            {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLbl.text = CROSS
            } else if (currentTurn == Turn.Cross)
            {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLbl.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }

}

