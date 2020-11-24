#=====================================================================#
# Author:- Siddhesh Naik                                              #
# Description:-Bike Showroom UI in Tcl/Tk (Feedback Moudle)           #
# Date Created:-15/10/2013                                            #
# Date Modified:-26/10/2013                            		      #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd    		      #
#=====================================================================#

###########===========FEEDBACK Option==========##################

proc feedback {} {
global mysql_handler

.bikelist configure -state normal;
.bikelist configure -activestyle underline;
focus .bikelist
.bikelist activate 0
pack forget .selected .checkdetails .compare .feedbk .ret

proc review_process {} {
destroy .f_name .f_entname .f_age .f_entage .f_bike .f_questions .f_que1 .f_frmrad1 .f_rad11 .f_rad12 .f_rad13 .f_que2 .f_frmrad2 .f_rad21 .f_rad22 .f_rad23 .f_que3 .f_frmrad3 .f_rad31 .f_rad32 .f_rad33 .f_label .ent .f_submit .f_cancel
label .f_name -text "NAME:"
entry .f_entname -textvariable f_entname
label .f_age -text "AGE:"
entry .f_entage -textvariable f_entage

label .f_bike -text "Please select the BIKE:\n"

label .f_questions -text "Please answer following Questions"

label .f_que1 -text "How was the overrall service?"
frame .f_frmrad1
radiobutton .f_rad11 -text "A)Very Good" -variable sel1 -value "A" 
radiobutton .f_rad12 -text "B)Good" -variable sel1 -value "B"
radiobutton .f_rad13 -text "C)Bad" -variable sel1 -value "C"

label .f_que2 -text "How was the service given by the Customer Service Executives?"
frame .f_frmrad2
radiobutton .f_rad21 -text "A)Very Good" -variable sel2 -value "A"
radiobutton .f_rad22 -text "B)Good" -variable sel2 -value "B"
radiobutton .f_rad23 -text "C)Bad" -variable sel2 -value "C"

label .f_que3 -text "How did you find the BIKE SHOWROOM SYSTEM INTERFACE?"
frame .f_frmrad3
radiobutton .f_rad31 -text "A)Very Good" -variable sel3 -value "A"
radiobutton .f_rad32 -text "B)Good" -variable sel3 -value "B"
radiobutton .f_rad33 -text "C)Bad" -variable sel3 -value "C"

label .f_label -text "Extra Comments"
entry .ent -textvariable textentry -width 50

button .f_submit -text "SUBMIT" -command { 
set input [ .bikelist curselection ]
if { $input != "" } {
set  fentbike [ .bikelist get $input ]
set fieldz [split $fentbike { } ]
lassign $fieldz \
         variant model modelno rrt
 
set f_entbike "$modelno $rrt"
if { $f_entname != "" && $f_entage != "" && $sel1 != "" && $sel2 != "" && $sel3 != "" && $textentry != "" } {
mysqlsel $mysql_handler "INSERT INTO Bike_Showroom.Feedback( Name, Age, Bike_name, Question1, Question2, Question3, comments)VALUES( '$f_entname', '$f_entage', '$f_entbike', '$sel1', '$sel2', '$sel3', '$textentry')"
tk_messageBox -message "Thanks for your valuable Time" -type ok
} else {
tk_messageBox -message "Please Fill each field" -icon warning -type ok
}
} else {
tk_messageBox -message "Please Fill each field" -icon warning -type ok
}
}

button .f_cancel -text "CANCEL" -command {
set f_entname ""
set f_entage ""
set sel1 ""
set sel2 ""
set sel3 ""
set textentry ""
pack .f_feed .f_choice .f_write .f_readd .f_exitable
pack forget .f_name .f_entname .f_age .f_entage .f_bike .bikebox2 .f_questions .f_que1 .f_frmrad1 .f_rad11 .f_rad12 .f_rad13 .f_que2 .f_frmrad2 .f_rad21 .f_rad22 .f_rad23 .f_que3 .f_frmrad3 .f_rad31 .f_rad32 .f_rad33 .f_label .ent .f_submit .f_cancel

}
grid .bikelist -row 1 -column 4 -in .bikebox2 -sticky news
grid .scroll -row 1 -column 5 -in .bikebox2 -sticky news

pack .f_name .f_entname .f_age .f_entage .f_bike .bikebox2 .f_questions .f_que1 .f_frmrad1 .f_rad11 .f_rad12 .f_rad13 .f_que2 .f_frmrad2 .f_rad21 .f_rad22 .f_rad23 .f_que3 .f_frmrad3 .f_rad31 .f_rad32 .f_rad33 .f_label .ent .f_submit .f_cancel
pack forget .f_feed .f_choice .f_write .f_readd .f_exitable
}


proc read_process {} {
destroy .f_back .txt 
global mysql_handler
set que1count 0
set que2count 0
set que3count 0
set tot_count 0
##===============
destroy .feedback .scrollview
frame .feedback



##================
text .txt -yscrollcommand ".scroll set" -width 100 -height 40 
scrollbar .scrollview -command ".txt yview"

 .txt insert end "USER REVIEWS\n"

  set fb_field [ mysqlsel $mysql_handler "Select fb_ID from Bike_Showroom.Feedback"]
  foreach id $fb_field {
  set q1 [ mysqlsel $mysql_handler "Select Question1 from Bike_Showroom.Feedback" -list]
  foreach qr1 $q1 {
     foreach que1 $qr1 {
       if { $que1 == "A" } {
       set que1count [ expr $que1count + 1 ]
       set tot_count [ expr $tot_count + 1 ]
       } else {
         set tot_count [ expr $tot_count + 1 ]
       }
     }
  }
  set q2 [ mysqlsel $mysql_handler "Select Question2 from Bike_Showroom.Feedback" -list]
  foreach qr2 $q2 {
     foreach que2 $qr2 {
       if { $que2 == "A" } {
       set que2count [ expr $que2count + 1 ]
       }
     }
  }
  set q3 [ mysqlsel $mysql_handler "Select Question3 from Bike_Showroom.Feedback" -list]
  foreach qr3 $q3 {
     foreach que3 $qr3 {
       if { $que3 == "A" } {
       set que3count [ expr $que3count + 1 ]
       }
     }
  }
}
 .txt insert end "$que1count out of $tot_count people was satisfied with our overrall service\n\n"
 .txt insert end "$que2count out of $tot_count people said that service given by the Customer Service Executives was Excellent\n\n"
 .txt insert end "$que3count out of $tot_count people were happy with the BIKE SHOWROOM SYSTEM INTERFACE\n\n"
 .txt insert end "Feedbacks given by the people\n"
set name [ mysqlsel $mysql_handler "Select Name from Bike_Showroom.Feedback" -list]
 foreach row $name {
 set line "NAME\n"
 set com "COMMENTS\n"
       foreach nan $row {
    set line "$line $nan\n"
  set comments [ mysqlsel $mysql_handler "Select comments from Bike_Showroom.Feedback WHERE Name='$nan'" -list]
         foreach xcomt $comments {
         
         foreach xrow $xcomt {
         set com "$com $xrow\n"

             }
          }
       }
     .txt insert end "$line$com"
 }
button .f_back -text "BACK" -command { 
pack .f_feed .f_choice .f_write .f_readd .f_exitable
pack forget .txt .f_back .feedback
}

.txt configure -state disable
grid .txt -row 1 -column 4 -in .feedback -sticky news
grid .scrollview  -row 1 -column 5  -in .feedback -sticky news
pack .feedback
pack .f_back 
pack forget .f_feed .f_choice .f_write .f_readd .f_exitable
}

destroy .f_feed .f_choice .f_write .f_readd .f_exitable
label .f_feed -text "FEEDBACK"
label .f_choice -text "Please select one"
button .f_write -text "WRITE a REVIEW" -command "review_process"

button .f_readd -text "READ ALL REVIEWS" -command "read_process"

button .f_exitable -text " GO BACK " -command "Bikeoption"

pack .f_feed .f_choice 
pack .f_write .f_readd .f_exitable -side top -padx 4m -pady 1m
pack forget .selected .checkdetails .compare .feedbk .ret

}

