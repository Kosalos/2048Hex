import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonA(_ sender: UIButton) { game.keyDown("A") }
    @IBAction func buttonS(_ sender: UIButton) { game.keyDown("S") }
    @IBAction func buttonQ(_ sender: UIButton) { game.keyDown("Q") }
    @IBAction func buttonW(_ sender: UIButton) { game.keyDown("W") }
    @IBAction func buttonZ(_ sender: UIButton) { game.keyDown("Z") }
    @IBAction func buttonX(_ sender: UIButton) { game.keyDown("X") }
    @IBAction func buttonUndo(_ sender: UIButton) { game.undo() }
    @IBAction func buttonNewGame(_ sender: UIButton) { game.keyDown(" ")  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.newGame()
        Timer.scheduledTimer(withTimeInterval:0.05, repeats:true) { timer in self.timerHandler() }
    }
    
    @objc func timerHandler() {
        game.timerHandler()
    }
}

