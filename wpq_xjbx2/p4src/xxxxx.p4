#include "includes/header.p4"
#include "includes/parser.p4"
#include "includes/port_security.p4"

action _drop(){
    drop();
}

action _nop(){
}

#define MAC_LEARN_RECEIVER 1024

field_list mac_learn_digest{
    ethernet.src_addr;
    standard_metadata.ingress_port;
}
//mac learn according to  srcAddr ingress_port
action mac_learn(){
    generate_digest(MAC_LEARN_RECEIVER, mac_learn_digest);
}

table smac{
    reads{
         ethernet.src_addr : exact;
    }
    actions {mac_learn; _nop;}
    size : 512;
}

action forward(port){
    modify_field(standard_metadata.egress_spec, port);
    modify_field(port_sec_metadata.port, port);
}

action broadcast(){
    modify_field(intrinsic_metadata.mcast_grp, 1);
}

table dmac{
    reads{
        ethernet.src_addr : exact;
    }
    actions{_nop; _drop;}
}

table mcast_src_pruning{
    reads{
        standard_metadata.instance_type : exact;
    }
    actions{_nop;_drop;}
    size : 1;
}

control ingress{
    apply(smac);
    apply(dmac);
}

control egress{
    if(standard_metadata.ingress_port == standard_metadata.egress_port){
        apply(mcast_src_pruning);
    }
    port_security_process();
}