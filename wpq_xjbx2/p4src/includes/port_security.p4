header_type  port_sec_metadata_t{
    fields{
        port : 4;
    }
}

header port_sec_metadata_t port_sec_metadata;

table port_security{
    reads{
        ethernet.src_addr : exact;
        port_sec_metadata.port : exact;
    }
    actions {_nop; _drop;}
}

control port_security_process{
    apply(port_security);
}