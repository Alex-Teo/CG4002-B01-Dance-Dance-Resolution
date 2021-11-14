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

    
