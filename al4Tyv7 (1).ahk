    #NoEnv
    #Persistent
    #MaxThreadsPerHotkey 2
    #KeyHistory 0
    ListLines Off
    SetBatchLines, -1
    SetKeyDelay, -1, -1
    SetMouseDelay, -1
    SetDefaultMouseSpeed, 0
    SetWinDelay, -1
    SetControlDelay, -1
    SendMode Input
    CoordMode, Pixel, Screen
     
    ; DETROIT_HOTKEYS
    key_hold         := "XButton1"
    key_hold4th      := "XButton1"
    key_holdthingy   := "F1"
    key_autothingy   := "F2"
    key_GOTG         := "F3"
    key_whendaal     := "F4"
    key_crouch       := "F5"
    key_release      := "F6"
    key_pause        := "Down"
    key_khatam       := "End"
     
    ; MARKUS_AI_SETTINGS
    konsa_box            := 2 ;
    konsa_sens           := 80 ; Regular=58 Default=60 Adjust as per your preference
    konsa_color          := 0xfefe00 ; Yellow=0xfefe00 green=0xfefe00 vibrantpurple=0xfefe00
    minDelay              := 2
    maxDelay              := 7
    sleepDelay            := 160
     
    ; OVERLAY_WIDTH
    goleftDetroit   := A_ScreenWidth // 2 - konsa_box
    gorightDetroit  := A_ScreenWidth // 2 + konsa_box
    gotopDetroit    := A_ScreenHeight // 3 - konsa_box
    gobottomDetroit := A_ScreenHeight // 2 + konsa_box
     
    ; DEFINE WWE
    TripleH     := FoundX
    JohnCena    := FoundY
    GOTG        := true
 
    ; Alice_Hotkeys
    Hotkey, %key_khatam%, GG
    Hotkey, %key_GOTG%, GOTGset
    Hotkey, %key_whendaal%, vendaal
    Hotkey, %key_crouch%, crouch
    Hotkey, %key_release%, release
    Hotkey, %key_holdthingy%, holdy
    Hotkey, %key_autothingy%, AutoOn
    Hotkey  %key_pause%, Wait
     
    ; Here we go, Crouch!
    Crouch()        { 
                    SendInput, {K Down} 
                    }
    CrouchRelease() {
                    SendInput, {K Up} 
                    }
     
    ; Stop moving...
    ReleaseMove() {
                   SendInput, {W Up}
                   SendInput, {A Up}
                   SendInput, {S Up}
                   SendInput, {D Up}
                  }
     
    ; FUNCTIONS
     
    ; chaliyee shuru karte hain!
    shuru: 
          SoundBeep 200, 200
          SoundBeep 300, 200
          SetTimer, Initialize, 50
          SetTimer, Initialize2, Off
          return
    
    ; Time to hold
    holdy:
          SetTimer, Initialize, 50
          SetTimer, Initialize2, Off
          SoundBeep 400, 200
          return
 
    ; Toggle thingy to On
    AutoOn:  
           SetTimer, Initialize, Off
           SetTimer, Initialize2, 50
           SoundBeep 300, 400
           return
 
   ; Stop this sh#t! Turns both thing off.
     Wait: 
          SoundBeep 400, 300
          SetTimer, Initialize, Off
          SetTimer, Initialize2, Off
          SoundBeep 300, 400
          return
            
    ; Sit-stand Android
    crouch: 
           letscrouch := !letscrouch
           If (letscrouch)
           SoundBeep 400, 400
           else
           SoundBeep 200, 200
           return
     
    ; Dont move Android
    release: 
            stop := !stop
            If (stop)
            SoundBeep 400, 400
            else
            SoundBeep 200, 200
            return
     
    ; fact: Androids are correct at some point...
    initialize:    
                While GetKeyState(key_hold, "P") or GetKeyState(key_hold2nd, "P") or GetKeyState(key_hold3rd, "P") or GetKeyState(key_hold4th, "P") {
                if (GOTG) {
                PixelSearch() 
                } else {
                PixelSearchelfir()
                }
                }             
                return
 
    ; fact: I dont have more facts ;(
    initialize2:
                if (GOTG) {
                PixelSearch() 
                } else {
                PixelSearchelfir()
                }             
                return
     
    ; Guardians of the Galaxy
    GOTGset:
             SoundBeep 300, 200
             GOTG := true
             return
     
    ; Bollywood Movie?
    vendaal:
             SoundBeep 300, 200
             GOTG := false
             return
     
    ; Good Game! Take some rest before you can do this again :)
    GG:
        SoundBeep, 400, 200
        SoundBeep, 300, 200
        SoundBeep, 200, 200
        Sleep 400
        ExitApp
        return
     
    ; ENGINE 1
    PixelSearch() {
                   global
                   PixelSearch, TripleH, JohnCena, goleftDetroit, gotopDetroit, gorightDetroit, gobottomDetroit, konsa_color, konsa_sens, Fast RGB ; Fast RGB For Razer Users ( Syncs game colors with RGB )
                   If !(ErrorLevel) {
                   If !GetKeyState("LButton") {
                   Random, uWu, minDelay, maxDelay
                   Sleep %uWu%
                   if (stop) { 
                              ReleaseMove()
                             }
                   PostMessage, 0x201, 0x00000001, 0x01f0010f, , VALORANT
                   PostMessage, 0x202, 0x00000001, 0x01f0010f, , VALORANT
                   if (letscrouch) {
                                Crouch()
                                Sleep 100
                                }
                   If (letscrouch) {
                                Sleep 100
                                CrouchRelease()
                               }
                   Sleep %sleepDelay% 
              }
        }
        return
    }
     
     
    ; ENGINE 2
    PixelSearchelfir() {
                        global
                        PixelSearch, TripleH, JohnCena, goleftDetroit, gotopDetroit, gorightDetroit, gobottomDetroit, konsa_color, konsa_sens, Fast RGB ; Fast RGB For Razer Users ( Syncs game colors with RGB )
                        If !(ErrorLevel) {
                        If !GetKeyState("LButton") {
                        Random, uWu, minDelay, maxDelay 
                        Sleep %uWu%
                       if (stop) {
                                   ReleaseMove()
                                  }
                        PostMessage, 0x201, 0x00000001, 0x01f0010f, , VALORANT
                        if (letscrouch) {
                                     Crouch()
                                     Sleep 50
                                    }
                        Sleep 50
                        if (letscrouch) {
                                     Sleep 50
                                     CrouchRelease()
                                    }
                        PostMessage, 0x202, 0x00000001, 0x01f0010f, , VALORANT
              }
        }
        return
    }
     
    ; 'ARE YOU A HUMAN? IF NOT, PLEASE CLOSE/IGNORE THIS. IT CONTAINS MESSAGES FOR HUMANS :)
    ; MADE BY (DOES IT MATTER?)
    ; DETROIT BECOME HUMAN OVERLAY FOR BETTER EXPERIENCE ❤
    ; DONT FORGET TO CREDIT ME IF YOU POST ONLINE ❤ ( JUST KIDDING )
    ;  ❤
    ; IT IS FREE, PLEASE DONT GET SCAMMED <3 ❤
    ; THANK YOU, LOVE YOU 3000 <3 !!!!!
    ; Last Updated on 20-04-2024'
