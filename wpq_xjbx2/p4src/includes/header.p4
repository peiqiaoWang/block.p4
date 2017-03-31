
header_type etherent_t {
    fields{
        dst_addr : 48;
        src_addr : 48;
        ether_type : 16;
    }
}

header_type intrinsic_metadata_t{
    fields{
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        if_field_list : 32;
    }
}


header_type ipv4_t{
    fields{
        version : 4;
        ihl : 4;
        type_service : 8;
        total_length : 16;
        identification : 16;
        flags : 3;
        fragment_offset : 13;
        ttl : 8;
        protocol : 8;
        header_checksum : 32;
        src_ip : 32;
        des_ip : 32;
    }
}

header_type icmp_t{
    fields{
        type_code : 16;
        checksum : 16;
    }
}

header_type tcp_t{
    fields{
        src_port : 16;
        dst_port : 16;
        seq_no : 32;
        ack_no : 32;
        header_length : 4;
        reserve : 6;
        flags : 6;
        window : 16;
        checksum : 16;
        urgent_ptr : 16;
    }
}

header_type udp_t{
    fields{
        src_port : 16;
        dst_port : 16;
        uses_length : 16;
        checksum : 16;
    }
}