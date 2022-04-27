//-----------------------------------------------------------------------------
// Stage types
ERROR <- -1
PANIC <- 0
TANK <- 1
DELAY <- 2
ONSLAUGHT <- 3

// Constants
ESCAPE_STAGE <- 20

//-----------------------------------------------------------------------------
// Initialization of tables that will be fed to DirectorOptions
 
DirectorOptions <-
{
  // Additional Director options
  ShouldConstrainLargeVolumeSpawn = false
    
  TankLimit = 30
  WitchLimit = 0
  CommonLimit = 70
  SmokerLimit = 0
  SpitterLimit = 0
  HunterLimit = 0
  JockeyLimit = 0
  BoomerLimit = 0
  ChargerLimit = 0
  ShouldAllowSpecialsWithTank = false
  PreferredMobDirection = SPAWN_ANYWHERE
  PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
  SpawnSetRule = SPAWN_FINALE

  A_CustomFinale_StageCount = ESCAPE_STAGE

  A_CustomFinale1 = TANK
  A_CustomFinaleValue1 = 1
  A_CustomFinale2 = DELAY
  A_CustomFinaleValue2 = 10

  A_CustomFinale3 = TANK
  A_CustomFinaleValue3 = 2
  A_CustomFinale4 = DELAY
  A_CustomFinaleValue4 = 10

  A_CustomFinale5 = TANK
  A_CustomFinaleValue5 = 3
  A_CustomFinale6 = DELAY
  A_CustomFinaleValue6 = 15

  A_CustomFinale7 = TANK
  A_CustomFinaleValue7 = 4
  A_CustomFinale8 = DELAY
  A_CustomFinaleValue8 = 20

  A_CustomFinale9 = TANK
  A_CustomFinaleValue9 = 5
  A_CustomFinale10 = DELAY
  A_CustomFinaleValue10 = 20

  A_CustomFinale11 = TANK
  A_CustomFinaleValue11 = 6
  A_CustomFinale12 = DELAY
  A_CustomFinaleValue12 = 30

  A_CustomFinale13 = TANK
  A_CustomFinaleValue13 = 7
  A_CustomFinale14 = DELAY
  A_CustomFinaleValue14 = 30

  A_CustomFinale15 = TANK
  A_CustomFinaleValue15 = 8
  A_CustomFinale16 = DELAY
  A_CustomFinaleValue16 = 35

  A_CustomFinale17 = TANK
  A_CustomFinaleValue17 = 9
  A_CustomFinale18 = DELAY
  A_CustomFinaleValue18 = 40

  A_CustomFinale19 = TANK
  A_CustomFinaleValue19 = 10

  A_CustomFinale20 = PANIC
  A_CustomFinaleValue20 = 3
}

//-----------------------------------------------------------------------------
// Functions / Events

function OnBeginCustomFinaleStage(num, type)
{
  RoundNumber <- floor(num / 2) + 1;

  if (type == DELAY)
  {
    // Spawn stuff ----------------------------------------

    // Every round
    EntFire("case_pills_or_adrenaline", "PickRandom");
    EntFire("template_molotov", "ForceSpawn");

    if (RoundNumber > 7) {
      EntFire("case_pills_or_adrenaline", "PickRandom");
      EntFire("template_molotov", "ForceSpawn");
      EntFire("case_random_molotov", "PickRandom");
    }

    if (RoundNumber % 2 == 0) {
      // Every 2 rounds
      EntFire("case_spawn_explosive_or_incendiary", "PickRandom");
      EntFire("case_pills_or_adrenaline", "PickRandom");
      EntFire("template_kit", "ForceSpawn");
    }

    if (RoundNumber % 3 == 0) {
      // Every 3 rounds
      EntFire("template_molotov", "ForceSpawn");
      EntFire("case_spawn_m60_or_grenade", "PickRandom");
    }

    if (RoundNumber % 4 == 0) {
      // Every 4 rounds
      EntFire("case_spawn_m60_or_grenade", "PickRandom");
      EntFire("case_spawn_m60_or_grenade", "PickRandom");
      EntFire("template_kit", "ForceSpawn");
    }

    if (RoundNumber % 5 == 0) {
      // Every 5 rounds
      EntFire("template_molotov", "ForceSpawn");
    }
    
    if (RoundNumber == 2 || RoundNumber == 5 || RoundNumber == 7 || RoundNumber == 10) {
      EntFire("template_defib", "ForceSpawn");
    }

    // Open the stashes -----------------------------------
    EntFire("relay_stash_open_all_stuff", "Trigger");

    // Miniguns -------------------------------------------
    if (RoundNumber == 9) {
      EntFire("relay_miniguns_open", "Trigger");
    }
  } else {
    EntFire("relay_stash_close_all", "Trigger");
    EntFire("director", "BeginScript", "l4d2_tank_challenge_drowned_players");
    EntFire("case_random_molotov", "PickRandom");
  }
  
  if (num == ESCAPE_STAGE) {
    // Escape
    EntFire("timer_delay_before_rescue", "Enable");
  } else if(num < ESCAPE_STAGE) {
    UpdateRoundCounter(RoundNumber);  
  }
}

function UpdateRoundCounter(number) {
  LeftNumber <- floor(number / 10);
  EntFire("round_number_left_" + LeftNumber, "Enable");
  EntFire("round_number_left_" + GetPreviousNumber(LeftNumber), "Disable");

  RightNumber <- number % 10;
  EntFire("round_number_right_" + RightNumber, "Enable");
  EntFire("round_number_right_" + GetPreviousNumber(RightNumber), "Disable");
}

function GetPreviousNumber(CounterNumber) {
  PreviousNumber <- CounterNumber - 1;

  if (PreviousNumber == -1) {
    PreviousNumber <- 9;
  }
  
  return PreviousNumber;
}