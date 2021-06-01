# LinphoneCrash

1. clone repo to some <dir>
2. cd <dir>
3. pod install
4. open LinphoneCrash.xcworkspace
5. start app (device or simulator)
6. tap init 
7. tap start core
8. tap stop core
9. tap deinit
10. repeat step 6-8

Result:
On console:
```
Message from debugger: Terminated due to signal 9
```
No crash log etc...

Initial investigation:
Caused by calling `linphoneCore?.stop()` during second second stop UI action
