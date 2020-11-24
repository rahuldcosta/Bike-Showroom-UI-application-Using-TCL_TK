#=========================================================================#
# Author:- Sweta Nagvekar and Aprana Pandey                               #
# Description:-Bike Showroom UI in Tcl/Tk (Suggest and Search Bike Moudle)#
# Date Created:-15/10/2013                                                #
# Date Modified:-26/10/2013                            		          #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd    		          #
#=========================================================================#
##============SUGGEST A BIke=========####
proc suggestbike {} {
global chos chos1 chos2 chos3 chos4
destroy .suggestwel .q1 .qop1 .qop2 .qop3 .q2 .q2p1 .q2p2 .q2p3 .q3 .q3p1 .q3p2 .q3p3 .q4 .q4p1 .q4p2 .q4p3 .q5 .q5p1 .q5p2 .q5p3 .submitq .cancelq
label .suggestwel -text "\nKindly answer a few questions so that we can get to know you better"
label .q1 -text "\n1.What is your age ?"
radiobutton .qop1 -text "A)18 to 25" -variable chos -value "A"
radiobutton .qop2 -text "B)26 to 39" -variable chos -value "B"
radiobutton .qop3 -text "C)above 40" -variable chos -value "C"
label .q2 -text "\n2.What is your Bugget ?"
radiobutton .q2p1 -text "A)Rs.40,000 to 60,000" -variable chos1 -value "A"
radiobutton .q2p2 -text "B)RS.60,000 to 80,000" -variable chos1 -value "B"
radiobutton .q2p3 -text "C)above Rs.80,000 " -variable chos1 -value "C"
label .q3 -text "\n3.What type of bike You Prefer ?"
radiobutton .q3p1 -text "A)High Performance" -variable chos2 -value "A"
radiobutton .q3p2 -text "B)High Milege" -variable chos2 -value "B"
radiobutton .q3p3 -text "C)Balance of Performance and Milege" -variable chos2 -value "C" 
label .q4 -text "\n4.How Much do you travel in a day ?"
radiobutton .q4p1 -text "A)Less than 30km" -variable chos3 -value "A"
radiobutton .q4p2 -text "B)30 to 70 km" -variable chos3 -value "B"
radiobutton .q4p3 -text "C)above 70km" -variable chos3 -value "C"
label .q5 -text "\n5.What is you Height ?"
radiobutton .q5p1 -text "A)4 to 5 feet" -variable chos4 -value "A"
radiobutton .q5p2 -text "B)5 to 6 feet" -variable chos4 -value "B"
radiobutton .q5p3 -text "C)above 6 feet" -variable chos4 -value "C"
button .submitq -text "SUBMIT" -command "suggestai"
button .cancelq -text "Cancel and go back" -command "userui"

pack .suggestwel .q1 .qop1 .qop2 .qop3 .q2 .q2p1 .q2p2 .q2p3 .q3 .q3p1 .q3p2 .q3p3 .q4 .q4p1 .q4p2 .q4p3 .q5 .q5p1 .q5p2 .q5p3 
pack .submitq .cancelq -side top -padx 4m -pady 1m

pack forget .userintro .suggest .uspace .search .uibk .ai .aibk .bikelist .chkoutbike .myname .button .button1 .button2 .line .line1 .line2 .button6 .buttonback1

}
####============Suggest bike AI=========####
proc suggestai {} {
destroy .ai .aibk .chkoutbike .bikelist
destroy .bikelist
listbox .bikelist
.bikelist configure -state normal ; 
.bikelist configure -activestyle underline ; 
focus .bikelist 
.bikelist activate 0 
global chos
global chos1
global chos2
global chos3
global chos4
if { $chos!="" && $chos1!="" && $chos2!="" && $chos3!="" && $chos4!="" } {
label .ai -text "\n\n\nWe Think You Might Consider This Bike \n\n"
button .chkoutbike -text "View Bike" -command {
global xcont
set xcont 2
set inputed [ .bikelist curselection ]
if { $inputed != "" } {

checkdetails
} else {
tk_messageBox -message "You have to Select a Bike" -icon warning -type ok
}

}
button .aibk -text "Go Back" -command {
set chos ""
set chos1 ""
set chos2 ""
set chos3 ""
set chos4 ""
suggestbike}
global mysql_handler 
set pattern "$chos$chos1$chos2$chos3$chos4" 

set res [ mysqlsel $mysql_handler "select Model_num1 from Bike_Showroom.Suggest where Suggest_pattern='$pattern'" -list ] 
set result1 [ mysqlsel $mysql_handler "select * from Bike_Showroom.Bike_model where Model_num='$res'" -list ]

foreach row $result1 { 
 set line ""

   foreach field $row { 
               set line "$line $field" 
                      } 
         .bikelist insert end "$line" 
                  }


pack .ai .bikelist .chkoutbike .aibk
pack forget .suggestwel .q1 .qop1 .qop2 .qop3 .q2 .q2p1 .q2p2 .q2p3 .q3 .q3p1 .q3p2 .q3p3 .q4 .q4p1 .q4p2 .q4p3 .q5 .q5p1 .q5p2 .q5p3 .submitq .cancelq
} else { 
tk_messageBox -message "You Must Answer All Questions" -icon warning -type ok

suggestbike}
}

####===========Serach a Bike ==========####
proc searchbike {} {
destroy .sea  .searchsubmit .lss .searchexit
global result xcont mysql_handler
set xcont 0
###############
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





########

label .sea -text "\nPlease select the Bike from the below List\n\n"
button .searchsubmit -text "Select" -command {
set invard [ .bikelist curselection ]
if { $invard != "" } {
Bikeoption } else {
tk_messageBox -message "You have to Select a Bike" -icon warning -type ok
}



}
label .lss -text "\n\n"
button .searchexit -text "Go Back" -command "userui"
grid .sea -row 0 -column 4 -in .bikebox
grid .bikelist -row 1 -column 4 -in .bikebox -sticky news
grid .scroll -row 1 -column 5 -in .bikebox -sticky news
pack .bikebox .searchsubmit .lss .searchexit
pack forget .userintro .suggest .uspace .search .uibk .selected .checkdetails .compare .feedbk .ret .f

}
