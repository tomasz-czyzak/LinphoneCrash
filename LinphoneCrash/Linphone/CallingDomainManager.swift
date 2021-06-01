//
//  CallingDomainManager.swift
//  LinphoneCrash
//
//  Created by Tomasz Czyżak on 05/05/2021.
//

import Foundation
import linphonesw
import FirebaseAnalytics

class CallingDomainManager {
    var linphoneCore: Core?
    let linphoneCoreManager: LinphoneCoreManager
    var iterateTimer: Timer?

    init() {
        LinphoneLogManager.startDetailedLogging()
        linphoneCore = try? Factory.Instance.createCore(configPath: "", factoryConfigPath: "", systemContext: nil)
        linphoneCoreManager = LinphoneCoreManager()
        linphoneCore?.addDelegate(delegate: linphoneCoreManager)
    }

    deinit {
        print("DEINIT: Calling domain manager")
        linphoneCore?.removeDelegate(delegate: linphoneCoreManager)
        LinphoneLogManager.endDetailedLogging()
    }

    func startCore(completion: ((Bool) -> Void)? = nil) {
        print("core.globalState:\(linphoneCoreManager.globalState)")
        if linphoneCoreManager.globalState == .Off {
            print("Starting Linphone Core")
            try? linphoneCore?.start()
            startIterateTimer()
            Analytics.logEvent("core_started", parameters: nil)
        } else {
            print("Linphone Core already started state:\(linphoneCoreManager.globalState)")
        }
    }

    func stopCore() {
        print("core.globalState:\(linphoneCoreManager.globalState)")
        if linphoneCoreManager.globalState == .On {
            print("Stopping Linphone Core")
            stopIterateTimer()
            linphoneCore?.stop()                // <- comment out to avoid "Message from debugger: Terminated due to signal 9"
            Analytics.logEvent("core_stopped", parameters: nil)
        } else {
            print("Linphone Core already stopped")
        }
    }

    private func startIterateTimer() {
        stopIterateTimer()
        print("Starting iterate timer")
        iterateTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { [weak self] _ in
            self?.linphoneCore?.iterate()
        })
    }

    private func stopIterateTimer() {
        if iterateTimer != nil {
            print("Stopping iterate timer")
            iterateTimer?.invalidate()
            iterateTimer = nil
        }
    }
}


