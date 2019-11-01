//
//  ViewController.swift
//  Local-Notifications-Lab
//
//  Created by Ian Cervone on 10/29/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  lazy var timer: UIDatePicker = {
    let picker = UIDatePicker()
    return picker
  }()
  
  let message: UITextView = {
    let tf = UITextView()
    tf.layer.borderWidth = 1
    tf.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    tf.backgroundColor = .red
    tf.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
    tf.text = "enter reminder message here"
    
    return tf
  }()
  
  let launchButton: UIButton = {
    let button = UIButton()
    button.setTitle("Add Reminder", for: .normal)
    button.layer.cornerRadius = 6
    button.backgroundColor = .systemBlue
    button.addTarget(self, action: #selector(launchButtonPressed), for: .touchUpInside)
    return button
  }()
  
  @objc func launchButtonPressed() {
    guard let title = message.text else {
      errorAlert(title: "Missing Info" , message: "Must enter a message")
      return }
//    let newReminder = 
      
    }
  
  
  private func errorAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(cancel)
    present(alert, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .red
    message.delegate = self
    addSubviews()
    setConstraints()
    
  }

  private func addSubviews() {
      self.view.addSubview(timer)
      self.view.addSubview(message)
      self.view.addSubview(launchButton)
  }
  
  private func setConstraints() {
      timerConstraints()
      messageConstraints()
      launchButtonConstraints()
  }
  
  private var timerTopConstraint = NSLayoutConstraint()
//  private var timerBottomConstraint = NSLayoutConstraint()

  
  private func timerConstraints() {
      timer.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          timer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          timer.heightAnchor.constraint(equalToConstant: 300),
          timer.widthAnchor.constraint(equalToConstant: 300)
      ])
      self.timerTopConstraint = timer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
    timerTopConstraint.isActive = true
  }

  private func messageConstraints() {
      message.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          message.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 50),
          message.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          message.heightAnchor.constraint(equalToConstant: 150),
          message.widthAnchor.constraint(equalToConstant: 300)
      ])
  }
//
  private func launchButtonConstraints() {
      launchButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        launchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        launchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        launchButton.heightAnchor.constraint(equalToConstant: 40),
        launchButton.widthAnchor.constraint(equalToConstant: 130)
      ])
  }
  
  
}



extension ViewController: UITextViewDelegate {
  func textFieldShouldReturn(_ textField: UITextView) -> Bool {
    message.resignFirstResponder()
    return true
  }
  func textViewDidBeginEditing(_ textField: UITextView) {
    message.text = ""
  }
}
