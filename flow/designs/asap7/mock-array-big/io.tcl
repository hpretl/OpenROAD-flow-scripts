proc match_pins { regex } {
    set pins {}
    foreach pin [get_ports -regexp $regex] {
        lappend pins [get_property $pin name]
    }
    return $pins
}

set assignments [list \
    top \
    [ concat \
        {*}[match_pins io_insDown_.*] \
        {*}[match_pins io_outsUp_.*] \
    ] \
    bottom \
    [ concat \
        {*}[match_pins io_insUp_.*] \
        {*}[match_pins io_outsDown_.*] \
    ] \
    left \
    [ concat \
        {*}[match_pins io_insRight_.*] \
        {*}[match_pins io_outsLeft_.*] \
    ] \
    right \
    [ concat \
        {*}[match_pins io_insLeft_.*] \
        {*}[match_pins io_outsRight_.*] \
        {*}[match_pins io_lsbs_.*] \
    ] \
]

foreach {direction names} $assignments {
    set_io_pin_constraint -region $direction:* -pin_names $names
}
