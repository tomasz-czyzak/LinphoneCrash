//
//  LinphoneLogManager.swift
//  LinphoneCrash
//
//  Created by Tomasz Czyżak on 01/06/2021.
//

import Foundation
import linphonesw

class LinphoneLogManager: LoggingServiceDelegate {

    private static let shared = LinphoneLogManager()
    private static let logService = LoggingService.Instance
    static let logFilePrefix = "LINPHONE"

    func onLogMessageWritten(logService _: LoggingService, domain _: String, level _: LogLevel, message: String) {
        print("\(LinphoneLogManager.logFilePrefix):\(message)")
    }

    static func startDetailedLogging() {
        logService.logLevel = .Debug
        logService.addDelegate(delegate: LinphoneLogManager.shared)
    }

    static func endDetailedLogging(userDefaults: UserDefaults = UserDefaults.standard) {
        logService.removeDelegate(delegate: LinphoneLogManager.shared)
    }

}
