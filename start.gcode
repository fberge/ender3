G90 ;absolute positioning
M82 ;set extruder to absolute mode


; Marlin 1.1.9 features.
    M900 K0.50 ; Set K Value
    M205 J0.09 ; Set Junction Deviation
    
    
M300 S440 P200 ; Play a tone through the beeper
M117 Printer online. ; Print a message on the LCD.

;Auto Bed Leveling version:
	G28 ; Home all axes
	M140 S{material_bed_temperature} ;Start heating bed
	M190 S{material_bed_temperature} ;Wait for bed to reach temp before proceeding
	G29;
	M104 S{material_print_temperature} ;Start heating extruder
	M109 S{material_print_temperature} ;Wait for extruder to reach temp before proceeding
	M400 ;Finish moves before continuing
    G1 Z0.2 F500 ;Move X on the bed
	M400 ;Finish moves before continuing
	G1 Z10 F500 ;Move X on the bed


M300 S220 P100
M117 Sensors Online.
        
; Purge sequence
    G1 X248 Y-11 Z10 F3000 ;Move X on the bed
	M400 ;Finish moves before continuing
    G1 Z2 F500 ;Move X on the bed

M400
M300 S440 P200
M117 Extruder purge.

    G91
    G1 F150 E15 ; Extrude 15mm in the air
    G90
    G1 Y10 F3000  ;Move Y to knock the filament off
    M400
    G1 Z0.2 F500 ; Drop the Z Back
    G91
    G1 Y100 F750 E3 ; Extrude to the build plate
    G90

M400
M300 S440 P200

    G1 Y110 F4000 ; Quick Wipe

M400
M300 S660 P100

    G1 Z2.5 F1500 ; Lift the Z
    G92 E0

M300 S440 P50
M117 All Systems Nominal.