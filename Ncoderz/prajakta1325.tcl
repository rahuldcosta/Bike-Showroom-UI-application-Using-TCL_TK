#=====================================================================#
# Author:- Prajakta Sail                                              #
# Description:-Bike Showroom UI in Tcl/Tk (Check Details Moudle)      #
# Date Created:-15/10/2013                                            #
# Date Modified:-26/10/2013                            		      #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd    		      #
#=====================================================================#
proc checkdetails {} {

pack forget .selected .checkdetails .compare .feedbk .ret .ai .chkoutbike .aibk .bikelist
####--------------------Main Procedure----------------------####

                
  					   destroy .myname .button .button1 .button2 .line .line1 .line2 .button6 .buttonback1 
					   label .myname -text "CHECK OUT THE BIKE'S DETAILS\n\n\n\n" -font "ansi 14 bold"
  					   label .line -text "\t\t\t"
  					   label .line1 -text "\t\t"
                       label .line2 -text "\t\t"
   					   button .button -text " SPECIFICATION " -font "ansi 10 bold" -command { specification }
     			              	   button .button1 -text "  EXPENSES      " -font "ansi 10 bold" -command { expenses }
  					   button .button2 -text " BIKE GALLERY  " -font "ansi 10 bold" -command { bikegallery }
                                           button .buttonback1 -text " GO BACK " -font "ansi 10 bold" -command { 
if { $xcont == 0 } {
Bikeoption
} 
if {$xcont == 2} {
set chos ""
set chos1 ""
set chos2 ""
set chos3 ""
set chos4 ""
suggestbike
}


 }
                       button .button6 -text "GO BACK" -font "ansi 10 bold"
     		           
                       pack .myname
                       
                       pack .line .button .button1 .button2 .buttonback1 -side left -padx 4m -pady 1m
                     
                       pack forget .start .line3 .button3 .firstrow .secondrow .button5 
                        
                       destroy .button4 .v .exp .button3 .txt .spe
                       
                    

############======================Check Details====================#############


####------------------------Procedure To Display Specification--------------------------####
proc specification { } {
  						  destroy .txt .spe .button3
                          global mysql_handler
                          set ininp [ .bikelist curselection ]
                            set outoutp [ .bikelist get $ininp ]
                               set fildd [split $outoutp { } ]
                                lassign $fildd \
                                        variant modz model
                                
                          label .spe -text "BIKE SPECIFICATION\n\n\n" -font "ansi 16 bold"
                          text .txt -width 100 -height 38 -bg red -font "ansi 9 bold"
                          
                          set bike_var [ mysqlsel $mysql_handler "Select Bike_Variation from Bike_Showroom.Bike_model where Model_num='$modz'" -list ]
                          set bike_model [ mysqlsel $mysql_handler "Select Bike_Model from Bike_Showroom.Bike_model where Model_num='$modz'" -list ]
                        
                          set engine_typ [ mysqlsel $mysql_handler "Select Engine_type from Bike_Showroom.Engine where Model_num='$modz'" -list ]
                          set engine_dis [ mysqlsel $mysql_handler "Select Displacement from Bike_Showroom.Engine where Model_num='$modz'" -list ]
                          set engine_power [ mysqlsel $mysql_handler "Select Max_net_power from Bike_Showroom.Engine where Model_num='$modz'" -list ]
                          set engine_torque [ mysqlsel $mysql_handler "Select Max_net_torque from Bike_Showroom.Engine where Model_num='$modz'" -list ]
                           
                          set brake [mysqlsel  $mysql_handler "Select `Front/Rear`  from Bike_Showroom.Brakes where Model_num='$modz'" -list ]
                          set brake_typ [mysqlsel  $mysql_handler "Select Brake_type from Bike_Showroom.Brakes where Model_num='$modz'" -list ]
                          set brake_siz [mysqlsel  $mysql_handler "Select Brake_size from Bike_Showroom.Brakes where Model_num='$modz'" -list ]

                          set fueltable [mysqlsel  $mysql_handler "Select Total_litres from Bike_Showroom.Fuel_Tank where Model_num='$modz'" -list ]
                        
                          set susp_front [mysqlsel  $mysql_handler "Select Front from Bike_Showroom.Suspension where Model_num='$modz'" -list ]
                          set susp_rear [mysqlsel  $mysql_handler "Select Rear from Bike_Showroom.Suspension where Model_num='$modz'" -list ] 
                    
                          set elec_lamp [ mysqlsel $mysql_handler "Select Head_lamp from Bike_Showroom.Electricals where Model_num='$modz'" -list ]
                          set elec_sys [ mysqlsel $mysql_handler "Select System from Bike_Showroom.Electricals where Model_num='$modz'" -list ]
                          set elec_batery [ mysqlsel $mysql_handler "Select Battery from Bike_Showroom.Electricals where Model_num='$modz'" -list ]
                          
                          set tyre_front [mysqlsel  $mysql_handler "Select Front from Bike_Showroom.Tyre where Model_num='$modz'" -list ]
                          set tyre_rear [mysqlsel  $mysql_handler "Select Rear from Bike_Showroom.Tyre where Model_num='$modz'" -list ]

                         
                          set vehicletable1 [mysqlsel  $mysql_handler "Select wheelBase from Bike_Showroom.Vehicle where Model_num='$modz'" -list ]
                          set vehicletable2 [mysqlsel  $mysql_handler "Select `length*height*width` from Bike_Showroom.Vehicle where Model_num='$modz'" -list ]
                          set vehicletable3 [mysqlsel  $mysql_handler "Select groundClearance from Bike_Showroom.Vehicle where Model_num='$modz'" -list ]
                          set vehicletable4 [mysqlsel  $mysql_handler "Select VehicleKerbWeight from Bike_Showroom.Vehicle where Model_num='$modz'" -list ]
                         


foreach row $bike_var {
       

       set mod "BIKE VARIATION: "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $bike_model {
       

       set mod "\nBIKE MODEL:     "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $engine_typ {
       

       set mod "\nENGINE TYPE:    "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $engine_dis {
       

       set mod "\nDISPLACEMENT:   "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $engine_power {
       

       set mod "\nMAX_NET_POWER:  "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $engine_torque {
       

       set mod "\nMAX_NET_TORQUE: "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}
foreach row $brake {
       

       set mod "\nBRAKE SIZE:     "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}


foreach row $brake_typ {
       

       set mod "\nBRAKE TYPE:    "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}

foreach row $brake_siz {
       

       set mod "\nBRAKE SIZE:     "
       foreach field $row {
       set mod "$mod $field\n"       
       
       }
       
      .txt insert end "$mod"
}



foreach row $elec_lamp {
destroy .button3
set mod "\nHEAD LAMP:      "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}

foreach row $elec_sys {
destroy .button3
set mod "\nSYSTEM:         "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}


foreach row $elec_batery {
destroy .button3
set mod "\nBATTERY:        "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}

foreach row $tyre_front {
destroy .button3
set mod "\nFRONT TYRE:     "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}

foreach row $tyre_rear {
destroy .button3
set mod "\nREAR TYRE:      "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}

foreach row $vehicletable1 {
destroy .button3
set mod "\nWHEEL BASE:     "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}
foreach row $vehicletable2 {
destroy .button3
set mod "\nGROUND CLEARENCE: "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}


foreach row $vehicletable3 {
destroy .button3
set mod "\nGROUND CLEARENCE: "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}

foreach row $vehicletable4 {
destroy .button3
set mod "\nVEHICLE:        "

       foreach field $row {
       set mod "$mod $field\n"       
       }
  
      .txt insert end "$mod"
      
}



button .button3 -background black -foreground red -text "Go Back" -font "ansi 10 bold" -command { checkdetails }   
 						
grid .spe -row 0 -column 1
grid .txt -row 1 -column 3
grid .button3 -row 6 -column 1

.txt configure -state disable
pack forget .myname .button .button1 .button2 .line .line1  .button6 .buttonback1
 					 
}

####---------------Procedure To Display Expenses-----------------------####						
proc expenses {} 	  {
						
 					     destroy .button4 .v .exp
                         global mysql_handler
                          set ininp [ .bikelist curselection ]
                            set outoutp [ .bikelist get $ininp ]
                               set fildd [split $outoutp { } ]
                                lassign $fildd \
                                        variant modz model
                         label .exp -text "BIKE EXPENSES\n\n\n" -font "ansi 1 bold"
                         text .v -bg red -width 100 -height 30 -bg red -font "ansi 9 bold"
                         set expensestable1 [ mysqlsel $mysql_handler "Select Cost from Bike_Showroom.Expenses where Model_num='$modz' " -list ]
                         set expensestable2 [ mysqlsel $mysql_handler "Select  Tax from Bike_Showroom.Expenses where Model_num='$modz' " -list ]
                         set expensestable3 [ mysqlsel $mysql_handler "Select Insurance from Bike_Showroom.Expenses where Model_num='$modz' " -list ]
                         set expensestable4 [ mysqlsel $mysql_handler "Select Total_Cost_of_Bike from Bike_Showroom.Expenses where Model_num='$modz' " -list ]

foreach row $expensestable1 {

set mod "COST OF BIKE:       " 

foreach field $row   {
  
set mod "$mod $field\n"       
}

.v insert end "$mod"
}
                                  
                        
foreach row $expensestable2 {

set mod "\nTAX:                "
foreach field $row   {

set mod "$mod $field\n"       
}

.v insert end "$mod"
}
         
foreach row $expensestable3 {

set mod "\nINSURANCE:         "

foreach field $row   {

set mod "$mod $field\n"       
}

.v insert end "$mod"
}

                         
foreach row $expensestable4 {

set mod "\nTOTAL COST OF BIKE: "

foreach field $row   { 

set mod "$mod $field\n"       
}

.v insert end "$mod"
                        
}                         
                             

 						
button .button4 -background black -foreground red -text "Go Back" -font "ansi 10 bold" -command { checkdetails } 
 						
grid .exp -row 0 -column 1
grid .v -row 1 -column 5
grid .button4 -row 6 -column 5

.v configure -state disable
pack forget .myname .button .button1 .button2 .line .line1  .button6 .buttonback1
 					 }


####---------------------Procedure For Bike_Gallery---------####
proc bikegallery { } {
  						destroy .firstrow .secondrow .button5 .bike1 .bike2 .bike3 .bike4

#==================Image Displaying============#
global mysql_handler
frame .firstrow
frame .secondrow
package require Img
canvas .bike1 -width 280 -height 160
set picture [image create photo -file ./wall.jpg]
.bike1 create image 140 80 -image $picture
canvas .bike2 -width 280 -height 160
set picture [image create photo -file ./wall.gif]
.bike2 create image 140 80 -image $picture

grid .bike1 -row 0 -column 1 -in .firstrow
grid .bike2 -row 0 -column 2 -in .firstrow

canvas .bike3 -width 280 -height 160
set picture [image create photo -file ./wall.gif]
.bike3 create image 140 80 -image $picture
canvas .bike4 -width 280 -height 160
set picture [image create photo -file ./wall.gif]
.bike4 create image 140 80 -image $picture

grid .bike3 -row 0 -column 1 -in .secondrow
grid .bike4 -row 0 -column 2 -in .secondrow
#=================================#

  						button .button5 -background black -foreground red -text "Go Back" -font "ansi 10 bold" -command { checkdetails }
  						pack .firstrow .secondrow .button5
  						pack forget .myname .button .button1 .button2 .line .line1 .line2 .button6 .buttonback1
  					 }




}



