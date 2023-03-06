RegisterNetEvent("Hulk_rockstar:record")
AddEventHandler("Hulk_rockstar:record", function()
    StartRecording(1) 
    lib.notify({
      title = 'Hulk - Rockstar',
      description = 'Recording Started',
      position = 'top',
      type = 'inform'
  })
end)

RegisterNetEvent("Hulk_rockstar:saveclip")
AddEventHandler("Hulk_rockstar:saveclip", function()
    StartRecording(0) 
    StopRecordingAndSaveClip()
    lib.notify({
      title = 'Hulk - Rockstar',
      description = 'Saving Clip',
      position = 'top',
      type = 'inform'
  }) 
end)

RegisterNetEvent("Hulk_rockstar:delclip")
AddEventHandler("Hulk_rockstar:delclip", function()
    StopRecordingAndDiscardClip() 
    lib.notify({
      title = 'Hulk - Rockstar',
      description = 'Delete Clip',
      position = 'top',
      type = 'inform'
  }) 
end)

RegisterNetEvent("Hulk_rockstar:editor")
AddEventHandler("Hulk_rockstar:editor", function()
    NetworkSessionLeaveSinglePlayer() 
    ActivateRockstarEditor() 
    lib.notify({
      title = 'Hulk - Rockstar',
      description = 'Entering Rockstar Editor',
      position = 'top',
      type = 'inform'
  })
end)

RegisterNetEvent("Hulk:boosted")
AddEventHandler("Hulk:boosted", function()
   SuperKick = not SuperKick
   if SuperKick then 
      N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"),950.9) 
      N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"),1200.9) 
      lib.notify({
        title = 'Hulk Boosters',
        position = 'top',
        description = 'Superhuman Ability Enabled',
        type = 'success'
    })
 else
      N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 1.49) 
      N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 1.49) 
      lib.notify({
        title = 'Hulk Boosters',
        position = 'top',
        description = 'Superhuman Ability disabled',
        type = 'error'
    })
    end
end)

RegisterNetEvent("Hulk:SuperJump")
AddEventHandler("Hulk:SuperJump", function()
 SuperJump = not SuperJump
 if SuperJump then 
    lib.notify({
      title = 'Hulk Boosters',
        position = 'top',
        description = 'SuperJump Enabled',
        type = 'success'
    })
 else
    lib.notify({
      title = 'Hulk Boosters',
        position = 'top',
        description = 'SuperJump Disabled',
        type = 'error'
    })
    end
end)

lib.registerContext({
  id = 'Hulk_boosters',
  title = 'Hulk - Abilities',
  options = {
    {
      title = 'Superhuman',
      description = 'Toggle Human Ability!',
      event = 'Hulk:boosted',
      disabled = false
    },
    {
      title = 'SuperJump',
      description = 'Toggle SuperJump',
      event = 'Hulk:SuperJump',
      disabled = false
    },
    {
      title = 'More Abilities Will Unlocked Soon',
      description = 'Update to be done by hulk!',
      --menu = 'Update to be done by hulk',
      disabled = true
    },
  }
})

lib.registerContext({
  id = 'Hulk_rockstar',
  title = 'Hulk - Abilities',
  options = {
    {
      title = 'Hulk Boosters',
      --description = 'Locked By Hulk for Maintenance!',
      description = 'Boosters!',
      menu = 'Hulk_boosters',
      disabled = false
    },
    {
      title = 'Record',
      description = 'Record Cinematic',
      icon = 'hand',
      event = 'Hulk_rockstar:record',
      disabled = false
    },
    {
      title = 'Save Clip',
      description = 'Save Clip',
      icon = 'hand',
      event = 'Hulk_rockstar:saveclip',
      disabled = false
    },
    {
      title = 'Enter Editor',
      description = 'Record Cinematic',
      icon = 'hand',
      event = 'Hulk_rockstar:editor',
      disabled = false
    },
    {
      title = 'Delete Clip',
      description = 'Delete Clip',
      icon = 'hand',
      event = 'Hulk_rockstar:delclip',
      disabled = false
    }
  }
})



RegisterCommand('hulk', function()
  lib.showContext('Hulk_rockstar')
  lib.notify({
    title = 'Hulk - Abilities',
      position = 'top',
      description = 'Toggled',
      type = 'inform'
  })
end)



Citizen.CreateThread(function()
  while true do
     Citizen.Wait(0)
     if SuperJump then
      SetSuperJumpThisFrame(PlayerId(), 1000)
     end

     if InfStamina then
      RestorePlayerStamina(source, 1.0)
     end
  end
end)



