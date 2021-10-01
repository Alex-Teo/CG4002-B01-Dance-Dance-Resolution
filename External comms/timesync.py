def calculate_clock_offset(beetle_timestamp_list):
    if(len(beetle_timestamp_list) >= 4) :
        RTT = (beetle_timestamp_list[3] - beetle_timestamp_list[0]) \
              - (beetle_timestamp_list[2] - beetle_timestamp_list[1])
        clock_offset = (beetle_timestamp_list[1] - beetle_timestamp_list[0]) - RTT/2
        return clock_offset
    else:
        print("error in beetle timestamp")
        return None



def calculate_ultra96_time(beetle_data_dict, clock_offset):
    time_ultra96 = 0
    value_list = []  # keeps the first 3 values
    count = 0
    for address in beetle_data_dict:
        for key in beetle_data_dict[address]:
            value_list.append(beetle_data_dict[address][key])
            count += 1
            if count >= 3:
                break
    
    if len(value_list) == 0:
        print("Dance data is empty")
        time_beetle = None
    else: 
        time_beetle = max(set(value_list), key = value_list.count) 
    
    if time_beetle is None:
        return None
    else:
        time_ultra96 = time_beetle - clock_offset
        return time_ultra96

def calculate_sync_delay(laptop1_timing, laptop2_timing, laptop3_timing):
    sync_delay = 850
    if laptop1_timing is not None and laptop2_timing is not None and laptop3_timing is not None:
        sync_delay = max(laptop1_timing, laptop2_timing, laptop3_timing) \
                     - min(laptop1_timing, laptop2_timing, laptop3_timing)
    elif laptop1_timing is None:
        sync_delay = max(laptop2_timing, laptop3_timing) - min(laptop2_timing, laptop3_timing)
    elif laptop2_timing is None:
        sync_delay = max(laptop1_timing, laptop3_timing) - min(laptop1_timing, laptop3_timing)
    elif laptop3_timing is None:
        sync_delay = max(laptop1_timing, laptop2_timing) - min(laptop1_timing, laptop2_timing)
    return sync_delay

    
