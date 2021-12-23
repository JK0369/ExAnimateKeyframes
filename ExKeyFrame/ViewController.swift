//
//  ViewController.swift
//  ExKeyFrame
//
//  Created by Jake.K on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
  enum Time {
    typealias KeyFrameAnimationTime = (relativeStartTime: Double, relativeDuration: Double)
    
    static let animationDurationSeconds = 2.0
    static let firstAnimation: KeyFrameAnimationTime = (0.0 / 4.0, 1.0 / 4.0)
    static let secondAnimation: KeyFrameAnimationTime = (1.0 / 4.0, 1.0 / 4.0)
    static let thirdAnimation: KeyFrameAnimationTime = (2.0 / 4.0, 1.0 / 4.0)
    static let forthAnimation: KeyFrameAnimationTime = (3.0 / 4.0, 1.0 / 4.0)
  }
  
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("애니메이션", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    return button
  }()
  
  private let sampleView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.button)
    self.view.addSubview(self.sampleView)
    
    self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    
    self.button.translatesAutoresizingMaskIntoConstraints = false
    self.sampleView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
      self.button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      self.button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      
      self.sampleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.sampleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.sampleView.widthAnchor.constraint(equalToConstant: 320),
      self.sampleView.heightAnchor.constraint(equalToConstant: 240)
    ])
  }
  
  @objc private func didTapButton() {
    UIView.animateKeyframes(
      withDuration: Time.animationDurationSeconds,
      delay: 0,
      animations: {
        UIView.addKeyframe(
          withRelativeStartTime: Time.firstAnimation.relativeStartTime,
          relativeDuration: Time.firstAnimation.relativeDuration,
          animations: self.animateDownsize
        )
        
        UIView.addKeyframe(
          withRelativeStartTime: Time.secondAnimation.relativeStartTime,
          relativeDuration: Time.secondAnimation.relativeDuration,
          animations: self.animateUpsize
        )
        
        UIView.addKeyframe(
          withRelativeStartTime: Time.thirdAnimation.relativeStartTime,
          relativeDuration: Time.thirdAnimation.relativeDuration,
          animations: self.animateFadeOut
        )
        
        UIView.addKeyframe(
          withRelativeStartTime: Time.forthAnimation.relativeStartTime,
          relativeDuration: Time.forthAnimation.relativeDuration,
          animations: self.animateFadeIn
        )
      },
      completion: nil
    )
  }
  
  private func animateDownsize() {
    self.sampleView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
  }

  private func animateUpsize() {
    self.sampleView.transform = .identity
  }

  private func animateFadeOut() {
    self.sampleView.alpha = 0
  }

  private func animateFadeIn() {
    self.sampleView.alpha = 1
  }
}
