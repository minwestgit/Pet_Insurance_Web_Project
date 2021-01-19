package com.dbinc.sanghwa.map;

import lombok.Data;

@Data
public class MapVO {
        int h_idx;
        String h_name;
        String h_address;
        String h_phone;
        Double h_lat;
        Double h_long;
        int h_selected;
}

