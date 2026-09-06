#include "macros/scrcmd.inc"
#include "res/text/bank/menu_entries.h"
#include "generated/tutor_locations.h"
#include "res/text/bank/survival_area_north_house.h"


    ScriptEntry SurvivalAreaNorthHouse_Psychic
    ScriptEntry SurvivalAreaNorthHouse_Cynthia
    ScriptEntry SurvivalAreaNorthHouse_Book
    ScriptEntryEnd

SurvivalAreaNorthHouse_Psychic:
    NPCMessage SurvivalAreaNorthHouse_Text_LookingForwardToVisitors
    End

SurvivalAreaNorthHouse_Cynthia:
    PlaySE SEQ_SE_CONFIRM
    LockAll
    FacePlayer
    CallIfSet FLAG_FIRST_MET_CYNTHIA_SURVIVAL_AREA, SurvivalAreaNorthHouse_Cynthia_TryEncounter
    Message SurvivalAreaNorthHouse_Cynthia_Greeting
    SetFlag FLAG_FIRST_MET_CYNTHIA_SURVIVAL_AREA
    GoTo SurvivalAreaNorthHouse_Cynthia_TryEncounter

SurvivalAreaNorthHouse_Cynthia_TryEncounter:
    Message SurvivalAreaNorthHouse_Cynthia_TryEncounter
    InitGlobalTextMenu 1, 1, 0, VAR_RESULT
    AddMenuEntryImm MenuEntries_Text_Kanto, 0
    AddMenuEntryImm MenuEntries_Text_Johto, 1
    AddMenuEntryImm MenuEntries_Text_Hoenn, 2
    AddMenuEntryImm MenuEntries_Text_BattleTower_Cancel, 3
    ShowMenu
    SetVar VAR_0x8008, VAR_RESULT
    GoToIfEq VAR_0x8008, 0, SurvivalAreaNorthHouse_Cynthia_KantoMenu
    GoToIfEq VAR_0x8008, 1, SurvivalAreaNorthHouse_Cynthia_JohtoMenu
    GoToIfEq VAR_0x8008, 2, SurvivalAreaNorthHouse_Cynthia_HoennMenu
    CloseMessage
    ReleaseAll
    End

SurvivalAreaNorthHouse_Cynthia_KantoMenu:
    InitGlobalTextMenu 1, 1, 0, VAR_RESULT
    AddMenuEntryImm MenuEntries_Text_Mewtwo, 0
    AddMenuEntryImm MenuEntries_Text_Back, 1
    ShowMenu
    SetVar VAR_0x8008, VAR_RESULT
    GoToIfEq VAR_0x8008, 0, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterMewtwo
    GoTo SurvivalAreaNorthHouse_Cynthia_TryEncounter

SurvivalAreaNorthHouse_Cynthia_JohtoMenu:
    InitGlobalTextMenu 1, 1, 0, VAR_RESULT
    AddMenuEntryImm MenuEntries_Text_Raikou, 0
    AddMenuEntryImm MenuEntries_Text_Entei, 1
    AddMenuEntryImm MenuEntries_Text_Suicune, 2
    AddMenuEntryImm MenuEntries_Text_Lugia, 3
    AddMenuEntryImm MenuEntries_Text_Hooh, 4
    AddMenuEntryImm MenuEntries_Text_Celebi, 5
    AddMenuEntryImm MenuEntries_Text_Back, 6
    ShowMenu
    SetVar VAR_0x8008, VAR_RESULT
    GoToIfEq VAR_0x8008, 0, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterRaikou
    GoToIfEq VAR_0x8008, 1, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterEntei
    GoToIfEq VAR_0x8008, 2, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterSuicune
    GoToIfEq VAR_0x8008, 3, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLugia
    GoToIfEq VAR_0x8008, 4, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterHoOh
    GoToIfEq VAR_0x8008, 5, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterCelebi
    GoTo SurvivalAreaNorthHouse_Cynthia_TryEncounter

SurvivalAreaNorthHouse_Cynthia_HoennMenu:
    InitGlobalTextMenu 1, 1, 0, VAR_RESULT
    AddMenuEntryImm MenuEntries_Text_Latias, 0
    AddMenuEntryImm MenuEntries_Text_Latios, 1
    AddMenuEntryImm MenuEntries_Text_Kyogre, 2
    AddMenuEntryImm MenuEntries_Text_Groudon, 3
    AddMenuEntryImm MenuEntries_Text_Rayquaza, 4
    AddMenuEntryImm MenuEntries_Text_Jirachi, 5
    AddMenuEntryImm MenuEntries_Text_Deoxys, 6
    AddMenuEntryImm MenuEntries_Text_Back, 7
    ShowMenu
    SetVar VAR_0x8008, VAR_RESULT
    GoToIfEq VAR_0x8008, 0, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLatias
    GoToIfEq VAR_0x8008, 1, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLatios
    GoToIfEq VAR_0x8008, 2, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterKyogre
    GoToIfEq VAR_0x8008, 3, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterGroudon
    GoToIfEq VAR_0x8008, 4, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterRayquaza
    GoToIfEq VAR_0x8008, 5, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterJirachi
    GoToIfEq VAR_0x8008, 6, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterDeoxys
    GoTo SurvivalAreaNorthHouse_Cynthia_TryEncounter

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterMewtwo:
    CallIfSet FLAG_CAUGHT_MEWTWO, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_MEWTWO, BattleArcade_SurvivalAreaNorthHouse_Cynthia_MewtwoDisappeared
    PlayCry SPECIES_MEWTWO
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_MEWTWO, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_MewtwoDisappeared
    SetFlag FLAG_CAUGHT_MEWTWO
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterRaikou:
    CallIfSet FLAG_CAUGHT_RAIKOU, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_RAIKOU, BattleArcade_SurvivalAreaNorthHouse_Cynthia_RaikouDisappeared
    PlayCry SPECIES_RAIKOU
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_RAIKOU, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_RaikouDisappeared
    SetFlag FLAG_CAUGHT_RAIKOU
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterEntei:
    CallIfSet FLAG_CAUGHT_ENTEI, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_ENTEI, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EnteiDisappeared
    PlayCry SPECIES_ENTEI
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_ENTEI, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_EnteiDisappeared
    SetFlag FLAG_CAUGHT_ENTEI
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterSuicune:
    CallIfSet FLAG_CAUGHT_SUICUNE, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_SUICUNE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_SuicuneDisappeared
    PlayCry SPECIES_SUICUNE
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_SUICUNE, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_SuicuneDisappeared
    SetFlag FLAG_CAUGHT_SUICUNE
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLugia:
    CallIfSet FLAG_CAUGHT_LUGIA, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_LUGIA, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LugiaDisappeared
    PlayCry SPECIES_LUGIA
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_LUGIA, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LugiaDisappeared
    SetFlag FLAG_CAUGHT_LUGIA
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterHoOh:
    CallIfSet FLAG_CAUGHT_HOOH, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_HOOH, BattleArcade_SurvivalAreaNorthHouse_Cynthia_HoOhDisappeared
    PlayCry SPECIES_HO_OH
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_HO_OH, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_HoOhDisappeared
    SetFlag FLAG_CAUGHT_HOOH
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterCelebi:
    CallIfSet FLAG_CAUGHT_CELEBI, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_CELEBI, BattleArcade_SurvivalAreaNorthHouse_Cynthia_CelebiDisappeared
    PlayCry SPECIES_CELEBI
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_CELEBI, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_CelebiDisappeared
    SetFlag FLAG_CAUGHT_CELEBI
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLatias:
    CallIfSet FLAG_CAUGHT_LATIAS, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_LATIAS, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiasDisappeared
    PlayCry SPECIES_LATIAS
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_LATIAS, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiasDisappeared
    SetFlag FLAG_CAUGHT_LATIAS
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterLatios:
    CallIfSet FLAG_CAUGHT_LATIOS, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_LATIOS, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiosDisappeared
    PlayCry SPECIES_LATIOS
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_LATIOS, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiosDisappeared
    SetFlag FLAG_CAUGHT_LATIOS
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterKyogre:
    CallIfSet FLAG_CAUGHT_KYOGRE, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_KYOGRE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_KyogreDisappeared
    PlayCry SPECIES_KYOGRE
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_KYOGRE, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_KyogreDisappeared
    SetFlag FLAG_CAUGHT_KYOGRE
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterGroudon:
    CallIfSet FLAG_CAUGHT_GROUDON, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_GROUDON, BattleArcade_SurvivalAreaNorthHouse_Cynthia_GroudonDisappeared
    PlayCry SPECIES_GROUDON
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_GROUDON, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_GroudonDisappeared
    SetFlag FLAG_CAUGHT_GROUDON
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterRayquaza:
    CallIfSet FLAG_CAUGHT_RAYQUAZA, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_RAYQUAZA, BattleArcade_SurvivalAreaNorthHouse_Cynthia_RayquazaDisappeared
    PlayCry SPECIES_RAYQUAZA
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_RAYQUAZA, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_RayquazaDisappeared
    SetFlag FLAG_CAUGHT_RAYQUAZA
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterJirachi:
    CallIfSet FLAG_CAUGHT_JIRACHI, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_JIRACHI, BattleArcade_SurvivalAreaNorthHouse_Cynthia_JirachiDisappeared
    PlayCry SPECIES_JIRACHI
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_JIRACHI, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_JirachiDisappeared
    SetFlag FLAG_CAUGHT_JIRACHI
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EncounterDeoxys:
    CallIfSet FLAG_CAUGHT_DEOXYS, SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    GoToIfSet FLAG_GONE_DEOXYS, BattleArcade_SurvivalAreaNorthHouse_Cynthia_DeoxysDisappeared
    PlayCry SPECIES_DEOXYS
    Message SurvivalAreaNorthHouse_Cynthia_PrepareYourself
    StartLegendaryBattle SPECIES_DEOXYS, 70
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, SurvivalAreaNorthHouse_LostBattle
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, BattleArcade_SurvivalAreaNorthHouse_Cynthia_DeoxysDisappeared
    SetFlag FLAG_CAUGHT_DEOXYS
    GoTo BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught

BattleArcade_SurvivalAreaNorthHouse_Cynthia_MewtwoDisappeared:
    SetFlag FLAG_GONE_MEWTWO
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_RaikouDisappeared:
    SetFlag FLAG_GONE_RAIKOU
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_EnteiDisappeared:
    SetFlag FLAG_GONE_ENTEI
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_SuicuneDisappeared:
    SetFlag FLAG_GONE_SUICUNE
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_LugiaDisappeared:
    SetFlag FLAG_GONE_LUGIA
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_HoOhDisappeared:
    SetFlag FLAG_GONE_HOOH
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_CelebiDisappeared:
    SetFlag FLAG_GONE_CELEBI
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiasDisappeared:
    SetFlag FLAG_GONE_LATIAS
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_LatiosDisappeared:
    SetFlag FLAG_GONE_LATIOS
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_KyogreDisappeared:
    SetFlag FLAG_GONE_KYOGRE
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_GroudonDisappeared:
    SetFlag FLAG_GONE_GROUDON
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_RayquazaDisappeared:
    SetFlag FLAG_GONE_RAYQUAZA
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_JirachiDisappeared:
    SetFlag FLAG_GONE_JIRACHI
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_DeoxysDisappeared:
    SetFlag FLAG_GONE_DEOXYS
    Message SurvivalAreaNorthHouse_Cynthia_PokemonDisappeared
    CloseMessage
    ReleaseAll
    End

BattleArcade_SurvivalAreaNorthHouse_Cynthia_PokemonCaught:
    Message SurvivalAreaNorthHouse_Cynthia_PokemonCaught
    CloseMessage
    ReleaseAll
    End

SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught:
    Message SurvivalAreaNorthHouse_Cynthia_PokemonAlreadyCaught
    CloseMessage
    ReleaseAll
    End

SurvivalAreaNorthHouse_LostBattle:
    BlackOutFromBattle
    ReleaseAll
    End

SurvivalAreaNorthHouse_Book:
    EventMessage SurvivalAreaNorthHouse_Text_ShardColorsEmphasize
    End