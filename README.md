# LinphoneCrash

1. clone repo
2. cd repo dir
3. pod install
4. open LinphoneCrash.xcworkspace
5. start app (device or simulator)
6. tap init 
7. tap start core
8. tap stop core
9. tap deinit
10. repeat step 6-8

# Results differs depend on xcode version...

## Xcode 12.5  
Application is killed by system and on console visible following message:
```
Message from debugger: Terminated due to signal 9
```
No crash log etc...


## Xcode 12.4
Immediatelly after first stop (step 8) console prints:
```
2021-06-02 09:45:00.538886+0200 LinphoneCrash[54760:21976374] [logging-persist] os_unix.c:44580: (0) open(/Users/tczyzak/Library/Developer/CoreSimulator/Devices/2FF0E54D-0692-4CD4-A17E-528564F67CAE/data/Containers/Data/Application/B6E55EC5-E66E-4C6E-8822-B269E234F72A/Library/Application Support/Google/Measurement/google-app-measurement.sql-journal) - Undefined error: 0
2021-06-02 09:45:00.539959+0200 LinphoneCrash[54760:21978299] 8.0.0 - [Firebase/Analytics][I-ACS023061] Data loss. Unable to update daily event counts. Name, error: core_stopped, Error Domain=com.google.gmp.measurement.ErrorDomain Code=3 "Database operation "execute statement" failed with sqlite code 14 and error message "unable to open database file"" UserInfo={NSLocalizedDescription=Database operation "execute statement" failed with sqlite code 14 and error message "unable to open database file", APMMonitorContext=execute statement,14,A,5}
2021-06-02 09:45:00.541693+0200 LinphoneCrash[54760:21978344] 8.0.0 - [Firebase/Analytics][I-ACS012056] Transaction failed. Transaction failed
```
Application is running but no more firebase events are being sent to backend due to database corruption


## Initial investigation:
Caused by calling `linphoneCore?.stop()` 
