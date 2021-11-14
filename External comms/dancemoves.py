def swap_positions(positions, pos):
    pos = [pos[positions[0]-1], pos[positions[1]-1], pos[positions[2]-1]]

    if pos == ["S", "S", "S"]:  # 1, 1 symbol = 1 dancer
        return [positions[0], positions[1], positions[2]]
    elif pos == ["S", "S", "L"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["S", "S", "R"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["S", "L", "S"]:
        return [positions[1], positions[0], positions[2]]
    elif pos == ["S", "L", "L"]:
        return [positions[1], positions[2], positions[0]]
    elif pos == ["S", "L", "R"]:
        return [positions[1], positions[0], positions[2]]
    elif pos == ["S", "R", "S"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["S", "R", "L"]:  # 2
        return [positions[0], positions[2], positions[1]]
    elif pos == ["S", "R", "R"]:
        return [positions[0], positions[2], positions[1]]
    elif pos == ["L", "S", "S"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["L", "S", "L"]:
        return [positions[2], positions[1], positions[0]]
    elif pos == ["L", "S", "R"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["L", "L", "S"]:
        return [positions[1], positions[0], positions[2]]
    elif pos == ["L", "L", "L"]:
        return [positions[1], positions[2], positions[0]]
    elif pos == ["L", "L", "R"]:
        return [positions[2], positions[0], positions[1]]
    elif pos == ["L", "R", "S"]:
        return [positions[2], positions[0], positions[1]]
    elif pos == ["L", "R", "L"]:
        return [positions[2], positions[0], positions[1]]
    elif pos == ["L", "R", "R"]:
        return [positions[2], positions[0], positions[1]]
    elif pos == ["R", "S", "S"]:
        return [positions[0], positions[1], positions[2]]
    elif pos == ["R", "S", "L"]:  # 3
        return [positions[2], positions[1], positions[0]]
    elif pos == ["R", "S", "R"]:
        return [positions[1], positions[0], positions[2]]
    elif pos == ["R", "L", "S"]:  # 4
        return [positions[1], positions[0], positions[2]]
    elif pos == ["R", "L", "L"]:  # 5
        return [positions[1], positions[2], positions[0]]
    elif pos == ["R", "L", "R"]:
        return [positions[1], positions[0], positions[2]]
    elif pos == ["R", "R", "S"]:
        return [positions[2], positions[0], positions[1]]
    elif pos == ["R", "R", "L"]:  # 6  ones that makes sense
        return [positions[2], positions[0], positions[1]]
    elif pos == ["R", "R", "R"]:
        return [positions[2], positions[0], positions[1]]        
