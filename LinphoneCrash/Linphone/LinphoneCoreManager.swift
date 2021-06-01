//
//  LinphoneCoreManager.swift
//  LinphoneCrash
//
//  Created by Tomasz Czyżak on 01/06/2021.
//

import Foundation
import linphonesw

class LinphoneCoreManager: CoreDelegate {

    var globalState: GlobalState = .Off

    func onGlobalStateChanged(core _: Core, state: GlobalState, message _: String) {
        print("GLOBAL STATE CHANGED:\(state)")
        globalState = state
    }

    func onRegistrationStateChanged(core _: Core, proxyConfig _: ProxyConfig, state: RegistrationState, message _: String) {
        print("REGISTRATION STATE CHANGED:\(state)")
    }
}
