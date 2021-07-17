--[[

    A few notes:
        * You don't need to request/load scaleforms for pause menus. Scaleforms are already loaded internally (I think).
        * Scaleform functions need to be called AFTER activating the pause menu. Basically, you let GTA5 load the scaleforms internally, and the you modify them with scaleform functions.
        * use `local lastMenuID, selectedButtonUniqueID = GetPauseMenuSelection()` to get the ID of the button that you have selected.
        * Most scaleform function can be found here: https://vespura.com/fivem/scaleform/#PAUSE_MENU_SP_CONTENT and here: https://vespura.com/fivem/scaleform/#PAUSE_MENU_HEADER

    Things still needing research:
        * image loading for the details tab. GTAO loads a mission image there.

    HUD Colors:
        0 = 	        HUD_COLOUR_PURE_WHITE,
        1 = 	        HUD_COLOUR_WHITE,
        2 = 	        HUD_COLOUR_BLACK,
        3 = 	        HUD_COLOUR_GREY,
        4 = 	        HUD_COLOUR_GREYLIGHT,
        5 = 	        HUD_COLOUR_GREYDARK,
        6 = 	        HUD_COLOUR_RED,
        7 = 	        HUD_COLOUR_REDLIGHT,
        8 = 	        HUD_COLOUR_REDDARK,
        9 = 	        HUD_COLOUR_BLUE,
        10 = 	        HUD_COLOUR_BLUELIGHT,
        11 = 	        HUD_COLOUR_BLUEDARK,
        12 = 	        HUD_COLOUR_YELLOW,
        13 = 	        HUD_COLOUR_YELLOWLIGHT,
        14 = 	        HUD_COLOUR_YELLOWDARK,
        15 = 	        HUD_COLOUR_ORANGE,
        16 = 	        HUD_COLOUR_ORANGELIGHT,
        17 = 	        HUD_COLOUR_ORANGEDARK,
        18 = 	        HUD_COLOUR_GREEN,
        19 = 	        HUD_COLOUR_GREENLIGHT,
        20 = 	        HUD_COLOUR_GREENDARK,
        21 = 	        HUD_COLOUR_PURPLE,
        22 = 	        HUD_COLOUR_PURPLELIGHT,
        23 = 	        HUD_COLOUR_PURPLEDARK,
        24 = 	        HUD_COLOUR_PINK,
        25 = 	        HUD_COLOUR_RADAR_HEALTH,
        26 = 	        HUD_COLOUR_RADAR_ARMOUR,
        27 = 	        HUD_COLOUR_RADAR_DAMAGE,
        28 = 	        HUD_COLOUR_NET_PLAYER1,
        29 = 	        HUD_COLOUR_NET_PLAYER2,
        30 = 	        HUD_COLOUR_NET_PLAYER3,
        31 = 	        HUD_COLOUR_NET_PLAYER4,
        32 = 	        HUD_COLOUR_NET_PLAYER5,
        33 = 	        HUD_COLOUR_NET_PLAYER6,
        34 = 	        HUD_COLOUR_NET_PLAYER7,
        35 = 	        HUD_COLOUR_NET_PLAYER8,
        36 = 	        HUD_COLOUR_NET_PLAYER9,
        37 = 	        HUD_COLOUR_NET_PLAYER10,
        38 = 	        HUD_COLOUR_NET_PLAYER11,
        39 = 	        HUD_COLOUR_NET_PLAYER12,
        40 = 	        HUD_COLOUR_NET_PLAYER13,
        41 = 	        HUD_COLOUR_NET_PLAYER14,
        42 = 	        HUD_COLOUR_NET_PLAYER15,
        43 = 	        HUD_COLOUR_NET_PLAYER16,
        44 = 	        HUD_COLOUR_NET_PLAYER17,
        45 = 	        HUD_COLOUR_NET_PLAYER18,
        46 = 	        HUD_COLOUR_NET_PLAYER19,
        47 = 	        HUD_COLOUR_NET_PLAYER20,
        48 = 	        HUD_COLOUR_NET_PLAYER21,
        49 = 	        HUD_COLOUR_NET_PLAYER22,
        50 = 	        HUD_COLOUR_NET_PLAYER23,
        51 = 	        HUD_COLOUR_NET_PLAYER24,
        52 = 	        HUD_COLOUR_NET_PLAYER25,
        53 = 	        HUD_COLOUR_NET_PLAYER26,
        54 = 	        HUD_COLOUR_NET_PLAYER27,
        55 = 	        HUD_COLOUR_NET_PLAYER28,
        56 = 	        HUD_COLOUR_NET_PLAYER29,
        57 = 	        HUD_COLOUR_NET_PLAYER30,
        58 = 	        HUD_COLOUR_NET_PLAYER31,
        59 = 	        HUD_COLOUR_NET_PLAYER32,
        60 = 	        HUD_COLOUR_SIMPLEBLIP_DEFAULT,
        61 = 	        HUD_COLOUR_MENU_BLUE,
        62 = 	        HUD_COLOUR_MENU_GREY_LIGHT,
        63 = 	        HUD_COLOUR_MENU_BLUE_EXTRA_DARK,
        64 = 	        HUD_COLOUR_MENU_YELLOW,
        65 = 	        HUD_COLOUR_MENU_YELLOW_DARK,
        66 = 	        HUD_COLOUR_MENU_GREEN,
        67 = 	        HUD_COLOUR_MENU_GREY,
        68 = 	        HUD_COLOUR_MENU_GREY_DARK,
        69 = 	        HUD_COLOUR_MENU_HIGHLIGHT,
        70 = 	        HUD_COLOUR_MENU_STANDARD,
        71 = 	        HUD_COLOUR_MENU_DIMMED,
        72 = 	        HUD_COLOUR_MENU_EXTRA_DIMMED,
        73 = 	        HUD_COLOUR_BRIEF_TITLE,
        74 = 	        HUD_COLOUR_MID_GREY_MP,
        75 = 	        HUD_COLOUR_NET_PLAYER1_DARK,
        76 = 	        HUD_COLOUR_NET_PLAYER2_DARK,
        77 = 	        HUD_COLOUR_NET_PLAYER3_DARK,
        78 = 	        HUD_COLOUR_NET_PLAYER4_DARK,
        79 = 	        HUD_COLOUR_NET_PLAYER5_DARK,
        80 = 	        HUD_COLOUR_NET_PLAYER6_DARK,
        81 = 	        HUD_COLOUR_NET_PLAYER7_DARK,
        82 = 	        HUD_COLOUR_NET_PLAYER8_DARK,
        83 = 	        HUD_COLOUR_NET_PLAYER9_DARK,
        84 = 	        HUD_COLOUR_NET_PLAYER10_DARK,
        85 = 	        HUD_COLOUR_NET_PLAYER11_DARK,
        86 = 	        HUD_COLOUR_NET_PLAYER12_DARK,
        87 = 	        HUD_COLOUR_NET_PLAYER13_DARK,
        88 = 	        HUD_COLOUR_NET_PLAYER14_DARK,
        89 = 	        HUD_COLOUR_NET_PLAYER15_DARK,
        90 = 	        HUD_COLOUR_NET_PLAYER16_DARK,
        91 = 	        HUD_COLOUR_NET_PLAYER17_DARK,
        92 = 	        HUD_COLOUR_NET_PLAYER18_DARK,
        93 = 	        HUD_COLOUR_NET_PLAYER19_DARK,
        94 = 	        HUD_COLOUR_NET_PLAYER20_DARK,
        95 = 	        HUD_COLOUR_NET_PLAYER21_DARK,
        96 = 	        HUD_COLOUR_NET_PLAYER22_DARK,
        97 = 	        HUD_COLOUR_NET_PLAYER23_DARK,
        98 = 	        HUD_COLOUR_NET_PLAYER24_DARK,
        99 = 	        HUD_COLOUR_NET_PLAYER25_DARK,
        100 = 	        HUD_COLOUR_NET_PLAYER26_DARK,
        101 = 	        HUD_COLOUR_NET_PLAYER27_DARK,
        102 = 	        HUD_COLOUR_NET_PLAYER28_DARK,
        103 = 	        HUD_COLOUR_NET_PLAYER29_DARK,
        104 = 	        HUD_COLOUR_NET_PLAYER30_DARK,
        105 = 	        HUD_COLOUR_NET_PLAYER31_DARK,
        106 = 	        HUD_COLOUR_NET_PLAYER32_DARK,
        107 = 	        HUD_COLOUR_BRONZE,
        108 = 	        HUD_COLOUR_SILVER,
        109 = 	        HUD_COLOUR_GOLD,
        110 = 	        HUD_COLOUR_PLATINUM,
        111 = 	        HUD_COLOUR_GANG1,
        112 = 	        HUD_COLOUR_GANG2,
        113 = 	        HUD_COLOUR_GANG3,
        114 = 	        HUD_COLOUR_GANG4,
        115 = 	        HUD_COLOUR_SAME_CREW,
        116 = 	        HUD_COLOUR_FREEMODE,
        117 = 	        HUD_COLOUR_PAUSE_BG,
        118 = 	        HUD_COLOUR_FRIENDLY,
        119 = 	        HUD_COLOUR_ENEMY,
        120 = 	        HUD_COLOUR_LOCATION,
        121 = 	        HUD_COLOUR_PICKUP,
        122 = 	        HUD_COLOUR_PAUSE_SINGLEPLAYER,
        123 = 	        HUD_COLOUR_FREEMODE_DARK,
        124 = 	        HUD_COLOUR_INACTIVE_MISSION,
        125 = 	        HUD_COLOUR_DAMAGE,
        126 = 	        HUD_COLOUR_PINKLIGHT,
        127 = 	        HUD_COLOUR_PM_MITEM_HIGHLIGHT,
        128 = 	        HUD_COLOUR_SCRIPT_VARIABLE,
        129 = 	        HUD_COLOUR_YOGA,
        130 = 	        HUD_COLOUR_TENNIS,
        131 = 	        HUD_COLOUR_GOLF,
        132 = 	        HUD_COLOUR_SHOOTING_RANGE,
        133 = 	        HUD_COLOUR_FLIGHT_SCHOOL,
        134 = 	        HUD_COLOUR_NORTH_BLUE,
        135 = 	        HUD_COLOUR_SOCIAL_CLUB,
        136 = 	        HUD_COLOUR_PLATFORM_BLUE,
        137 = 	        HUD_COLOUR_PLATFORM_GREEN,
        138 = 	        HUD_COLOUR_PLATFORM_GREY,
        139 = 	        HUD_COLOUR_FACEBOOK_BLUE,
        140 = 	        HUD_COLOUR_INGAME_BG,
        141 = 	        HUD_COLOUR_DARTS,
        142 = 	        HUD_COLOUR_WAYPOINT,
        143 = 	        HUD_COLOUR_MICHAEL,
        144 = 	        HUD_COLOUR_FRANKLIN,
        145 = 	        HUD_COLOUR_TREVOR,
        146 = 	        HUD_COLOUR_GOLF_P1,
        147 = 	        HUD_COLOUR_GOLF_P2,
        148 = 	        HUD_COLOUR_GOLF_P3,
        149 = 	        HUD_COLOUR_GOLF_P4,
        150 = 	        HUD_COLOUR_WAYPOINTLIGHT,
        151 = 	        HUD_COLOUR_WAYPOINTDARK,
        152 = 	        HUD_COLOUR_PANEL_LIGHT,
        153 = 	        HUD_COLOUR_MICHAEL_DARK,
        154 = 	        HUD_COLOUR_FRANKLIN_DARK,
        155 = 	        HUD_COLOUR_TREVOR_DARK,
        156 = 	        HUD_COLOUR_OBJECTIVE_ROUTE,
        157 = 	        HUD_COLOUR_PAUSEMAP_TINT,
        158 = 	        HUD_COLOUR_PAUSE_DESELECT,
        159 = 	        HUD_COLOUR_PM_WEAPONS_PURCHASABLE,
        160 = 	        HUD_COLOUR_PM_WEAPONS_LOCKED,
        161 = 	        HUD_COLOUR_END_SCREEN_BG,
        162 = 	        HUD_COLOUR_CHOP,
        163 = 	        HUD_COLOUR_PAUSEMAP_TINT_HALF,
        164 = 	        HUD_COLOUR_NORTH_BLUE_OFFICIAL,
        165 = 	        HUD_COLOUR_SCRIPT_VARIABLE_2,
        166 = 	        HUD_COLOUR_H,
        167 = 	        HUD_COLOUR_HDARK,
        168 = 	        HUD_COLOUR_T,
        169 = 	        HUD_COLOUR_TDARK,
        170 = 	        HUD_COLOUR_HSHARD,
        171 = 	        HUD_COLOUR_CONTROLLER_MICHAEL,
        172 = 	        HUD_COLOUR_CONTROLLER_FRANKLIN,
        173 = 	        HUD_COLOUR_CONTROLLER_TREVOR,
        174 = 	        HUD_COLOUR_CONTROLLER_CHOP,
        175 = 	        HUD_COLOUR_VIDEO_EDITOR_VIDEO,
        176 = 	        HUD_COLOUR_VIDEO_EDITOR_AUDIO,
        177 = 	        HUD_COLOUR_VIDEO_EDITOR_TEXT,
        178 = 	        HUD_COLOUR_HB_BLUE,
        179 = 	        HUD_COLOUR_HB_YELLOW,
        180 = 	        HUD_COLOUR_VIDEO_EDITOR_SCORE,
        181 = 	        HUD_COLOUR_VIDEO_EDITOR_AUDIO_FADEOUT,
        182 = 	        HUD_COLOUR_VIDEO_EDITOR_TEXT_FADEOUT,
        183 = 	        HUD_COLOUR_VIDEO_EDITOR_SCORE_FADEOUT,
        184 = 	        HUD_COLOUR_HEIST_BACKGROUND,
        185 = 	        HUD_COLOUR_VIDEO_EDITOR_AMBIENT,
        186 = 	        HUD_COLOUR_VIDEO_EDITOR_AMBIENT_FADEOUT,
        187 = 	        HUD_COLOUR_GB,
        188 = 	        HUD_COLOUR_G,
        189 = 	        HUD_COLOUR_B,
        190 = 	        HUD_COLOUR_LOW_FLOW,
        191 = 	        HUD_COLOUR_LOW_FLOW_DARK,
        192 = 	        HUD_COLOUR_G1,
        193 = 	        HUD_COLOUR_G2,
        194 = 	        HUD_COLOUR_G3,
        195 = 	        HUD_COLOUR_G4,
        196 = 	        HUD_COLOUR_G5,
        197 = 	        HUD_COLOUR_G6,
        198 = 	        HUD_COLOUR_G7,
        199 = 	        HUD_COLOUR_G8,
        200 = 	        HUD_COLOUR_G9,
        201 = 	        HUD_COLOUR_G10,
        202 = 	        HUD_COLOUR_G11,
        203 = 	        HUD_COLOUR_G12,
        204 = 	        HUD_COLOUR_G13,
        205 = 	        HUD_COLOUR_G14,
        206 = 	        HUD_COLOUR_G15,
        207 = 	        HUD_COLOUR_ADVERSARY,
        208 = 	        HUD_COLOUR_DEGEN_RED,
        209 = 	        HUD_COLOUR_DEGEN_YELLOW,
        210 = 	        HUD_COLOUR_DEGEN_GREEN,
        211 = 	        HUD_COLOUR_DEGEN_CYAN,
        212 = 	        HUD_COLOUR_DEGEN_BLUE,
        213 = 	        HUD_COLOUR_DEGEN_MAGENTA,
        214 = 	        HUD_COLOUR_STUNT_1,
        215 = 	        HUD_COLOUR_STUNT_2
    
    
    Player Icons:
        * NONE = 0,
        * VOICE_ACTIVE = 47,
        * VOICE_IDLE = 48,
        * VOICE_MUTED = 49,
        * GTA_V_LOGO = 54,
        * GLOBE = 63,
        * KICK_BOOT = 64,
        * FREEMODE_RANK = 65,
        * SPECTATOR_EYE = 66,
        * GAME_PAD = 119,
        * MOUSE = 120
]]--