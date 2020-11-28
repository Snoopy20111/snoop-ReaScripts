--[[
 * ReaScript Name: snoop_Util_Seperate Regions Per Item With Track Name
 * Description: Make regions for each media item, named after the track, with that track assigned in the region render matrix
 * Author: Logan Hardin
 * Author URl: https://loganhardin.xyz
 * Github Repository: https://github.com/Snoopy20111/snoop-ReaScripts
 * REAPER: 6.xx
 * Extensions: None
 * Version: 1.0
--]]
--[[
 * Changelog:
 * v1.0
	+Initial Release
--]]

--for each media item selected
for i=0, reaper.CountSelectedMediaItems(0)-1 do

	--Get Item, it's track, and the track name.
	Item = reaper.GetSelectedMediaItem(0,i)
	Item_Track = reaper.GetMediaItemTrack(Item)
	ok, Track_Name = reaper.GetTrackName(Item_Track, "")
	
	--Get the start position of Item and do quik maffs to find the end point.
	local Item_Start = reaper.GetMediaItemInfo_Value(Item, "D_POSITION")
	local Item_End = Item_Start + reaper.GetMediaItemInfo_Value(Item, "D_LENGTH")
	
	--Make a region with that position, using the track's name
	local Region_Index = reaper.AddProjectMarker2(0, true, Item_Start, Item_End, Track_Name, -1, 0)
	--assign the media item's track to be that region's render target
	reaper.SetRegionRenderMatrix(0, Region_Index, Item_Track, 1)

end