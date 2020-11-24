#=====================================================================#
# Author:- Rahul C. Dcosta                                            #
# Description:-Bike Showroom UI in Tcl/Tk (Admin Moudle)              #
# Date Created:-15/10/2013                                            #
# Date Modified:-26/10/2013                            		      #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd    		      #
#=====================================================================#

###==============INTRO==============###
  frame .bikebox
  frame .bikebox2
  frame .databaseentry

  destroy .main .use .user .wat .ad .toquit .nikequit
  global mysql_handler
  set result "[ mysqlsel $mysql_handler {select  Model_num,Bike_variation,Bike_model from Bike_Showroom.Bike_model } -list ]"
  destroy .bikelist .scroll
  scrollbar .scroll -command ".bikelist yview"
  listbox .bikelist -yscroll ".scroll set" 


  foreach row $result {
  set line ""

       foreach field $row {
       set line "$line $field"
       
                           }

      .bikelist insert end "$line"

                    }
  .bikelist configure -state normal;
  .bikelist configure -activestyle underline;
  focus .bikelist
  .bikelist activate 0
  label .main -text "\t\t\t\t   WELCOME TO THE BIKE SHOWROOM\t\t\t\t\t\n\n\n\n"
  label .use -text "\nCustomer Please Click Below\n"
  button .user -text "Let's Get Started" -command "userui"
  label .wat -text "\n\n\n\n\nAdministrator\nPlease"
  button .ad -text "Click Me" -command "admin_page"
  label .toquit -text "\n\n\n\n\n\n\nTo Quit Application Click Below"
  button .nikequit -text "Quit" -command {exit}
  pack .main .use .user .wat .ad .toquit .nikequit
  pack forget .t .start .wel .userid .enterid .passwd .passwd2 .submit .clear .userintro .suggest .uspace .search .uibk
  

##===============CUSTOMER UI==============##
  proc userui {} {
  set value ""
  set chos ""
  set chos1 ""
  set chos2 ""
  set chos3 ""
  set chos4 ""
  destroy .userintro .suggest .uspace .search .uibk
  label .userintro -text "\n\nSELECT A CHOICE\n"

  button .suggest -text "Shall i suggest you a Bike" -command "suggestbike"
  label .uspace -text "\n\n\n"
  button .search -text "Search a Bike" -command "searchbike"
  button .uibk -text "GO BACK" -command {

  pack .main .use .user .wat .ad .toquit .nikequit
  pack forget .t .start .wel .userid .enterid .passwd .passwd2 .submit .clear .userintro .suggest .uspace .search .uibk


  }

  pack .userintro .suggest .uspace 
  pack .search .uibk -side top -padx 4m -pady 1m
pack forget .bikebox .toquit .nikequit .sea .bikelist .searchsubmit .lss .searchexit .main .use .user .wat .ad .suggestwel .q1 .qop1 .qop2 .qop3 .q2 .q2p1 .q2p2 .q2p3 .q3 .q3p1 .q3p2 .q3p3 .q4 .q4p1 .q4p2 .q4p3 .q5 .q5p1 .q5p2 .q5p3 .submitq .cancelq


  }
#####=============ADMIN MODULE================####
###============ADMIN LOGIN===============##
  proc admin_page {} {
  
  destroy .wel .userid .enterid .passwd .passwd2 .submit .clear
 
  label .wel -text "Welcome Admin\nPlease Enter Your Login Details\n"
  label .userid -text "Enter User Id"
  entry .enterid -textvariable uid
  label .passwd -text "Enter Password"
  entry .passwd2 -textvariable pass
  button .submit -text "Submit" -command "admin_task"
  button .clear -text "Go back" -command {

  pack .main .use .user .wat .ad .toquit .nikequit
  pack forget .t .start .wel .userid .enterid .passwd .passwd2 .submit .clear .userintro .suggest .uspace .search .uibk

  }
  pack .wel .userid .enterid .passwd .passwd2 
  pack .submit .clear -side top -padx 4m -pady 1m
  pack forget .main .use .user .wat .ad .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi .toquit .nikequit
  }
##===========ADMIN TASK==============####
  proc admin_task {} {
  global uid
  global pass
global mysql_handler
  set result "[ mysqlsel $mysql_handler {select  Model_num,Bike_variation,Bike_model from Bike_Showroom.Bike_model } -list ]"
destroy .bikelist .scroll
  scrollbar .scroll -command ".bikelist yview"
  listbox .bikelist -yscroll ".scroll set" 


  foreach row $result {
  set line ""

       foreach field $row {
       set line "$line $field"
       
                           }

      .bikelist insert end "$line"

                    }
  .bikelist configure -state normal;
  .bikelist configure -activestyle underline;
  focus .bikelist
  .bikelist activate 0
  if { $uid == "admin" && $pass == "nopass" } {
  destroy .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi
  label .intro_task -text "Welcome Admin\nPlease Select a Task\n"
  button .add -text "Add Record" -command { addrecord }
  
  button .updat -text "Update a Record" -command { updaterecord }

  button .delete -text "Delete a Record" -command { deleterecord }

  button .view -text "View a Record" -command { viewrecord }

  button .exi -text "Go back" -command {
 set uid ""
  set pass ""
admin_page}
  pack .intro_task 
pack  .add .updat .delete .view  .exi -side top -padx 4m -pady 1m
pack forget .uploadbutton .pathoffile .v .gogoback .databaseentry .vwel .ventry .vview .vbk .bikelist .bikebox .delrec .dellla .delbk .model .emodel .variant .evariant .updateb .eupdateb .enginet .eenginet .displacment .edisplacment .maxnetpower .emaxnetpower .maxnettorque .emaxnettorque .updateb .eupdateb .wheelbase .ewheelbase .lhw .elhw .groundclear .egroundclear .vehiclekwt .evehiclekwt .updateb .eupdateb .totalltrs .etotalltrs .updateb .eupdateb .sfront .esfront .srear .esrear .updateb .eupdateb .bfrontrear .ebfrontrear .btype .ebtype .bsize .ebsize .updateb .eupdateb .tfront .etfront .trear .etrear .updateb .eupdateb .hlamp .ehlamp .systm .esystm .battery .ebattery .updateb .eupdateb .hcost .ehcost .htax .ehtax .hinsu .ehinsu .htotco .ehtotco .updateb .eupdateb .bikelist .ent .next .admin .out .engine .txt .wel .userid .enterid .passwd .passwd2 .submit .clear .uwel .bikelist .usumbit .ucancel .hcost .ehcost .htax .ehtax .hinsu .ehinsu .htotco .ehtotco .updateb .eupdateb 
} else { 
  tk_messageBox -message "Invalid User id and password Please Refer To User Manual" -icon warning -type ok
  set uid ""
  set pass ""
  admin_page }

  }


####=============Admin operation=========####
  proc addrecord {} {
  destroy .uploadbutton .pathoffile .hcost .ehcost .htax .ehtax .hinsu .ehinsu .htotco .ehtotco .addwel .recordno .erecordno .model .emodel .variant .evariant .enginet .eenginet .displacment .edisplacment .maxnetpower .emaxnetpower .maxnettorque .emaxnettorque .wheelbase .ewheelbase .lhw .elhw .groundclear .egroundclear .vehiclekwt .evehiclekwt .totalltrs .etotalltrs .sfront .esfront .srear .esrear .bfrontrear .ebfrontrear .btype .ebtype .bsize .ebsize .tfront .etfront .trear .etrear .hlamp .ehlamp .systm .esystm .battery .ebattery .addsubmit .addback

  label .addwel -text "\n Welcome Admin you can enter details of a new Vehicle\n"
  label .recordno -text "Record No"
  entry .erecordno -textvariable record
  label .model -text "Model Name"
  entry .emodel -textvariable model
  label .variant -text "Model Variant"
  entry .evariant -textvariable variant
##engine details====##
  label .enginet -text "Engine Type"
  entry .eenginet -textvariable engine1
  label .displacment -text "Displacment"
  entry .edisplacment -textvariable engine2
  label .maxnetpower -text "Max Net Power"
  entry .emaxnetpower -textvariable engine3
  label .maxnettorque -text "Max Net Torque"
entry .emaxnettorque -textvariable engine4
##========Vehicle details====#
label .wheelbase -text "Wheel Base"
entry .ewheelbase -textvariable vehicle1
label .lhw -text "Length*Height*Width"
entry .elhw -textvariable vehicle2
label .groundclear -text "Ground Clearence"
entry .egroundclear -textvariable vehicle3
label .vehiclekwt -text "Vehicle Kerb Weight"
entry .evehiclekwt -textvariable vehicle4
##=========Fuel tank===========#
label .totalltrs -text "Total Litres"
entry .etotalltrs -textvariable fuel1
##=========Suspension=========#
label .sfront -text "Front Suspension"
entry .esfront -textvariable suspen1
label .srear -text "Rear Suspension"
entry .esrear -textvariable suspen2
##=======Brake========#
label .bfrontrear -text "Front/Rear Brake"
entry .ebfrontrear -textvariable brake1
label .btype -text "Brake Type"
entry .ebtype -textvariable brake2
label .bsize -text "Brake Size"
entry .ebsize -textvariable brake3
##=======Tyre=====#
label .tfront -text "Front Tyre"
entry .etfront -textvariable tyre1
label .trear -text "Rear Tyre"
entry .etrear -textvariable tyre2
##======Electricals==#
label .hlamp -text "Head Lamp"
entry .ehlamp -textvariable elect1
label .systm -text "System"
entry .esystm -textvariable elect2
label .battery -text "Battery"
entry .ebattery -textvariable elect3
##======Expenses========##
label .hcost -text "Cost (In INR)"
entry .ehcost -textvariable cost1
label .htax -text "Tax(In INR)"
entry .ehtax -textvariable cost2
label .hinsu -text "Insurance(In INR)"
entry .ehinsu -textvariable cost3
label .htotco -text "Total Cost (In INR)"
entry .ehtotco -textvariable cost4

button .addsubmit -text "Submit" -command {inserting}
button .addback -text "Go Back" -command {
#===========
set record "" 
set model "" 
set variant "" 
set engine1 "" 
set engine2 "" 
set engine3 "" 
set engine4 "" 
set vehicle1 "" 
set vehicle2 "" 
set vehicle3 "" 
set vehicle4 "" 
set fuel1 "" 
set suspen1 "" 
set suspen2 "" 
set brake1 "" 
set brake2 "" 
set brake3 "" 
set tyre1 "" 
set tyre2 "" 
set elect1 "" 
set elect2 "" 
set elect3 "" 
set cost1 "" 
set cost2 "" 
set cost3 "" 
set cost4 ""
set nice ""

#===========




admin_task}

#===============================#
global nice
set nice ""
proc doIt {} {
global mysql_handler
global nice
set types {
        
        {"Image Files"          {.jpg .gif}          }
        
}    
    destroy .pathoffile
    set nice [tk_getOpenFile -filetypes $types -parent .]
    label .pathoffile -text $nice
    grid .pathoffile -row 27 -column 1 -in .databaseentry

}

label .pathoffile -text "No File"
button .uploadbutton -text "Upload Photo?" -command "doIt"



#===============================#
grid .addwel -row 0 -column 4 -in .databaseentry
grid .recordno -row 1 -column 0 -in .databaseentry
grid .erecordno -row 1 -column 1 -in .databaseentry
grid .model -row 2 -column 0 -in .databaseentry
grid .emodel -row 2 -column 1 -in .databaseentry
grid .variant -row 3 -column 0 -in .databaseentry
grid .evariant -row 3 -column 1 -in .databaseentry
grid .enginet -row 4 -column 0 -in .databaseentry
grid .eenginet -row 4 -column 1 -in .databaseentry
grid .displacment -row 5 -column 0 -in .databaseentry
grid .edisplacment -row 5 -column 1 -in .databaseentry 
grid .maxnetpower -row 6 -column 0 -in .databaseentry
grid .emaxnetpower -row 6 -column 1 -in .databaseentry
grid .maxnettorque -row 7 -column 0 -in .databaseentry
grid .emaxnettorque -row 7 -column 1 -in .databaseentry
grid .wheelbase -row 8 -column 0 -in .databaseentry
grid .ewheelbase -row 8 -column 1 -in .databaseentry
grid .lhw -row 9 -column 0 -in .databaseentry
grid .elhw -row 9 -column 1 -in .databaseentry
grid .groundclear -row 10 -column 0 -in .databaseentry 
grid .egroundclear -row 10 -column 1 -in .databaseentry
grid .vehiclekwt -row 11 -column 0 -in .databaseentry
grid .evehiclekwt -row 11 -column 1 -in .databaseentry
grid .totalltrs -row 12 -column 0 -in .databaseentry
grid .etotalltrs  -row 12 -column 1 -in .databaseentry
grid .sfront -row 13 -column 0 -in .databaseentry
grid .esfront -row 13 -column 1 -in .databaseentry
grid .srear -row 14 -column 0 -in .databaseentry
grid .esrear -row 14 -column 1 -in .databaseentry
grid .bfrontrear -row 15 -column 0 -in .databaseentry
grid .ebfrontrear -row 15 -column 1 -in .databaseentry   
grid .btype -row 16 -column 0 -in .databaseentry
grid .ebtype -row 16 -column 1 -in .databaseentry 
grid .bsize -row 17 -column 0 -in .databaseentry
grid .ebsize -row 17 -column 1 -in .databaseentry   
grid .tfront -row 18 -column 0 -in .databaseentry
grid .etfront -row 18 -column 1 -in .databaseentry   
grid .trear -row 19 -column 0 -in .databaseentry
grid .etrear -row 19 -column 1 -in .databaseentry
grid .hlamp -row 20 -column 0 -in .databaseentry
grid .ehlamp -row 20 -column 1 -in .databaseentry 
grid .systm -row 21 -column 0 -in .databaseentry
grid .esystm -row 21 -column 1 -in .databaseentry 
grid .battery -row 22 -column 0 -in .databaseentry
grid .ebattery -row 22 -column 1 -in .databaseentry 
grid .hcost -row 23 -column 0 -in .databaseentry
grid .ehcost -row 23 -column 1 -in .databaseentry 
grid .htax -row 24 -column 0 -in .databaseentry
grid .ehtax -row 24 -column 1 -in .databaseentry
grid .hinsu -row 25 -column 0 -in .databaseentry
grid .ehinsu -row 25 -column 1 -in .databaseentry
grid .htotco -row 26 -column 0 -in .databaseentry
grid .ehtotco -row 26 -column 1 -in .databaseentry 
grid .uploadbutton -row 27 -column 0 -in .databaseentry
grid .pathoffile -row 27 -column 1 -in .databaseentry  

grid .addsubmit -row 29 -column 1 -in .databaseentry
grid .addback -row 29 -column 2 -in .databaseentry

pack .databaseentry
pack forget .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi

}
##########=================ADDING A REcord In Database==============###
proc inserting {} {
global mysql_handler nice
global record model variant engine1 engine2 engine3 engine4 vehicle1 vehicle2 vehicle3 vehicle4 fuel1 suspen1 suspen2 brake1 brake2 brake3 tyre1 tyre2 elect1 elect2 elect3 cost1 cost2 cost3 cost4
if { $nice != "" && $record != "" && $model != "" && $variant != "" && $engine1 != "" && $engine2 != "" && $engine3 != "" && $engine4 != "" && $vehicle1 != "" && $vehicle2 != "" && $vehicle3 != "" && $vehicle4 != "" && $fuel1 != "" && $suspen1 != "" && $suspen2 != "" && $brake1 != "" && $brake2 != "" && $brake3 != "" && $tyre1 != "" && $tyre2 != "" && $elect1 != "" && $elect2 != "" && $elect3 != "" && $cost1 != "" && $cost2 != "" && $cost3 != "" &&$cost4 != "" } {
mysqluse $mysql_handler {Bike_Showroom}
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Bike_model( Model_num, Bike_variation, Bike_model)VALUES( '$record', '$model', '$variant')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Engine(Model_num, Engine_type, Displacement, Max_net_power, Max_net_torque)VALUES( '$record', '$engine1', '$engine2', '$engine3', '$engine4')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Vehicle(Model_num, wheelBase, `length*height*width`, groundClearance, VehicleKerbWeight)VALUES( '$record', '$vehicle1', '$vehicle2', '$vehicle3', '$vehicle4')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Fuel_Tank(Model_num, Total_litres)VALUES( '$record', '$fuel1')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Suspension(Model_num, Front, Rear)VALUES( '$record', '$suspen1', '$suspen2')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Brakes(Model_num, `Front/Rear`, Brake_type, Brake_size)VALUES( '$record', '$brake1', '$brake2', '$brake3')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Tyre(Model_num, Front, Rear)VALUES( '$record', '$tyre1', '$tyre2')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Electricals(Model_num, Head_lamp, System, Battery)VALUES( '$record', '$elect1', '$elect2', '$elect3')"
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Expenses(Model_num, Cost, Tax, Insurance, Total_Cost_of_Bike)VALUES( '$record', '$cost1', '$cost2', '$cost3' , '$cost4' )"

mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Gallery(Model_num, photopath)VALUES( '$record', '$nice' )"

tk_messageBox -message "You Data Entry was Successful" -type ok

} else {
           tk_messageBox -message "You have to Enter all the Fields and select the photo" -icon warning -type ok
addrecord}

pack forget .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi
}


####===============UPDATING A RECORD in DATABASE=========###
proc updaterecord {} {
destroy .uwel  .usumbit .ucancel 
label .uwel -text "Welcome User Enter The Record To Update\n"
button .usumbit -text "Submit" -command "updating"
button .ucancel -text "Cancel" -command "admin_task"
grid .bikelist -row 1 -column 4 -in .bikebox -sticky news
grid .scroll -row 1 -column 5 -in .bikebox -sticky news
pack .uwel .bikebox .usumbit .ucancel
pack forget .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi .bikeselz .options .upppsubmit .upppback

}

proc updating {} {
global mysql_handler modelno
destroy .bikeselz .options .upppsubmit .upppback
set uinput [ .bikelist curselection ]
if { $uinput != "" } { 
set uoutput [ .bikelist get $uinput ]

set fielder [split $uoutput { } ]
lassign $fielder \
         variant modelno model
listbox .options -selectmode single ;

label .bikeselz -text "The Bike You Selected is $uoutput \n Please Select the Entry To Update\n\n\n"
.options insert end  "Bike Details" "Engine Details" "Vehicle Details" "Fuel Tank Details" "Suspension Details" "Brakes Details" "Tyre Details" "Electrical Details" "Expenses"
.options configure -state normal ;
.options configure -activestyle underline ;
focus .options
.options activate 1

button .upppsubmit -text "Submit" -command "optionsupdate"
button .upppback -text "Go Back" -command "updaterecord"
pack .bikeselz .options .upppsubmit .upppback
pack forget .uwel .bikelist .usumbit .ucancel .bikebox
} else {
tk_messageBox -message "Please select a Bike" -icon warning -type ok
}
}

proc optionsupdate {} {
destroy .model .emodel .variant .evariant .updateb .eupdateb .enginet .eenginet .displacment .edisplacment .maxnetpower .emaxnetpower .maxnettorque .emaxnettorque .updateb .eupdateb .wheelbase .ewheelbase .lhw .elhw .groundclear .egroundclear .vehiclekwt .evehiclekwt .updateb .eupdateb .totalltrs .etotalltrs .updateb .eupdateb .sfront .esfront .srear .esrear .updateb .eupdateb .bfrontrear .ebfrontrear .btype .ebtype .bsize .ebsize .updateb .eupdateb .tfront .etfront .trear .etrear .updateb .eupdateb .hlamp .ehlamp .systm .esystm .battery .ebattery .updateb .eupdateb .hcost .ehcost .htax .ehtax .hinsu .ehinsu .htotco .ehtotco .updateb .eupdateb             

global model variant engine1 engine2 engine3 engine4 vehicle1 vehicle2 vehicle3 vehicle4 fuel1 suspen1 suspen2 brake1 brake2 brake3 tyre1 tyre2 elect1 elect2 elect3 cost1 cost2 cost3 cost4
global modelno record

set record $modelno
set uinputz [ .options curselection ]
if { $uinputz != "" } {

set uoutputz [ .options get $uinputz ]
label .model -text "Model Name"
entry .emodel -textvariable model
label .variant -text "Model Variant"
entry .evariant -textvariable variant
##engine details====##
label .enginet -text "Engine Type"
entry .eenginet -textvariable engine1
label .displacment -text "Displacment"
entry .edisplacment -textvariable engine2
label .maxnetpower -text "Max Net Power"
entry .emaxnetpower -textvariable engine3
label .maxnettorque -text "Max Net Torque"
entry .emaxnettorque -textvariable engine4
##========Vehicle details====#
label .wheelbase -text "Wheel Base"
entry .ewheelbase -textvariable vehicle1
label .lhw -text "Length*Height*Width"
entry .elhw -textvariable vehicle2
label .groundclear -text "Ground Clearence"
entry .egroundclear -textvariable vehicle3
label .vehiclekwt -text "Vehicle Kerb Weight"
entry .evehiclekwt -textvariable vehicle4
##=========Fuel tank===========#
label .totalltrs -text "Total Litres"
entry .etotalltrs -textvariable fuel1
##=========Suspension=========#
label .sfront -text "Front Suspension"
entry .esfront -textvariable suspen1
label .srear -text "Rear Suspension"
entry .esrear -textvariable suspen2
##=======Brake========#
label .bfrontrear -text "Front/Rear Brake"
entry .ebfrontrear -textvariable brake1
label .btype -text "Brake Type"
entry .ebtype -textvariable brake2
label .bsize -text "Brake Size"
entry .ebsize -textvariable brake3
##=======Tyre=====#
label .tfront -text "Front Tyre"
entry .etfront -textvariable tyre1
label .trear -text "Rear Tyre"
entry .etrear -textvariable tyre2
##======Electricals==#
label .hlamp -text "Head Lamp"
entry .ehlamp -textvariable elect1
label .systm -text "System"
entry .esystm -textvariable elect2
label .battery -text "Battery"
entry .ebattery -textvariable elect3
##======Expenses========##
label .hcost -text "Cost (In INR)"
entry .ehcost -textvariable cost1
label .htax -text "Tax(In INR)"
entry .ehtax -textvariable cost2
label .hinsu -text "Insurance(In INR)"
entry .ehinsu -textvariable cost3
label .htotco -text "Total Cost (In INR)"
entry .ehtotco -textvariable cost4
switch $uoutputz {
         "Bike Details" {  global record
            button .updateb -text "Update" -command {

if { $model != "" && $variant != "" } {
 mysqlsel $mysql_handler "UPDATE Bike_Showroom.Bike_model SET Bike_variation='$model',Bike_model='$variant' WHERE Model_num='$record'" 
tk_messageBox -message "Data Update Successfully" -type ok
} else {

tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
 
} 
}
           button .eupdateb -text "Go Back" -command {
  set model "" 
set variant ""
admin_task}
         pack .model .emodel .variant .evariant .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
                             }
         "Engine Details" { global record
 
        button .updateb -text "Update" -command { 
if { $engine1 != "" && $engine2 != "" && $engine3 != "" && $engine4 != "" } { 
mysqlsel $mysql_handler "UPDATE Bike_Showroom.Engine SET Engine_type='$engine1',Displacement='$engine2',Max_net_power='$engine3',Max_net_torque='$engine4' WHERE Model_num='$record'" 
tk_messageBox -message "Data Update Successfully" -type ok
} else {

tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}

}

           button .eupdateb -text "Go Back" -command {
set engine1 "" 
set engine2 "" 
set engine3 "" 
set engine4 "" 
admin_task} 
         pack .enginet .eenginet .displacment .edisplacment .maxnetpower .emaxnetpower .maxnettorque .emaxnettorque .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback

      }
         "Vehicle Details" { global record

button .updateb -text "Update" -command { 
if { $vehicle1 != "" && $vehicle2 != "" && $vehicle3 != "" && $vehicle4 != "" } {
mysqlsel $mysql_handler "UPDATE Bike_Showroom.Vehicle SET wheelBase='$vehicle1',`length*height*width`='$vehicle2',groundClearance='$vehicle3',VehicleKerbWeight='$vehicle4' WHERE Model_num='$record'" 
tk_messageBox -message "Data Update Successfully" -type ok
} else {

tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}

}

           button .eupdateb -text "Go Back" -command {
set vehicle1 "" 
set vehicle2 "" 
set vehicle3 "" 
set vehicle4 ""
admin_task} 
         pack .wheelbase .ewheelbase .lhw .elhw .groundclear .egroundclear .vehiclekwt .evehiclekwt .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback

     }
         "Fuel Tank Details" { global record

      button .updateb -text "Update" -command {
if { $fuel1 != "" } {
mysqlsel $mysql_handler "UPDATE Bike_Showroom.Fuel_Tank SET Total_litres='$fuel1' WHERE Model_num='$record'"
tk_messageBox -message "Data Update Successfully" -type ok
} else {

tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}
}

           button .eupdateb -text "Go Back" -command {
set fuel1 ""
admin_task} 
         pack .totalltrs .etotalltrs .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
     }
         "Suspension Details" { global record

button .updateb -text "Update" -command {
if { $suspen1 != "" && $suspen2 != "" } {

mysqlsel $mysql_handler "UPDATE Bike_Showroom.Suspension SET Front='$suspen1',Rear='$suspen2' WHERE Model_num='$record'"
tk_messageBox -message "Data Update Successfully" -type ok
} else {
tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}
}
           button .eupdateb -text "Go Back" -command {
set suspen1 ""
set suspen2 ""
admin_task} 
         pack .sfront .esfront .srear .esrear .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
 }
         "Brakes Details" { global record
button .updateb -text "Update" -command {
if { $brake1 != "" && $brake2 != "" && $brake3 != "" } {
mysqlsel $mysql_handler "UPDATE Bike_Showroom.Brakes SET `Front/Rear`='$brake1',Brake_type='$brake2', Brake_size='$brake3' WHERE Model_num='$record'"
tk_messageBox -message "Data Update Successfully" -type ok
} else {
tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}

}
          button .eupdateb -text "Go Back" -command {
set brake1 "" 
set brake2 "" 
set brake3 "" 
admin_task}
         pack .bfrontrear .ebfrontrear .btype .ebtype .bsize .ebsize .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
 }
         "Tyre Details" { global record

button .updateb -text "Update" -command {
if { $tyre1 != "" && $tyre2 != "" } { 
 mysqlsel $mysql_handler "UPDATE Bike_Showroom.Tyre SET Front='$tyre1',Rear='$tyre2' WHERE Model_num='$record'"
tk_messageBox -message "Data Update Successfully" -type ok
} else {
tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok

}
}

           button .eupdateb -text "Go Back" -command {
set tyre1 "" 
set tyre2 ""
admin_task} 
         pack .tfront .etfront .trear .etrear .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
} 
         "Electrical Details" { global record
      
button .updateb -text "Update" -command {
if { $elect1 != "" && $elect2 != "" && $elect3 != "" } { 
    mysqlsel $mysql_handler "UPDATE Bike_Showroom.Electricals SET Head_lamp='$elect1',System='$elect2',Battery='$elect3' WHERE Model_num='$record'"
tk_messageBox -message "Data Update Successfully" -type ok
} else {
tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok
}

}

           button .eupdateb -text "Go Back" -command {
set elect1 "" 
set elect2 "" 
set elect3 ""
admin_task} 
         pack  .hlamp .ehlamp .systm .esystm .battery .ebattery .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
}
         "Expenses" { global record
button .updateb -text "Update" -command {
if { $cost1 != "" && $cost2 != "" && $cost3 != "" &&$cost4 != "" } { 
mysqlsel $mysql_handler "UPDATE Bike_Showroom.Expenses SET Cost='$cost1',Tax='$cost2',Insurance='$cost3', Total_Cost_of_Bike='$cost4' WHERE Model_num='$record' "
tk_messageBox -message "Data Update Successfully" -type ok
} else {
tk_messageBox -message "You have to Enter all the Fields" -icon warning -type ok

}
}

           button .eupdateb -text "Go Back" -command {
set cost1 "" 
set cost2 "" 
set cost3 ""
set cost4 ""
admin_task} 
         pack  .hcost .ehcost .htax .ehtax .hinsu .ehinsu .htotco .ehtotco .updateb .eupdateb 
         pack forget .bikeselz .options .upppsubmit .upppback
 }

}
pack forget .bikeselz .options .upppsubmit
} else {
tk_messageBox -message "You have to Select a option" -icon warning -type ok
}

}

####===============DELETING A RECORD in DATABASE=========###

proc deleterecord {} {
destroy .delrec .dellla .delbk 
global record 
label .delrec -text "Please Select the Record  To Delete"
button .dellla -text "Delete" -command "deleting"
button .delbk -text "Goback" -command {admin_task}
grid .bikelist -row 1 -column 4 -in .bikebox -sticky news
grid .scroll -row 1 -column 5 -in .bikebox -sticky news
pack   .delrec .bikebox .dellla .delbk
pack forget .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi 
}
proc deleting {} {
set in [ .bikelist curselection ]
if { $in != "" } {
set out [ .bikelist get $in ]
set fil [split $out { } ]
lassign $fil \
         variant modid model
global mysql_handler
set del $modid
mysqlsel $mysql_handler "Delete from Bike_Showroom.Engine where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Bike_model where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Vehicle where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Fuel_Tank where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Suspension where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Brakes where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Tyre where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Electricals where Model_num='$del'"
mysqlsel $mysql_handler "Delete from Bike_Showroom.Expenses where Model_num='$del'"

tk_messageBox -message "The Record That You Choose Is Now Deleted" -type ok
} else {
tk_messageBox -message "You have to Select a Bike" -icon warning -type ok
}
}

####===============Viewing A RECORD in DATABASE=========###

proc viewrecord {} {
destroy .vwel .vview .vbk 
label .vwel -text "Please select the Record to View\n"
button .vview -text "View" -command "Viewing"
button .vbk -text "GO back" -command "admin_task"
grid .bikelist -row 1 -column 4 -in .bikebox -sticky news
grid .scroll -row 1 -column 5 -in .bikebox -sticky news
pack .vwel .bikebox .vview .vbk
pack forget .intro_task .add .space .updat .space1 .delete .space2 .view .space3 .exi
}

proc Viewing {} {
destroy .v .gogoback
text .v -width 100 -height 60
button .gogoback -text "Go Back" -command "admin_task"
global ventr mysql_handler
set inin [ .bikelist curselection ]
if { $inin !="" } {
set outout [ .bikelist get $inin ]
set fild [split $outout { } ]
lassign $fild \
         variant modz model
set ventr $modz
set modeltable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Bike_model where Model_num='$ventr'" -list ]
set enginetable [ mysqlsel $mysql_handler "Select * from Bike_Showroom.Engine where Model_num='$ventr'" -list ]
set vehicletable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Vehicle where Model_num='$ventr'" -list ]
set fueltable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Fuel_Tank where Model_num='$ventr'" -list ]
set suspentable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Suspension where Model_num='$ventr'" -list ]
set braketable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Brakes where Model_num='$ventr'" -list ]
set tyretable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Tyre where Model_num='$ventr'" -list ]
set electtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Electricals where Model_num='$ventr'" -list ]
set costtable [mysqlsel  $mysql_handler "Select * from Bike_Showroom.Expenses where Model_num='$ventr'" -list ]

foreach row $modeltable {
set mod "Model :-"

       foreach field $row {
       set mod "$mod $field"       
       }
      .v insert end "$mod"
}
foreach row $enginetable {
set mod "\n\n\n---Engine---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $suspentable {
set mod "---Suspension---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $fueltable {
set mod "---Fuel---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $braketable {
set mod "---Brake---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $tyretable {
set mod "---Tyre---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $electtable {
set mod "---Electricals---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
foreach row $costtable {
set mod "---Expenses---\n"

       foreach field $row {
       set mod "$mod $field\n"       
       }
      .v insert end "$mod"
}
.v configure -state disable
pack .v .gogoback -side left
pack forget .bikebox .vwel .vview .vbk

} else {
tk_messageBox -message "You have to select a Bike" -icon warning -type ok

}

}


#####=============Bike Options(CHeck details,compare,feedback)=======####
proc Bikeoption {} {
destroy .selected .checkdetails .compare .feedbk .ret .out .engine .txt
global mysql_handler 
global xcont

text .txt -width 100 -height 50
set input [ .bikelist curselection ]
if { $xcont == 0 } {

set $xcont [expr $xcont + 1 ]
}
if { $input !="" || $xcont !="" } {
set bikevalue [ .bikelist get $input ]
set fieldz [split $bikevalue { } ]
lassign $fieldz \
         variant model modelno
label .out -text "The Selected Entry is $bikevalue"

label .selected -text "You Current Seleted Bike is $bikevalue\n\n\nPlease Select what you wish to do\n\n\n"
button .checkdetails -text "Check Details" -command "checkdetails"
button .compare -text "Compare" -command "compared"
button .feedbk -text "Feedback" -command "feedback"
button .ret -text "Go Back" -command "searchbike"
pack .selected .checkdetails .compare .feedbk .ret -side top -padx 4m -pady 1m

pack forget .bikebox .searchsubmit .lss .searchexit .line .button .button1 .button2 .buttonback1 .myname .f_feed .f_choice .f_write .f_readd .f_exitable .f

} else {
tk_messageBox -message "Please Select a Bike" -icon warning -type ok
}

}
