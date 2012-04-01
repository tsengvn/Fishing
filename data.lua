module(..., package.seeall)

function getFishData()
	return {
		easy = {
			id = "easy",
			name = "Gold Fish",
			hp = 10,
			aggressive = 2.5,
			reward = 200
		},
		medium ={
			id = "medium",
			name = "Koi",
			hp = 15,
			aggressive = 5,
			reward = 300
		},
		touch = {
			id = "touch",
			name = "Rainbow Fish",
			hp = 20,
			aggressive = 7.5,
			reward = 450
		},
		very_touch = {
			id = "very_touch",
			name = "Salamander",
			hp = 25,
			aggressive = 10,
			reward = 600
		}
	}
end

function getRodData()
	return {
		{
			id = 1,
			name = "Bamboo pole",
			picture = "Rod_BambooRod.png",
			gold = 0,
			point = 0,
			comment = "Direction mainly small fish in the merit only robustness"
		},
		{
			id = 2,
			name = "Beginner rod",
			picture = "Rod_BeginnerRod.png",
			gold = 100,
			point = 2000,
			comment = "Glass is easy to handle for beginners perspective"
		},
		{
			id = 3,
			name = "King mountain stream",
			picture = "Rod_KingMountain.png",
			gold = 200,
			point = 4000,
			comment = "Tall and thin, without own natural features"
		},
		{
			id = 4,
			name = "Ace Strong",
			picture = "Rod_AceStrong.png",
			gold = 500,
			point = 10000,
			comment = "Carbon outstanding operability of the popular"
		},
		{
			id = 5,
			name = "God of water",
			picture = "Rod_GodOfWater.png",
			gold = 1000,
			point = 20000,
			comment = "Cleansed by using a bamboo fountain in Anko Mt."
		},
		{
			id = 6,
			name = "Fantasy",
			picture = "Rod_Fantasy.png",
			gold = 2000,
			point = 40000,
			comment = "Supple lightly, Thailand, craftsman masterpiece positive pole"
		}
	}
end

function getHookData()
	return {
		{
			id = 1,
			name = "Set of basic",
			picture = "Hook_BasicHook.png",
			gold = 0,
			point = 0,
			comment = "But rather to create complex, heavy-duty anyway"
		},
		{
			id = 2,
			name = "Beginner set",
			picture = "Hook_BeginnerHook.png",
			gold = 100,
			point = 2000,
			comment = "General-purpose and easy to handle even a beginner may"
		},
		{
			id = 3,
			name = "Set clear stream",
			picture = "Hook_ClearStream.png",
			gold = 200,
			point = 4000,
			comment = "Orientation is characterized by river fish for the mountain stream flocked Bali"
		},
		{
			id = 4,
			name = "Virtuosity",
			picture = "Hook_VirtuosityHook.png",
			gold = 500,
			point = 10000,
			comment = "Atari will not even miss subtle sensitivity well"
		},
		{
			id = 5,
			name = "Trap of fairy",
			picture = "Hook_TrapOfFairy.png",
			gold = 1000,
			point = 20000,
			comment = "Capture the heart of a big shot in a strange movement"
		}
	}
end

function getBailtData()
	return {
		{
			id = 1,
			name = "Dough bait",
			picture = "",
			gold = 0,
			point = 0,
			comment = "A mixture of flour and oil, etc. appropriately"
		},
		{
			id = 2,
			name = "Udon",
			picture = "",
			gold = 100,
			point = 2000,
			comment = "Soft noodles boiled in water to fall"
		},
		{
			id = 3,
			name = "Earthworm",
			picture = "",
			gold = 200,
			point = 4000,
			comment = "Is often used in river fishing, pheasant, also known as"
		},
		{
			id = 4,
			name = "How much",
			picture = "",
			gold = 200,
			point = 4000,
			comment = "Fresh eggs of salmon, the favorite food of fish and other river"
		},
		{
			id = 5,
			name = "All-round bait",
			picture = "",
			gold = 500,
			point = 10000,
			comment = "Potato and steamed fish meal was kneaded, the sake lees"
		},
		{
			id = 6,
			name = "Feeding of the hermit",
			picture = "",
			gold = 1000,
			point = 20000,
			comment = "Edible wild plants of popular mystery to fish in nourishing"
		},
		{
			id = 7,
			name = "Rainbow Feed",
			picture = "",
			gold = 2000,
			point = 40000,
			comment = "Are written only with the raw material"
		}
	}
end