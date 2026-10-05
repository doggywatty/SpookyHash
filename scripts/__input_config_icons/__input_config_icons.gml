// Feather disable all

/// This script contains mappings from binding labels - a combination of keyboard key names, mouse button
/// names, and abstract gamepad names - to more friendly terms that you can show a player. Typically you'd
/// set up this function to return sprites such that you can draw gamepad icons as visual icons.
/// 
/// Default values in this script reflect the particular, and sometimes unexpected, buttons that each gamepad
/// binding maps to on the actual physical hardware. There are a handful of special cases at the top of the
/// script that are used to handle errors or misconfigurations.



//Special case: When a non-binding value is being evaluated
//              This should only happen if Input is given an invalid input argument
input_icon_not_a_binding(0x22);

//Special case: When an empty binding is being evaluated
input_icon_empty(0x21);

//Special case: When a touch binding (virtual button) is being evaluated
input_icon_touch("Virtual button");



//Optional remapping for keyboard and mouse
//This is useful for turning keyboard keys into sprite icons to match other assets, or for returning formatted strings (e.g. for use with Scribble)
//Any keyboard key label not in this struct will simply fall through and return the key name
input_icons_keyboard_and_mouse()
.add("arrow up", create_key(0xA))
.add("arrow down", create_key(0xC))
.add("arrow left", create_key(0xD))
.add("arrow right", create_key(0xB))
.add("escape", create_key(0x2))
.add("backspace", create_key(0x9))
.add("enter", create_key(0x8))
.add("space", create_key(0x6))
.add("tab", create_key(0x5))
.add("shift", create_key(0x4))
.add("ctrl", create_key(0x0))
.add("alt", create_key(0x1))
.add("menu", create_key(0xE))
.add("caps lock", create_key(0x3));

//Put extra .add() commands here to add icons to keyboard and mouse



#region Gamepads

//Xbox One and Series S|X controllers
input_icons_gamepad(INPUT_GAMEPAD_TYPE_XBOX_ONE)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xF)
.add("gamepad thumbstick l right", 0xD)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)

.add("gamepad thumbstick r left",  0x14)
.add("gamepad thumbstick r right", 0x12)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)

//Series S|X only
.add("gamepad misc 1",             0x18)

//Elite and third party controllers
.add("gamepad paddle 1",           0x19)
.add("gamepad paddle 2",           0x1B)
.add("gamepad paddle 3",           0x1A)
.add("gamepad paddle 4",           0x1C)

//PlayStation 5
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PS5)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xF)
.add("gamepad thumbstick l right", 0xD)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)

.add("gamepad thumbstick r left",  0x14)
.add("gamepad thumbstick r right", 0x12)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)

.add("gamepad touchpad click",     0x1D)

//Not available on the PlayStation 5 console itself but available on other platforms
.add("gamepad misc 1",             0x1E)

//DualSense Edge
.add("gamepad paddle 1",           0x19)
.add("gamepad paddle 2",           0x1A)

//Switch handheld/dual JoyCon/Pro Controller
input_icons_gamepad(INPUT_GAMEPAD_TYPE_SWITCH)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xF)
.add("gamepad thumbstick l right", 0xD)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)
 
.add("gamepad thumbstick r left",  0x14)
.add("gamepad thumbstick r right", 0x12)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)
  
//Not available on the Switch console itself but available on other platforms
.add("gamepad guide",              0x1F)
.add("gamepad misc 1",             0x20)

//Xbox 360
input_icons_gamepad(INPUT_GAMEPAD_TYPE_XBOX_360)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xD)
.add("gamepad thumbstick l right", 0xF)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)

.add("gamepad thumbstick r left",  0x12)
.add("gamepad thumbstick r right", 0x14)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)

//PlayStation 4
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PS4)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xD)
.add("gamepad thumbstick l right", 0xF)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)

.add("gamepad thumbstick r left",  0x12)
.add("gamepad thumbstick r right", 0x14)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)

.add("gamepad touchpad click",     0x1D)

//PlayStation 1-3
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PSX)
.add("gamepad face south",         0x0)
.add("gamepad face east",          0x1)
.add("gamepad face west",          0x3)
.add("gamepad face north",         0x2)
.add("gamepad shoulder l",         0x8)
.add("gamepad shoulder r",         0x9)
.add("gamepad trigger l",          0xA)
.add("gamepad trigger r",          0xB)
.add("gamepad select",             0x16)
.add("gamepad start",              0x17)
.add("gamepad dpad left",          0x7)
.add("gamepad dpad right",         0x5)
.add("gamepad dpad up",            0x6)
.add("gamepad dpad down",          0x4)

.add("gamepad thumbstick l left",  0xD)
.add("gamepad thumbstick l right", 0xF)
.add("gamepad thumbstick l up",    0xE)
.add("gamepad thumbstick l down",  0xC)
.add("gamepad thumbstick l click", 0x10)

.add("gamepad thumbstick r left",  0x12)
.add("gamepad thumbstick r right", 0x14)
.add("gamepad thumbstick r up",    0x13)
.add("gamepad thumbstick r down",  0x11)
.add("gamepad thumbstick r click", 0x15)

////A couple additional examples for optional gamepad types (see __input_define_gamepad_types)
//
////Nintendo 64
//input_icons(INPUT_GAMEPAD_TYPE_N64)
//.add("gamepad face south",         "A")
//.add("gamepad face east",          "B")
//.add("gamepad shoulder l",         "L")
//.add("gamepad shoulder r",         "R")
//.add("gamepad trigger l",          "Z")
//.add("gamepad start",              "start")
//.add("gamepad dpad up",            "dpad up")
//.add("gamepad dpad down",          "dpad down")
//.add("gamepad dpad left",          "dpad left")
//.add("gamepad dpad right",         "dpad right")
//.add("gamepad thumbstick l left",  "thumbstick left")
//.add("gamepad thumbstick l right", "thumbstick right")
//.add("gamepad thumbstick l up",    "thumbstick up")
//.add("gamepad thumbstick l down",  "thumbstick down")
//.add("gamepad thumbstick r left",  "C left")
//.add("gamepad thumbstick r right", "C right")
//.add("gamepad thumbstick r up",    "C up")
//.add("gamepad thumbstick r down",  "C down")
//
////Sega Saturn
//input_icons(INPUT_GAMEPAD_TYPE_SATURN)
//.add("gamepad face south", "A")
//.add("gamepad face east",  "B")
//.add("gamepad face west",  "X")
//.add("gamepad face north", "Y")
//.add("gamepad shoulder l", "L")
//.add("gamepad shoulder r", "Z")
//.add("gamepad trigger l",  "R")
//.add("gamepad trigger r",  "C")
//.add("gamepad select",     "mode")
//.add("gamepad start",      "start")
//.add("gamepad dpad up",    "dpad up")
//.add("gamepad dpad down",  "dpad down")
//.add("gamepad dpad left",  "dpad left")
//.add("gamepad dpad right", "dpad right")

#endregion
