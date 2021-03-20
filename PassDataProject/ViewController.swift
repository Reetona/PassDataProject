//
//  ViewController.swift
//  PassDataProject
//
//  Created by Adele Fatkullina on 20.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
  //  performSegue Инициирует переход с указанным идентификатором из файла storyboard текущего view controller.

    @IBAction func loginTapped(_ sender: UIButton) {
        //is someValue == true {
        performSegue(withIdentifier: "detailSegue", sender: nil)
        //}else {
        //performSegue(withIdentifier: "detailSegue2", sender: nil) }
    }
    
    //vozvrat s peredachey informacii
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.resultLabel.text = svc.label.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 //Уведомляет view controller о том, что скоро будет выполнен переход. срабатывает при нажатии на сегвэй
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = loginTF.text
    }

}

