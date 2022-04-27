//-----------------------------------------------------------------------------
// Stage types
ERROR <- -1
PANIC <- 0
TANK <- 1
DELAY <- 2
ONSLAUGHT <- 3

// Constants
ESCAPE_STAGE <- 60

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
  A_CustomFinale20 = DELAY
  A_CustomFinaleValue20 = 40

  A_CustomFinale21 = TANK
  A_CustomFinaleValue21 = 11
  A_CustomFinale22 = DELAY
  A_CustomFinaleValue22 = 40

  A_CustomFinale23 = TANK
  A_CustomFinaleValue23 = 12
  A_CustomFinale24 = DELAY
  A_CustomFinaleValue24 = 40

  A_CustomFinale25 = TANK
  A_CustomFinaleValue25 = 13
  A_CustomFinale26 = DELAY
  A_CustomFinaleValue26 = 40

  A_CustomFinale27 = TANK
  A_CustomFinaleValue27 = 14
  A_CustomFinale28 = DELAY
  A_CustomFinaleValue28 = 40

  A_CustomFinale29 = TANK
  A_CustomFinaleValue29 = 15
  A_CustomFinale30 = DELAY
  A_CustomFinaleValue30 = 40

  A_CustomFinale31 = TANK
  A_CustomFinaleValue31 = 16
  A_CustomFinale32 = DELAY
  A_CustomFinaleValue32 = 40

  A_CustomFinale33 = TANK
  A_CustomFinaleValue33 = 17
  A_CustomFinale34 = DELAY
  A_CustomFinaleValue34 = 40

  A_CustomFinale35 = TANK
  A_CustomFinaleValue35 = 18
  A_CustomFinale36 = DELAY
  A_CustomFinaleValue36 = 40

  A_CustomFinale37 = TANK
  A_CustomFinaleValue37 = 19
  A_CustomFinale38 = DELAY
  A_CustomFinaleValue38 = 40

  A_CustomFinale39 = TANK
  A_CustomFinaleValue39 = 20
  A_CustomFinale40 = DELAY
  A_CustomFinaleValue40 = 40

  A_CustomFinale41 = TANK
  A_CustomFinaleValue41 = 21
  A_CustomFinale42 = DELAY
  A_CustomFinaleValue42 = 40

  A_CustomFinale43 = TANK
  A_CustomFinaleValue43 = 22
  A_CustomFinale44 = DELAY
  A_CustomFinaleValue44 = 40

  A_CustomFinale45 = TANK
  A_CustomFinaleValue45 = 23
  A_CustomFinale46 = DELAY
  A_CustomFinaleValue46 = 40

  A_CustomFinale47 = TANK
  A_CustomFinaleValue47 = 24
  A_CustomFinale48 = DELAY
  A_CustomFinaleValue48 = 40

  A_CustomFinale49 = TANK
  A_CustomFinaleValue49 = 25
  A_CustomFinale50 = DELAY
  A_CustomFinaleValue50 = 40

  A_CustomFinale51 = TANK
  A_CustomFinaleValue51 = 26
  A_CustomFinale52 = DELAY
  A_CustomFinaleValue52 = 40

  A_CustomFinale53 = TANK
  A_CustomFinaleValue53 = 27
  A_CustomFinale54 = DELAY
  A_CustomFinaleValue54 = 40

  A_CustomFinale55 = TANK
  A_CustomFinaleValue55 = 28
  A_CustomFinale56 = DELAY
  A_CustomFinaleValue56 = 40

  A_CustomFinale57 = TANK
  A_CustomFinaleValue57 = 29
  A_CustomFinale58 = DELAY
  A_CustomFinaleValue58 = 40

  A_CustomFinale59 = TANK
  A_CustomFinaleValue59 = 30
  
  A_CustomFinale60 = PANIC
  A_CustomFinaleValue60 = 3
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

    if (RoundNumber > 10) {
      EntFire("case_pills_or_adrenaline", "PickRandom");
      EntFire("template_molotov", "ForceSpawn");
      EntFire("case_random_molotov", "PickRandom");

      if (RoundNumber > 12) {
        EntFire("case_pills_or_adrenaline", "PickRandom");
        EntFire("template_kit", "ForceSpawn");
        EntFire("case_random_molotov", "PickRandom");

        if (RoundNumber > 20) {
          EntFire("case_pills_or_adrenaline", "PickRandom");
          EntFire("template_molotov", "ForceSpawn");
          EntFire("case_random_molotov", "PickRandom");
        }
      }
    }

    if (RoundNumber % 2 == 0) {
      // Every 2 rounds
      EntFire("case_spawn_explosive_or_incendiary", "PickRandom");
      EntFire("case_pills_or_adrenaline", "PickRandom");
      EntFire("template_kit", "ForceSpawn");

      if (RoundNumber > 15) {
        EntFire("template_kit", "ForceSpawn");
      }
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

    if (RoundNumber == 2 || RoundNumber == 5 || RoundNumber == 7 || RoundNumber == 10 || RoundNumber == 12 || RoundNumber == 15 || RoundNumber == 20 || RoundNumber == 25 || RoundNumber == 30) {
      EntFire("template_defib", "ForceSpawn");
    }

    // Open the stashes -----------------------------------
    EntFire("relay_stash_open_all_stuff", "Trigger");
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

  if(PreviousNumber == -1) {
    PreviousNumber <- 9;
  }
  
  return PreviousNumber;
}
