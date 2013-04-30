// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-


void set_home_is_set(bool b)
{
    // if no change, exit immediately
    if( ap.home_is_set == b )
        return;

    ap.home_is_set 	= b;
    if(b) {
        Log_Write_Event(DATA_SET_HOME);
    }
}

// ---------------------------------------------
void set_armed(bool b)
{
    // if no change, exit immediately
    if( ap.armed == b )
        return;

    ap.armed = b;
    if(b){
        Log_Write_Event(DATA_ARMED);
    }else{
        Log_Write_Event(DATA_DISARMED);
    }
}

// ---------------------------------------------
void set_auto_armed(bool b)
{
    // if no change, exit immediately
    if( ap.auto_armed == b )
        return;

    ap.auto_armed = b;
    if(b){
        Log_Write_Event(DATA_AUTO_ARMED);
    }
}

// ---------------------------------------------
void set_simple_mode(bool b)
{}

// ---------------------------------------------
static void set_failsafe_radio(bool mode)
{}


// ---------------------------------------------
void set_low_battery(bool b)
{
    ap.low_battery = b;
}


// ---------------------------------------------
static void set_failsafe_gps(bool mode)
{
    ap.failsafe_gps = mode;
}

// ---------------------------------------------
static void set_failsafe_gcs(bool mode)
{
    ap.failsafe_gcs = mode;
}

// ---------------------------------------------
void set_takeoff_complete(bool b)
{
    // if no change, exit immediately
    if( ap.takeoff_complete == b )
        return;

    if(b){
        Log_Write_Event(DATA_TAKEOFF);
    }
    ap.takeoff_complete = b;
}

// ---------------------------------------------
void set_land_complete(bool b)
{
}

// ---------------------------------------------

void set_compass_healthy(bool b)
{
    if(ap.compass_status != b){
        if(false == b){
            Log_Write_Event(DATA_LOST_COMPASS);
        }
    }
    ap.compass_status = b;
}

void set_gps_healthy(bool b)
{
    if(ap.gps_status != b){
        if(false == b){
            Log_Write_Event(DATA_LOST_GPS);
        }
    }
    ap.gps_status = b;
}

void dump_state()
{
    cliSerial->printf("st: %u\n",ap.value);
}
