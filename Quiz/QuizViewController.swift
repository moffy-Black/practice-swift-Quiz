//
//  QuizViewController.swift
//  Quiz
//
//  Created by Koki Kurokawa on 2021/06/24.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var nameText: String = ""
    @IBOutlet weak var quizCard: QuizCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.quizCard.style = .initial
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action:  #selector(dragQuizCard(_:)))
        self.quizCard.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func dragQuizCard(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            self.transformQuizCard(gesture: sender)
        case .ended:
            break
        default:
            break
        }
    }
    func transformQuizCard(gesture: UIPanGestureRecognizer) {
//        移動した距離を取得
        let translation = gesture.translation(in: self.quizCard)
//        移動した距離をもとにCGAffineTransformオブジェクトを作成
        let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)
//        画面の幅を半分に対する移動した距離の割合
        let translationPercent = translation.x/UIScreen.main.bounds.width/2
//        割合に対して角度を算出
        let rotationAngle = CGFloat.pi/3 * translationPercent
//        算出した角度でのCGffineTransformオブジェクトを作成
        let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)
//        変数のオブジェクトを合成
        let transform = translationTransform.concatenating(rotationTransform)
        self.quizCard.transform = translationTransform
        
        if translation.x > 0 {
            self.quizCard.style = .right
        } else {
            self.quizCard.style = .wrong
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
