function main()
	while true do
		Wait(math.random(10000,200000))
		PeteCreate(WaitForSpawn())
	end
end

function WaitForSpawn()
	while true do
	local x,y,z = PedFindRandomSpawnPosition()
	if x ~=9999 and y ~=9999 and z ~=9999 then
		return x,y,z
	end
	 Wait(0)
	end
end

function PeteCreate(x,y,z)
	local pete = PedCreateXYZ(165,x,y,z)
	PedSetActionTree(pete,"/Global/GS_Male_A","Act/Anim/GS_Male_A.act")
		AddBlipForChar(pete,0,26,4)
		GameSetPedStat(pete,20,210)
		GameSetPedStat(pete,8,350)
		PedSetInfinateSprint(pete,true)
	 PedAttackPlayer(pete,3)
	 PedSetPedToTypeAttitude(pete,13,0)

	while true do
	local target = PedGetGrappleTargetPed(pete)
	 if target ~= -1 then
		PedSetActionNode(pete,"/Global/Actions/Grapples/GrappleReversals/MountReversals/Pushoff/GIVE","Act/Globals/GlobalActions.act")
	 end
	 Wait(0)
	 
	 if PedGetWhoHitMeLast(gPlayer) == pete then
	  Wait(200)
	 PedDelete(gPlayer)
	end
 end
end
