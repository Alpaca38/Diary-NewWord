//
//  NewWordViewController.swift
//  Diary+NewWord
//
//  Created by 조규연 on 5/17/24.
//

import UIKit

class NewWordViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var firstKeywordButton: UIButton!
    @IBOutlet var secondKeywordButton: UIButton!
    @IBOutlet var thirdKeywordButton: UIButton!
    @IBOutlet var fourthKeywordButton: UIButton!
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    // Array
    let newWords = ["분좋카","완내스","그잡채","H워얼V","700","빠태"]
    let newWordsExplains = ["'분위기 좋은 카페'의 줄임말입니다.","'완전 내 스타일'의 줄임말입니다.","'그 자체'를 소리나는 대로 적은 것입니다.","단어를 위아래로 뒤집어보면 '사랑해'가 됩니다.","'귀여워'에서 자음만 쓰면 ㄱㅇㅇ입니다. 이를 숫자로 바꿔서 700이라고 씁니다.","'빠른 태세 전환'의 줄임말입니다."]
    
    // Dictionary
    let newWordDic = [
        "분좋카":"'분위기 좋은 카페'의 줄임말입니다.",
        "완내스":"'완전 내 스타일'의 줄임말입니다.",
        "그잡채":"'그 자체'를 소리나는 대로 적은 것입니다.",
        "H워얼V":"단어를 위아래로 뒤집어보면 '사랑해'가 됩니다.",
        "700":"'귀여워'에서 자음만 쓰면 ㄱㅇㅇ입니다. 이를 숫자로 바꿔서 700이라고 씁니다.",
        "빠태":"'빠른 태세 전환'의 줄임말입니다."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        searchTextField.leftViewMode = .always
        searchTextField.placeholder = "신조어를 입력해주세요."
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 2
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        
        let buttons = [firstKeywordButton, secondKeywordButton, thirdKeywordButton, fourthKeywordButton]
        
        buttons.forEach {
            $0?.titleLabel?.font = .systemFont(ofSize: 12)
            $0?.layer.borderColor = UIColor.black.cgColor
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 5
        }
        
        showRandomCategory()
        
        resultImageView.image = .background
        resultImageView.contentMode = .scaleAspectFill
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        search()
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
        search()
    }
    
    @IBAction func firstKeywordButtonTapped(_ sender: UIButton) {
        let buttons = [firstKeywordButton,secondKeywordButton,thirdKeywordButton,fourthKeywordButton]
        keywordButtonTapped(button: buttons[sender.tag]!)
    }
    
    func keywordButtonTapped(button: UIButton) {
        searchTextField.text = button.currentTitle
        search()
        showRandomCategory()
    }
    
    func showRandomCategory() {
        let buttons = [firstKeywordButton,secondKeywordButton,thirdKeywordButton,fourthKeywordButton]
        
        //Array
//        let shuffledNewWords = newWords.shuffled()
        
        //Dictionary
        let shuffledNewWords = Array(newWordDic.keys).shuffled()
        
        
        for (index, button) in buttons.enumerated() {
            button?.setTitle("\(shuffledNewWords[index])", for: .normal)
        }
    }
    
    func search() {
        //Array
//        switch searchTextField.text {
//        case newWords[0]:
//            resultLabel.text = newWordsExplains[0]
//        case newWords[1]:
//            resultLabel.text = newWordsExplains[1]
//        case newWords[2]:
//            resultLabel.text = newWordsExplains[2]
//        case newWords[3]:
//            resultLabel.text = newWordsExplains[3]
//        case newWords[4]:
//            resultLabel.text = newWordsExplains[4]
//        case newWords[5]:
//            resultLabel.text = newWordsExplains[5]
//        default:
//            resultLabel.text = "검색결과가 없습니다."
//        }
        
        //Dictionary
        if let searchText = searchTextField.text, let result = newWordDic[searchText] {
            resultLabel.text = result
        } else {
            resultLabel.text = "검색결과가 없습니다."
        }
    }
}
