class SgfTree(object):
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for k, v in self.properties.items():
            if k not in other.properties:
                return False
            if other.properties[k] != v:
                return False
        for k in other.properties.keys():
            if k not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for a, b in zip(self.children, other.children):
            if a != b:
                return False
        return True

def parse(input_string):
    properties = check_input(input_string)
    return SgfTree(properties)

def check_input(input_string):
    try:
        contents = input_string[slice(1, -1, 1)]
        if contents[0] == ";" and len(contents) >= 5:
            return build_properties(contents.split('['))
        else:
            return {}
    except:
        return raise_error()

def build_properties(split_string, i = 0, properties = {}):
    if i > len(split_string) - 1:
        return properties
    else:
        #have key capitalization check here
        key = split_string[i][slice(1, len(split_string[i]), 1)]
        value = split_string[i + 1][slice(0, -1, 1)]
        properties[key] = properties.get(key, [value])
        return build_properties(split_string, i + 2, properties)

def raise_error():
    raise ValueError("Improperly formatted string")
