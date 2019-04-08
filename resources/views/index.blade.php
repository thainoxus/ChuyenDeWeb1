@extends('layouts.app')
@section('content')
<main>
        <div class="container">
            <section>
                <h3>Flight Booking</h3>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form role="form" action="{{route('flight-list')}}" method="GET">
                            
                            <div class="row">
                                <div class="col-sm-4">
                                    <h4 class="form-heading">1. Flight Destination</h4>
                                    <div class="form-group">
                                        <label class="control-label">From: </label>
                                        <select class="form-control" name="from" id="from">
                                            @foreach ($cities as $city)
                                                <option value="{{$city->id}}">{{$city->name_city}}  ({{$city->code_city}})</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">To: </label>
                                        <select class="form-control" name="to" id="to">
                                            @foreach ($cities as $city)
                                                <option value="{{$city->id}}">{{$city->name_city}}  ({{$city->code_city}})</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <h4 class="form-heading">2. Date of Flight</h4>
                                   <div class="form-group">
                                        <label class="control-label">Departure: </label>
                                         <?php $date_now = date('Y-m-d'); ?>
                                        <input  type="date" name="departure" id="departure" value="<?php echo $date_now ?>" class="form-control"  class="datepicker">
                                    </div>
                                    <div class="form-group">
                                        <div class="radio">
                                            <label><input type="radio" id="One_Way" name="flight_type" checked value="one-way">One Way</label>
                                            <label><input type="radio" id="Return" name="flight_type" value="return">Return</label>
                                        </div>
                                    </div>
                                    <div class="form-group" id="Return_input">
                                        <label class="control-label">Return: </label>
                                        <input id="return_day" name="return_day" type="date" class="form-control" placeholder="Choose Return Date">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <h4 class="form-heading">3. Search Flights</h4>
                                    <div class="form-group">
                                        <label class="control-label">Total Person: </label>
                                        <select id="total-person" name="total_person" class="form-control">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Flight Class: </label>
                                        <select class="form-control" id="flight-class" name="flight-class">
                                            @foreach ($Flight_class as $Flight_class)
                                                <option value="{{$Flight_class->id_class}}">{{$Flight_class->name_class}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button  type="submit" class="btn btn-primary btn-block" id="btnSearch">Search Flights</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
        <div class="container">
            <section>
                <h3>ALL Flight List</h3>
                <article>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4><strong><a href="flight-detail.php">Qatar Airways</a></strong></h4>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label class="control-label">From:</label>
                                            <div><big class="time"></big></div>
                                            <div><span class="place"></span></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">To:</label>
                                            <div><big class="time"></big></div>
                                            <div><span class="place"></span></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">Duration:</label>
                                            <div><big class="time">11h 10m</big></div>
                                            <div><strong class="text-danger">1 Transit</strong></div>
                                        </div>
                                        <div class="col-sm-3 text-right">
                                            <h3 class="price text-danger"><strong>IDR8.265.550,00</strong></h3>
                                            <div>
                                                <a href="flight-detail.php" class="btn btn-link">See Detail</a>
                                                <a href="flight-book.php" class="btn btn-primary">Choose</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">&lsaquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">&rsaquo;</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </section>
        </div>
        </main>
@endsection

