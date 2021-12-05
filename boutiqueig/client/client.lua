ESX = nil

Citizen.CreateThread(function()
	TriggerServerEvent('boutique:getpoints')
	if pointjoueur == nil then pointjoueur = 0 end
	while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)

local menuColor = {104, 0, 204}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['boutique']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('boutique', v):SetRectangleBanner(104, 0, 204)
        end
    end)
end

RMenu.Add('boutique', 'main', RageUI.CreateMenu("Boutique Tchoupi", "~p~Menu boutique"))
RMenu.Add('boutique', 'vehicle', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "Véhicules", "~p~Menu Véhicule"))
RMenu.Add('boutique', 'armes', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "Armes", "~p~Menu d'armes"))

Citizen.CreateThread(function()
    while true do
		RageUI.IsVisible(RMenu:Get('boutique', 'main'), true, true, true, function()

                RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

                
--                RageUI.Separator("Code boutique : " .. code)

				RageUI.ButtonWithStyle("Véhicules", "Liste des véhicules.", { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'vehicle'))

				RageUI.ButtonWithStyle("Armes", "Liste des armes.", { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'armes'))
            end)

-------------------------------------------------------------------------- Véhicules
		
        RageUI.IsVisible(RMenu:Get('boutique', 'vehicle'), true, true, true, function()
            
            RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

            RageUI.ButtonWithStyle("Audi Rs3", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
                if a then
					RenderSprite("RageUI", "rs3", 0, 565, 535, 290, 100)
                end
            
                if s then
                    ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                        if callback then
                    local veh = "rs318"
                    give_vehi(veh)    
                    ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Rs3 !")
                else
            ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end

                    end, "rs318")
                end
            end) 

			RageUI.ButtonWithStyle("Audi Rs5 Abt", nil, { RightLabel = "~r~3000 "..moneypoints }, true,function(h,a,s)
				if a then
					RenderSprite("RageUI", "rs5",  0, 565, 535, 290, 100)
				end
		
                if s then
                    ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                        if callback then
                            local veh = "rs5r"
                            give_vehi(veh)
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Rs5 abt !")
                            else
                        ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                            end
            
                    end, "rs5r")
                end
            end) 
		
		RageUI.ButtonWithStyle("Audi Rs6", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
						RenderSprite("RageUI", "rs6", 0, 565, 535, 290, 100)
					end
			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rs6avant20"
                        give_vehi(veh)   
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Rs6 !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "rs6avant20")
                    end
                end) 
				
		RageUI.ButtonWithStyle("Brabus GT63S", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "b63s", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rmodgt63"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la GT63S !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "rmodgt63")
                    end
                end) 

		RageUI.ButtonWithStyle("Jeep", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "jeep", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "srt8"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Jeep !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "srt8")
                    end
                end) 

				RageUI.ButtonWithStyle("Mercedes CLS53", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "cls63",  0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "CLS53"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la CLS53 !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas de coin boufon !")
                    end
    
                            end, "CLS53")
                        end
                    end) 

				RageUI.ButtonWithStyle("TMax", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "tmax",  0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "tmax"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat du Tmax !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "tmax")
                        end
                    end) 

				RageUI.ButtonWithStyle("Golf", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "golf", 0, 565, 535, 290, 100)
					end			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "golf75r"
                        give_vehi(veh)
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Golf !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "golf75r")
                        end
                    end) 

				RageUI.ButtonWithStyle("Audi Q7", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "Q7",  0, 565, 535, 290, 100)
					end			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "Q7"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~🚗 ~g~Merci pour achat du Q7 !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "Q7")
                        end
                    end) 

				RageUI.ButtonWithStyle("Chevrolet Camaro ZL1", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "zl1", 0, 565, 535, 290, 100)
					end	
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                        if callback then
                    local veh = "21camaro"
                    give_vehi(veh)   
					ESX.ShowNotification("~h~🚗 ~g~Merci pour achat de la Camaro ZL1 !")
                            else
                        ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                            end
            
                            end, "21camaro")
                        end
                    end) 

end)



-------------------------------------------------------------------------- Armes


    RageUI.IsVisible(RMenu:Get('boutique', 'armes'), true, true, true, function()
        
        RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)
	

   RageUI.ButtonWithStyle("Pistolet Vintage", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "vintagepistol", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour achat du Pistolet Vintage !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "vintage")
        end
	end) 

	
	RageUI.ButtonWithStyle("Mini-SMG", nil, { RightLabel = "~r~2000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "minismg", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour achat de le Mini-SMG !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "msmg")
        end
    end) 
	
	RageUI.ButtonWithStyle("Pistolet Mitrailleur", nil, { RightLabel = "~r~2000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "pistolet-mitrailleur", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour achat du Pistolet Mitrailleur !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "pm")
        end
	end) 
	
	RageUI.ButtonWithStyle("AK-47", nil, { RightLabel = "~r~3000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "assault-rifle-mk2", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour achat de l'AK-47 !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "ak47")
        end
	end) 
	
	RageUI.ButtonWithStyle("Sniper", nil, { RightLabel = "~r~4000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "sniper", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour achat du snipe !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "sniper")
        end
    end) 

end) --- Fin Armes

Citizen.Wait(0)
end
end)

--------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsControlJustPressed(0, touche_open_menu) then
			TriggerServerEvent('boutique:getpoints')
			RageUI.Visible(RMenu:Get('boutique', 'main'), not RageUI.Visible(RMenu:Get('boutique', 'main')))
		end -- Touche F1
	end
end)


function buying(point)
	if pointjoueur >= point then
		TriggerServerEvent('boutique:deltniop', point)
		Citizen.Wait(300)
		TriggerServerEvent('boutique:getpoints')
	else
		TriggerEvent('esx:showNotification', '~r~Tu ne peut pas acheter cet article.')
	end
end

RegisterNetEvent('boutique:retupoints')
AddEventHandler('boutique:retupoints', function(point)
	pointjoueur = point
end)

local voituregive = {}

function give_vehi(veh)
    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    
    Citizen.Wait(10)
    ESX.Game.SpawnVehicle(veh, {x = plyCoords.x+2 ,y = plyCoords.y, z = plyCoords.z+2}, 313.4216, function (vehicle)
            local plate = exports.esx_vehicleshop:GeneratePlate()
            table.insert(voituregive, vehicle)		
            print(plate)
            local vehicleProps = ESX.Game.GetVehicleProperties(voituregive[#voituregive])
            vehicleProps.plate = plate
            SetVehicleNumberPlateText(voituregive[#voituregive] , plate)
			TriggerServerEvent('shop:vehicule', vehicleProps, plate)
		
	end)
end


function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

