wm geometry . 1366x768+100+100
set types {
        
        {"Image Files"          {.jpeg .gif}          }
        
}

proc doIt {label} {
    global types   
    set file [tk_getOpenFile -filetypes $types -parent .]
    $label configure -text $file
    puts $file
}

label .pathoffile -text "No File"
button .uploadbutton -text "Select a file?" \
        -command "doIt .pathoffile"

grid .uploadbutton -row 0 -column 0
grid .pathoffile -row 0 -column 1
