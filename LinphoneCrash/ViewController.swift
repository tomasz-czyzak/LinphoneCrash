//
//  ViewController.swift
//  LinphoneCrash
//
//  Created by Tomasz Czyżak on 05/05/2021.
//

import UIKit

class ViewController: UIViewController {

    var callingDomainManager: CallingDomainManager?

    @IBAction func initAction(_ sender: Any) {
        callingDomainManager = CallingDomainManager()
    }

    @IBAction func startAction(_ sender: Any) {
        callingDomainManager?.startCore()
    }

    @IBAction func stopAction(_ sender: Any) {
        callingDomainManager?.stopCore()
    }

    @IBAction func deinitAction(_ sender: Any) {
        callingDomainManager = nil
    }
}

