//@desc generate particles/effects per room

//Tilesets
if instance_exists(oLevelThemeSetter) CurrentTheme = oLevelThemeSetter.CurrentTheme; 
else
CurrentTheme = 0;

// Create an array to hold the theme names in the order they are defined in the enum
themeNames = [
    "placeholder",
    "sand",
    "darkforest",
    "snow",
	"morningforest"
];

ThemeSwitcher(); 

//Other stuff
initializeLevelGenerator(); 