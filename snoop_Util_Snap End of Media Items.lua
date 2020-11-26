--[[
 * ReaScript Name: Hardin- Snap End of Media Items
 * Description: Snaps end of media items to the closest grid division
 * Author: Logan Hardin
 * Author URL: loganhardin.xyz
 * Repository URL: 
 * REAPER: 6.xx
 * Extensions: None
 * Version: 1.0
--]]
--[[
 * Changelog:
 * v1.0
	+Initial Release
--]]

function SnapToEnd(int i)
	--Get Item, Position, Length, End Position, and the closest Grid Position to the end
	Item = reaper.GetSelectedMediaItem(0,i)
	Item_Start = reaper.GetMediaItemInfo_Value(Item, "D_POSITION")
	Item_Length = reaper.GetMediaItemInfo_Value(Item, "D_LENGTH")
	Item_End = Item_Start + Item_Length
	End_Grid_Division = reaper.BR_GetClosestGridDivision(Item_End)

	--Move media item such that the end is on that grid division
	reaper.SetMediaItemPosition(Item, End_Grid_Division - Item_Length, true)
end

function main()
	--for each media item selected
	for i=0, reaper.CountSelectedMediaItems(0)-1 do
		SnapToEnd(i)
	end
end

main()