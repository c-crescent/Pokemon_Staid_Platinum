#include "macros/scrcmd.inc"
#include "res/text/bank/fullmoon_island_forest.h"
#include "res/field/events/events_fullmoon_island_forest.h"


    ScriptEntry FullmoonIslandForest_Dummy1
    ScriptEntry FullmoonIslandForest_Cresselia
    ScriptEntryEnd

FullmoonIslandForest_Dummy1:
    End

FullmoonIslandForest_Cresselia:
    PlaySE SE_CONFIRM_sseq_3
    LockAll
    FacePlayer
    PlayCry SPECIES_CRESSELIA
    Message FullmoonIslandForest_Text_CresseliaCry
    CloseMessage
    SetFlag FLAG_HIDE_FULLMOON_ISLAND_FOREST_CRESSELIA
    RemoveObject LOCALID_CRESSELIA
    StartLegendaryBattle SPECIES_CRESSELIA, 60
    CheckWonBattle VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, FullmoonIslandForest_LostBattle
    ClearFlag FLAG_OBTAINED_FULLMOON_ISLAND_FOREST_LUNAR_WING
    SetFlag FLAG_MET_CRESSELIA
    CheckDidNotCapture VAR_RESULT
    GoToIfEq VAR_RESULT, TRUE, FullmoonIslandForest_CresseliaDisappeared
    SetVar VAR_ROAMING_CRESSELIA_STATE, ROAMER_STATE_CAPTURED
    CallIfUnset FLAG_WOKE_UP_CANALAVE_CITY_SAILOR_ELDRITCH_HOUSE_LITTLE_BOY,FullmoonIslandForest_CresseliaMoveAwayForLunarWing
    ReleaseAll
    End

FullmoonIslandForest_CresseliaDisappeared:
    SetVar VAR_ROAMING_CRESSELIA_STATE, ROAMER_STATE_DEFEATED
    Message FullmoonIslandForest_Text_CresseliaDisappeared
    WaitButton
    CloseMessage
    CallIfUnset FLAG_WOKE_UP_CANALAVE_CITY_SAILOR_ELDRITCH_HOUSE_LITTLE_BOY,FullmoonIslandForest_CresseliaMoveAwayForLunarWing
    ReleaseAll
    End

FullmoonIslandForest_LostBattle:
    BlackOutFromBattle
    ReleaseAll
    End

    .balign 4, 0

FullmoonIslandForest_CresseliaMoveAwayForLunarWing:
    SetObjectEventPos LOCALID_ITEM_LUNAR_WING, 16, 14
    AddObject LOCALID_ITEM_LUNAR_WING    
    Message FullmoonIslandForest_Text_SomethingSparkling
    WaitButton
    CloseMessage
    Return
