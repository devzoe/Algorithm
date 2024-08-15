def solution(routes):
    routes.sort(key=lambda x: x[1])
    
    camera_count = 0
    last_camera_position = -30001
    
    for route in routes:
        if last_camera_position < route[0]:
            camera_count += 1
            last_camera_position = route[1]
    
    return camera_count