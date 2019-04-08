<?php

namespace App\Http\Controllers;

use App\Model\Flight_list;

class FlightListController extends Controller {

    public function index() {
        $flights = Flight_list::all();
        return view('/flight-list', ['flights' => $flights]);
    }
    
 

}
