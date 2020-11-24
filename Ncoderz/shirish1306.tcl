#=====================================================================#
# Author:- Shirish Parsekar                                           #
# Description:-Bike Showroom UI in Tcl/Tk (Compare Bike Moudle)       #
# Date Created:-15/10/2013                                            #
# Date Modified:-26/10/2013                            		      #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd    		      #
#=====================================================================#
################================COMPARISON============###########
proc compared {} {

destroy .f .frame2
frame .f
frame .frame2

#package require mysqltcl
#set mysql_handler [mysqlconnect -host {localhost} -user {root} -password {nop} ]
#mysqluse $mysql_handler {Bike_Showroom}
global mysql_handler
##############################
set result "[ mysqlsel $mysql_handler {select  Model_num,Bike_variation,Bike_model from Bike_Showroom.Bike_model } -list ]"
##############################
global selected1
global selected2
set selected1 0

set selected2 0


proc setsel1 {text} {
    .sel1 configure -text "BIKE 1: $text"
    global selected1
    global selected2
    set selected1 $text
    upvar 1 $selected2 sel
    if { $selected2 !=0} {
      .but_ok configure -state active
    }
}
proc setsel2 {text} {
    .sel2 configure -text "BIKE 2: $text"
    global selected2
    global selected1
    set selected2 $text
    upvar 1 $selected1 sel
    if { $selected1 != 0 } {
      .but_ok configure -state active
    }
  #puts "$selected2"
    #global selected2
}
################################################
destroy .s .l .s2 .l2 .sel1 .sel2 .but_ok .but_can .lab1 .lab2 .blnk .blnkwd1 .b_ok
scrollbar .s -command ".l yview"
listbox .l -yscroll ".s set" -borderwidth 6 -selectborderwidth 3 -height 20
scrollbar .s2 -command ".l2 yview"
listbox .l2 -yscroll ".s2 set" -borderwidth 6 -selectborderwidth 3 -height 20

label .sel1 -text "BIKE 1: " -background black -foreground white
label .sel2 -text "BIKE 2: " -background black -foreground white

bind .l <Double-B1-ButtonRelease> {setsel1 [.l get active]}
bind .l2 <Double-B1-ButtonRelease> {setsel2 [.l2 get active]}

button .but_ok -text  "      OK     " -command "disp_comparison" -state disable
button .but_can -text "  CANCEL  " -command {
searchbike
pack forget .bikelist 
}

label .lab1 -text "Select Bike 1" -font {-size 12}
label .lab2 -text "Select Bike 2" -font {-size 12}
label .blnk -text    "             "
label .blnkwd1 -text "                                            "

grid .blnk -row 0 -column 0 -in .f
grid .blnk -row 0 -column 1 -in .f
grid .blnk -row 0 -column 2 -in .f
grid .blnk -row 0 -column 3 -in .f
grid .blnk -row 0 -column 4 -in .f
grid .blnk -row 0 -column 5 -in .f
grid .blnk -row 0 -column 6 -in .f
grid .blnk -row 1 -column 0 -in .f
grid .blnk -row 1 -column 1 -in .f
grid .lab1 -row 1 -column 2 -padx 150 -pady 20 -in .f
grid .blnk -row 1 -column 3 -in .f
grid .blnk -row 1 -column 4 -in .f
grid .lab2 -row 1 -column 5 -padx 150 -pady 20 -in .f
grid .blnk -row 2 -column 0 -in .f
grid .blnk -row 2 -column 1 -in .f
grid .l -row 2 -column 2 -sticky news -in .f
grid .s -row 2 -column 3 -sticky news -in .f
grid .blnk -row 2 -column 4 -in .f
grid .l2 -row 2 -column 5 -sticky nsew -in .f
grid .s2 -row 2 -column 6 -sticky news -in .f
grid .blnk -row 3 -column 0 -in .f
#grid .blnkwd1 -row 4 -column 1 -in .f
grid .sel1 -row 4 -column 2 -in .f
grid .sel2 -row 4 -column 5 -in .f
grid .but_ok -row 6 -column 4 -pady 20 -in .f
grid .but_can -row 7 -column 4 -in .f
pack .f

pack forget .selected .checkdetails .compare .feedbk .ret


####################################### to insert the database bike entries into the listbox
foreach row $result {
set line ""

       foreach field $row {
			set line "$line $field"
	}
      .l insert end "$line"
      
      .l2 insert end "$line"
}
#############################################################################################

button .b_ok -text "   CANCEL   " -command "b_ok"

proc gridClear {} {

}

proc disp_comparison {} {
  destroy .v .v1
  destroy .bk1 .bk2
  text .v -width 85 -height 40 -borderwidth 3
  text .v1 -width 85 -height 40 -borderwidth 3
  label .bk1 -text "BIKE : "
  label .bk2 -text "BIKE : "
  global selected1
  global selected2
  global mysql_handler      
  set fielder [split $selected1 { } ]
  lassign $fielder \
  variant1 modelno1 model1
  set fielder2 [split $selected2 { } ]
  lassign $fielder2 \
  variant2 modelno2 model2
 #######################
  set vent $modelno1
  set modeltable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Bike_model where Model_num='$vent'" -list]
  set enginetable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Engine where Model_num='$vent'" -list ]
  set vehicletable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Vehicle where Model_num='$vent'" -list ]
  set fueltable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Fuel_Tank where Model_num='$vent'" -list ]
  set suspentable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Suspension where Model_num='$vent'" -list ]
  set braketable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Brakes where Model_num='$vent'" -list ]
  set tyretable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Tyre where Model_num='$vent'" -list ]
  set electtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Electricals where Model_num='$vent'" -list ]
  set costtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Expenses where Model_num='$vent'" -list ]

  foreach row $modeltable {
  set mod "\nModel\t=> "
  set bname "BIKE : "
  set counter 0
  foreach field $row {
    if { $counter!=0 } {
      set mod "$mod $field"
      set bname "$bname $field"       
    }
    incr counter
  }
  
  .bk1 configure -text "$bname"
  .v insert end "$mod"
  }
  foreach row $enginetable {
  set mod "\n\n\nEngine: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $suspentable {
set mod "\n\n\nSuspension: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $fueltable {
set mod "\n\n\nFuel: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $braketable {
set mod "\n\n\nBrake: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $tyretable {
set mod "\n\n\nTyre: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $electtable {
set mod "\n\n\nElectricals: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $costtable {
set mod "\n\n\nExpenses: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}

set ven $modelno2
set modeltable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Bike_model where Model_num='$ven'" -list]
set enginetable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Engine where Model_num='$ven'" -list ]
set vehicletable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Vehicle where Model_num='$ven'" -list ]
set fueltable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Fuel_Tank where Model_num='$ven'" -list ]
set suspentable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Suspension where Model_num='$ven'" -list ]
set braketable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Brakes where Model_num='$ven'" -list ]
set tyretable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Tyre where Model_num='$ven'" -list ]
set electtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Electricals where Model_num='$ven'" -list ]
set costtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Expenses where Model_num='$ven'" -list ]


foreach row $modeltable {
set mod "\nModel\t=> "
     set bname "BIKE : "
     set counter 0
       foreach field $row {
         if { $counter!=0 } {
           set mod "$mod $field"       
           set bname "$bname $field"
         }
         incr counter
       }
      .bk2 configure -text $bname
      .v1 insert end "$mod"
}
foreach row $enginetable {
set mod "\n\n\nEngine: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $suspentable {
set mod "\n\n\nSuspension: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $fueltable {
set mod "\n\n\nFuel: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $braketable {
set mod "\n\n\nBrake: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $tyretable {
set mod "\n\n\nTyre: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $electtable {
set mod "\n\n\nElectricals: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
foreach row $costtable {
set mod "\n\n\nExpenses: \n"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v1 insert end "$mod"
}
    .v configure  -state disable
    .v1 configure  -state disable
    #######################
    grid .blnk -row 0 -column 0 -in .frame2
    grid .bk1 -row 0 -column 1 -in .frame2
    grid .blnkwd1 -row 0 -column 2 -in .frame2
    grid .bk2 -row 0 -column 3 -in .frame2
    grid .blnk -row 1 -column 0 -in .frame2
    grid .v -row 1 -column 1 -in .frame2 
	grid .blnk -row 1 -column 2 -in .frame2
	#grid .blnk -row 1 -column 2 -in .frame2
    grid .v1 -row 1 -column 3 -in .frame2 
    grid .blnkwd1 -row 2 -column 0 -in .frame2
    grid .blnkwd1 -row 2 -column 1 -in .frame2
	grid .blnk -row 2 -column 2 -in .frame2
	grid .blnk -row 2 -column 3 -in .frame2
    grid .blnk -row 3 -column 0 -in .frame2
    grid .blnk -row 3 -column 1 -in .frame2
    grid .b_ok -row 3 -column 2 -in .frame2

    pack .frame2
    
    pack forget .f
    proc b_ok {} {
      pack .f
      pack forget .frame2
      .but_ok configure -state disable
    }

}

}

