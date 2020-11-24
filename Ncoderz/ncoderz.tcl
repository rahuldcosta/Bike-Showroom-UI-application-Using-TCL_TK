###########################################
#======================================================#
# Author:- Rahul C. Dcosta                             #
# Description:-Bike Showroom UI in Tcl/Tk              #
# Date Created:-15/10/2013                             #
# Date Modified:-26/10/2013                            #
# Copyrights:- All Rights to N-CoderZ Pvt.Ltd          #
#======================================================#
###===============MAIN===============###
wm title . "    BIKE SHOWROOM SYSTEM"
package require mysqltcl

set mysql_handler [mysqlconnect -host {localhost} -user {root} -password {rahulx11x} ]

mysqluse $mysql_handler {Bike_Showroom}
global mysql_handler
source [file join [file dirname [info script]] rahul1337.tcl]
source [file join [file dirname [info script]] swetaaprana.tcl]
source [file join [file dirname [info script]] prajakta1325.tcl]
source [file join [file dirname [info script]] siddhesh1329.tcl]
source [file join [file dirname [info script]] shirish1306.tcl]


wm geometry . 1366x768+100+100











