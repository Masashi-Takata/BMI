//
//  ViewController.swift
//  BMI
//
//  Created by Masashi Takata on 2018/03/30.
//  Copyright © 2018年 Masashi Takata. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController,UITextFieldDelegate {
    


    var bmi_coefficient = 22 //適正体重計算の係数
    @IBOutlet var yourBMI: UILabel!
    @IBOutlet weak var genderSelect: UISegmentedControl!
    @IBOutlet var writeWeight: UITextField!
    @IBOutlet var writeHeight: UITextField!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var yourBMIResult: UILabel!
    @IBOutlet weak var yourBMIResultText: UILabel!
    @IBOutlet weak var bodyStyleResultText: UILabel!
    @IBOutlet weak var correctWeight: UILabel!
    @IBOutlet weak var correctWeightText: UILabel!
    @IBOutlet weak var talentImage: UIImageView!
    @IBOutlet weak var talentText: UILabel!
    var yabeImage = UIImage(named:"yabe")!
    var kiritaniImage = UIImage(named:"kiritani")!
    var kitagawaImage = UIImage(named:"kitagawa")!
    var amuroImage = UIImage(named:"amuro")!
    var hukiisiImage = UIImage(named:"hukiisi")!
    var ayaseImage = UIImage(named:"ayase")!
    var nishikawaImage = UIImage(named:"nishikawa")!
    var ooshimaImage = UIImage(named:"ooshima")!
    var wakkimaImage = UIImage(named:"wakki")!
    var watanabeImage = UIImage(named:"watanabe")!
    var kurosawaImage = UIImage(named:"kurosawa")!
    var yashiroImage = UIImage(named:"yashiro")!
    var matukoImage = UIImage(named:"matuko")!
    var hikomaroImage = UIImage(named:"hikomaro")!
    var ishizukaImage = UIImage(named:"ishizuka")!
    var kennkobaImage = UIImage(named:"kennkoba")!
    
    @IBAction func calculation(_ sender: Any) {
        yourBMIResult.isHidden = false  //あなたのBMIはを表示
        correctWeight.isHidden = false  //あなたの適正体重はを表示
        //ここにchangeボタンが押された時の処理
        let weight = Double(writeWeight.text!)!
        let height = Double(writeHeight.text!)!
        
        let bmi = weight / (height/100) / (height/100)
        
        let weightResult = (height/100) * (height/100) * Double(bmi_coefficient)
        let weightDifference = weight-weightResult
        
        if (Double(bmi) < 18.5) {
            bodyStyleResultText.text = "あなたはやせ体型です"
            bodyStyleResultText.textColor = UIColor.blue
            if (Double(bmi) < 14.51 && genderSelect.selectedSegmentIndex == 0) {
            talentImage.image = yabeImage
            talentText.text = "あなたの体型はカラテカ矢部です"
            } else if(Double(bmi) < 14.51 && genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = kiritaniImage
                talentText.text = "あなたの体型は桐谷美玲です"
            } else if (Double(bmi) > 14.51 && Double(bmi) <= 15.51 && genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = yabeImage
                talentText.text = "あなたの体型はカラテカ矢部です"
            } else if (Double(bmi) > 14.51 && Double(bmi) <= 15.51 && genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = kitagawaImage
                talentText.text = "あなたの体型は北川景子です"
            } else if (Double(bmi) > 15.51 && Double(bmi) <= 16.51 && genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = yabeImage
                talentText.text = "あなたの体型はカラテカ矢部です"
            } else if (Double(bmi) > 15.51 && Double(bmi) <= 16.51 && genderSelect.selectedSegmentIndex == 1) {
            talentImage.image = amuroImage
            talentText.text = "あなたの体型は安室奈美恵です"
            } else if (Double(bmi) > 16.51 && Double(bmi) <= 17.51 && genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = yabeImage
                talentText.text = "あなたの体型はカラテカ矢部です"
            } else if (Double(bmi) > 16.51 && Double(bmi) <= 17.51 && genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = hukiisiImage
                talentText.text = "あなたの体型は吹石一恵です"
            } else if (Double(bmi) > 17.51 && genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = ayaseImage
                talentText.text = "あなたの体型は綾瀬はるかです"
            } else if (Double(bmi) > 17.51 && genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = nishikawaImage
                talentText.text = "あなたの体型は西川貴教です"
            }
        } else if (18.5 <= Double(bmi) && Double(bmi) < 25){
            bodyStyleResultText.text = "あなたは標準体型です"
            bodyStyleResultText.textColor = UIColor.green
            if (genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = wakkimaImage
                talentText.text = "あなたの体型はペナルティーワッキーです"
            } else if(genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = ooshimaImage
                talentText.text = "あなたの体型は大島優子です"
            }
        } else if (25 <= Double(bmi) && Double(bmi) < 30){
            bodyStyleResultText.text = "あなたは肥満度１体型です"
            bodyStyleResultText.textColor = UIColor.magenta
            if (genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = kennkobaImage
                talentText.text = "あなたの体型はケンドーコバヤシです"
            } else if(genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = kurosawaImage
                talentText.text = "あなたの体型は黒澤かずこです"
            }
        } else if (30 <= Double(bmi) && Double(bmi) < 35){
            bodyStyleResultText.text = "あなたは肥満度2体型です"
            bodyStyleResultText.textColor = UIColor.yellow
            if (genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = hikomaroImage
                talentText.text = "あなたの体型は彦摩呂です"
            } else if(genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = yashiroImage
                talentText.text = "あなたの体型はやしろ優です"
            }
        } else if (35 <= Double(bmi) && Double(bmi) < 40){
            bodyStyleResultText.text = "あなたは肥満度3体型です"
            bodyStyleResultText.textColor = UIColor.orange
            if (genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = ishizukaImage
                talentText.text = "あなたの体型は石塚英彦です"
            } else if(genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = watanabeImage
                talentText.text = "あなたの体型は渡辺直美です"
            }
        } else if (40 <= Double(bmi)){
            bodyStyleResultText.text = "あなたは肥満度4体型です"
            bodyStyleResultText.textColor = UIColor.red
            if (genderSelect.selectedSegmentIndex == 0) {
                talentImage.image = matukoImage
                talentText.text = "あなたの体型はマツコデラックスです"
            } else if(genderSelect.selectedSegmentIndex == 1) {
                talentImage.image = matukoImage
                talentText.text = "あなたの体型はマツコデラックスです"
            }
        }
        
        yourBMIResultText.text = String(format: "%.2f", bmi)  //小数点指定
        
        correctWeightText.text = String(format: "%.2f(適正体重との差 %.2fkg)", weightResult,weightDifference)
        view.endEditing(true)  //キーボードを非表示
    }
    
    //性別選択
    @IBAction func genderSelectResult(_ sender: Any) {
        //セグメント番号で条件分岐させる
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            bmi_coefficient = 22  //男性の場合
            self.view.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        case 1:
            bmi_coefficient = 21  //女性の場合
            self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        default:
           bmi_coefficient = 22  //デフォルト
        }
    }
    
    @IBAction func shareTwitter(_ sender: Any) {
        let shareText = talentText.text
        let shareImage = talentImage.image
        
        let shareItems = [shareText,"#NAIST","#ユビ研",shareImage] as [Any]
        
        let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityType.postToWeibo,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print,
            UIActivityType.copyToPasteboard,
            UIActivityType.airDrop,
            UIActivityType.assignToContact,
            UIActivityType.addToReadingList,
            UIActivityType.mail,
            UIActivityType.message
        ]
        avc.excludedActivityTypes = excludedActivityTypes
        
        present(avc, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        
        //SwiftでUITextFieldのキーボードを数字入力だけにする
        self.writeWeight.keyboardType = UIKeyboardType.numberPad
        self.writeHeight.keyboardType = UIKeyboardType.numberPad
        
        calculationButton.isHidden = true  //計算ボタン非表示
        yourBMIResult.isHidden = true  
        correctWeight.isHidden = true
        
        // 入力値が変更された時に呼ばれる通知を登録
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didChangeNotification(notification:)),
            name: NSNotification.Name.UITextFieldTextDidChange,
            object: nil
        )
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 計算ボタンの表示/非表示設定(体重と身長が入力されたら)
    @objc func didChangeNotification(notification: Notification) {
        
        guard let _ = notification.object as? UITextField,
            let textWeight = writeWeight.text,
            let textHeight = writeHeight.text,
            let _ = Int(textWeight), let _ = Int(textHeight)  else {
                // ボタンを非表示
                calculationButton.isHidden = true
                return
        }
        // 体重と身長に入力された文字列がIntに変換できる場合のみボタンを表示
        calculationButton.isHidden = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面タップで閉じる場合
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

