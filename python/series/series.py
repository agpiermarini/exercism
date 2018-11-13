def slices(series, length):
    array = []
    if length < 1 or length > len(series):
        raise ValueError("Length must be greater than 0 and shorter than series length.")
    for i in range(len(series)):
        slice = series[i:i+length]
        if len(slice) == length:
            array.append(series[i:i+length])
        else:
            break

    return array
