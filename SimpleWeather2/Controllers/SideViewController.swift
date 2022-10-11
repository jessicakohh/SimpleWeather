//
//  SideViewController.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/10.
//

import UIKit
import MessageUI
import SafariServices

class SideViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func privateButtonTapped(_ sender: UIButton) {
        let notionUrl = NSURL(string: "https://jesskoh.notion.site/da105d9ec45b4d0ca12d23be4c605dd5")
        let notionSafariView: SFSafariViewController = SFSafariViewController(url: notionUrl as! URL)
        self.present(notionSafariView, animated: true, completion: nil)
    }
    
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        let notionUrl = NSURL(string: "https://jesskoh.notion.site/Simple-Weather-bcfb2ba96fdb48388f1d3a8886806d79")
        let notionSafariView: SFSafariViewController = SFSafariViewController(url: notionUrl as! URL)
        self.present(notionSafariView, animated: true, completion: nil)
    }
    
}


// MARK: - 문의하기

extension SideViewController: MFMailComposeViewControllerDelegate {
    
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) {
            (action) in
            print("확인")
        }
        sendMailErrorAlert.addAction(confirmAction)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        // 이메일 사용가능한지 체크하는 if문
        if MFMailComposeViewController.canSendMail() {
            
            let compseVC = MFMailComposeViewController()
            compseVC.mailComposeDelegate = self
            
            compseVC.setToRecipients(["본 메일을 전달받을 이메일 주소"])
            compseVC.setSubject("문의 제목")
            compseVC.setMessageBody("문의 내용", isHTML: false)
            
            self.present(compseVC, animated: true, completion: nil)
            
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}

