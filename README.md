# rebel-promocodes

![image](https://user-images.githubusercontent.com/25962081/153479553-cc41f876-9bd8-4f9f-8fa6-2de6bd7fb8c5.png)

Store: **[Rebel Scripts](https://store.rebelscripts.net/)**

Discord: **[Discord Link](https://discord.gg/YJ3YzNjWDy)**

# About:

This script gives admins and owners power to create promo codes with ease. You can create promo codes for items, vehicles and money.

When a code is created a discord webhook will be sent with the new codes information. It will also send a discord webhook when a player redeems a code. 

# Features:

* | Create promo codes for items, vehicles and money

* | Set item quantity, example 5x joints

* | Nice promo code creator menu built with qb-input

* | Discord webhook messages for when a code is created and redeemed.


**Resmon:**
*In use (0.00)* |
*Idle (0.00)*

# Dependencies

* | [qb-core ](https://github.com/qbcore-framework/qb-core)
* | [qb-input](https://github.com/qbcore-framework/qb-input)
* | [oxmysql or MySQL](https://github.com/overextended/oxmysql/)

# Other Resources

> [Rebel Trucking [QB/ESX]](https://forum.cfx.re/t/rebel-trucking-advanced-truck-deliveries-qb-esx/4804298)
> 
> [Rebel Impound Job [QB]](https://forum.cfx.re/t/rebel-impound-job-realistic-impound-job-qb/4808148)

# Installation

1. Put the ```rebel-promocodes``` folder in your ```resources directory```
2. Add ```ensure rebel-promocodes``` in your ```server.cfg```
3. Insert ```insert.sql``` to your ```sql database```
4. Add this to your ```qb-core/shared.lua```
```lua
['governmentcode'] 			 	 	 = {['name'] = 'governmentcode', 			  		['label'] = 'Government Code', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'receipt.png', 			['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A code which can be redeemed somewhere... Cough cough /redeemp {code}'},
```
5. Add this to your ```qb-inventory/html/js/app.js``` under the function ```FormatItemInfo```
```js
} else if (itemData.name == "governmentcode") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>" + itemData.info.label + "</p>");
``` 

# How to integrate this script in other resources

You can integrate this script into other resources very easily. 
Here is an example:

Garbage Job, when the player picks up a trash bag he/she has a 10% chance to get a government code(promo code) for $1000 Cash

```lua
function GiveGarbageTreasure(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local chance = math.random (0,100)
    local code = "Government:"..math.random(100,999).."qbcore"..math.random(100,999)

    if chance >= 90 then
        TriggerEvent('rebel-promocodes:server:giveitemwithcode', Player.PlayerData.citizenid, "money", "cash", 1000, 1, "Garbage Treasure", code)
    end
end
```

This will give the player a government code item which looks like this:

![image](https://user-images.githubusercontent.com/25962081/153754435-8e9b130e-f300-4ce9-8570-a56fdcdcea31.png)


*Server*:
```lua
TriggerEvent('rebel-promocodes:server:giveitemwithcode', citizenid, type, item, amount, uses, wherefrom, code)
```
*Client*:
```lua
TriggerServerEvent('rebel-promocodes:server:giveitemwithcode', citizenid, type, item, amount, uses, wherefrom, code)
```


```citizenid``` = The players *citizenid*, for example *Player.PlayerData.citizenid*

```type``` = Item type, can be either *"Item"*, *"Vehicle"* or *"Money"*

```item``` = Which Item the code should give, for example *"Joint"* for *Item*, *"Adder"* for *vehicle*, *"Cash"* for *money*. You get it.

```amount``` = Amount is how much of the item the code should give, for example *10*

```uses``` = How many uses the code should have, for example *10*. A player can only use a code *once*.

```wherefrom``` = Where the code was created from, for example *"Bank Robbery"*

```code``` = What the code should be, for example *"codegen:"..math.random(100,999)*
