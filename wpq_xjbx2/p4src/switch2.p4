#include "includes/header.p4"
#include "includes/parser.p4"

action _drop(){
    drop();
}

action nop(){
}

table forward{
    reads{
        ethernet.src_addr : exact;
    }
}


control ingress{
    apply(smac);
}

control egress{
}

