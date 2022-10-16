//
//  AddAllViews.swift
//  DailyChallenge
//
//  Created by Chris Kim on 10/16/22.
//

import Foundation
import UIKit
import SnapKit
import Then


extension ViewController {
    
    /// Add All Custom Views To SuperView
    func addAllViews() {
        let titleStackView = generateTitleStackView()
        self.view.addSubview(titleStackView)
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        let loginStackView = generateLoginStackView()
        self.view.addSubview(loginStackView)
        
        loginStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleStackView.snp.bottom).offset(110)
            $0.leading.equalToSuperview().offset(30)
        }
        
        let findButtonStackView = generatefindButtonStackView()
        self.view.addSubview(findButtonStackView)
        
        findButtonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginStackView.snp.bottom).offset(20)
        }
        
        let emailColor = UIColor(red: 85 / 255, green: 85 / 255, blue: 85 / 255, alpha: 1)
        let emailLoginContainerView = generateSnsLoginButtonContainerView(title: "이메일로 가입",
                                                                          textColor: .white,
                                                                          font: .boldSystemFont(ofSize: 16),
                                                                          image: nil,
                                                                          bgColor: emailColor)
        let kakaoLoginContainerView = generateSnsLoginButtonContainerView(title: "카카오 시작하기",
                                                                          image: UIImage(named: "Kakao"),
                                                                          bgColor: .systemYellow)
        let googleLoginContainerView = generateSnsLoginButtonContainerView(title: "구글 시작하기",
                                                                           image: UIImage(named: "Google"),
                                                                           bgColor: .white)
        
        let naverColor = UIColor(red: 113 / 255, green: 198 / 255, blue: 92 / 255, alpha: 1)
        let naverLoginContainerView = generateSnsLoginButtonContainerView(title: "네이버 시작하기",
                                                                          textColor: .white,
                                                                          image: UIImage(named: "Naver"),
                                                                          bgColor: naverColor)
        
        let snsLoginStackView = UIStackView().then {
            $0.addArrangedSubview(emailLoginContainerView)
            $0.addArrangedSubview(kakaoLoginContainerView)
            $0.addArrangedSubview(googleLoginContainerView)
            $0.addArrangedSubview(naverLoginContainerView)
            
            $0.spacing = 12
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.view.addSubview(snsLoginStackView)
        
        snsLoginStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findButtonStackView.snp.bottom).offset(68)
            $0.leading.equalToSuperview().offset(30)
        }
    }
}




extension ViewController {
    
    /// Create Title StackView
    ///
    /// - Returns: Title StackView
    fileprivate func generateTitleStackView() -> UIStackView {
        
        let titleLabel = UILabel().then {
            $0.text = "Figma"
            $0.font = UIFont.boldSystemFont(ofSize: 30)
            $0.textColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let titleImageView = UIImageView().then {
            $0.image = UIImage(named: "Figma")
            $0.contentMode = .scaleAspectFit
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleImageView.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        let titleStackView = UIStackView().then {
            $0.addArrangedSubview(titleImageView)
            $0.addArrangedSubview(titleLabel)
            
            $0.spacing = 8
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .fill
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        return titleStackView
    }
    
    
    /// Crerate Login StackView
    ///
    /// - Returns: Login StackView
    fileprivate func generateLoginStackView() -> UIStackView {
        
        // MARK: - Create Id, Password TextField Stack View
        
        let textFieldColor = UIColor(red: 97 / 255, green: 97 / 255, blue: 97 / 255, alpha: 1)
        let idTextField = UITextField().then {
            $0.text = "아이디 입력"
            $0.font = UIFont.systemFont(ofSize: 18)
            $0.borderStyle = .none
            $0.textColor = textFieldColor
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let separationViewColor = UIColor(red: 54 / 255, green: 54 / 255, blue: 54 / 255, alpha: 1)
        
        let idRextFieldSeparationView = UIView().then {
            $0.backgroundColor = separationViewColor
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        idRextFieldSeparationView.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        let passwordRextFieldSeparationView = UIView().then {
            $0.backgroundColor = separationViewColor
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        passwordRextFieldSeparationView.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        let passwordTextField = UITextField().then {
            $0.text = "비밀번호 입력"
            $0.font = .systemFont(ofSize: 18)
            $0.borderStyle = .none
            $0.textColor = textFieldColor
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let textFieldStackView = UIStackView().then {
            $0.addArrangedSubview(idTextField)
            $0.addArrangedSubview(idRextFieldSeparationView)
            $0.addArrangedSubview(passwordTextField)
            $0.addArrangedSubview(passwordRextFieldSeparationView)
            
            $0.spacing = 18
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        // MARK: - Create Login Button
        
        let loginButtonColor = UIColor(red: 250 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
        let loginTitleColor = UIColor(red: 92 / 255, green: 92 / 255, blue: 92 / 255, alpha: 1)
        
        let loginButton = UIButton().then {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(loginTitleColor, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20)
            $0.backgroundColor = loginButtonColor
            $0.layer.cornerRadius = 8
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        let loginStackView = UIStackView().then {
            $0.addArrangedSubview(textFieldStackView)
            $0.addArrangedSubview(loginButton)
            
            $0.spacing = 20
            $0.alignment = .fill
            $0.distribution = .fill
            $0.axis = .vertical
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        return loginStackView
    }
    
    
    /// Create Find Button StackView
    ///
    /// - Returns: Find Button StackView
    fileprivate func generatefindButtonStackView() -> UIStackView {
        // MARK: - Create Find Button
        
        let findButtonColor = UIColor(red: 215 / 255, green: 215 / 255, blue: 215 / 255, alpha: 1)
        let findIdButton = UIButton().then {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(findButtonColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            $0.backgroundColor = .clear
            $0.contentHorizontalAlignment = .right
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let findSeparationView = UIView().then {
            $0.backgroundColor = findButtonColor
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        findSeparationView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        let findPasswordButton = UIButton().then {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(findButtonColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            $0.backgroundColor = .clear
            $0.contentHorizontalAlignment = .left
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let findButtonStackView = UIStackView().then {
            $0.addArrangedSubview(findIdButton)
            $0.addArrangedSubview(findSeparationView)
            $0.addArrangedSubview(findPasswordButton)
            
            $0.spacing = 10
            $0.alignment = .fill
            $0.distribution = .fill
            $0.axis = .horizontal
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        return findButtonStackView
    }
    
    
    // MARK: - Create SNS Login Container View
    
    /// Create SNS Login Button Container View
    ///
    /// - Parameters:
    ///   - title: Login Button Title
    ///   - textColor: Button Text Coloe
    ///   - font: Button Title Font
    ///   - image: Button Image
    ///   - bgColor: Container View Background Color
    /// - Returns: SNS Login Button Container View
    fileprivate func generateSnsLoginButtonContainerView(title: String,
                                                         textColor: UIColor = .black,
                                                         font: UIFont = .systemFont(ofSize: 16),
                                                         image: UIImage? = nil,
                                                         bgColor: UIColor = .systemGray3) -> UIView {
        
        // MARK: - Create SNS Login Button View
        
        let imageView = UIImageView().then {
            $0.image = image
            $0.contentMode = .scaleAspectFit
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = textColor
            $0.font = font
            $0.contentMode = .scaleAspectFit
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let loginContainerView = UIView().then {
            $0.addSubview(imageView)
            $0.addSubview(titleLabel)
            
            $0.backgroundColor = bgColor
            $0.layer.cornerRadius = 8
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        loginContainerView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(48)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(21)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(27)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        return loginContainerView
    }
}
