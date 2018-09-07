import re
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
            if other.properties[k] != v: #f
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
    contents = re.findall('(?<=;)[^;]{4,}(?=[;)])', input_string)
    if input_string == "(;)":
        return SgfTree()
    elif len(contents) > 0:
        properties = generate_properties(contents.pop(0).split("["))
        children   = generate_children(contents)
        return SgfTree(properties, children)
    else:
        return raise_error()

def generate_properties(array):
    key    = array.pop(0)
    values = append_values(array)
    return {key:values} if key == key.upper() else raise_error()

def append_values(array):
    values = []
    for i in array:
        values.append(i[slice(0, -1, 1)].replace('\t', ' ').replace('\\', ''))
        # values.append(re.findall('^(.*?)]', i)[0])
    return values

def generate_children(array, children = []):
    for i in array:
        properties = generate_properties(i.split("["))
        children.append(SgfTree(properties))
    return children

def raise_error():
    raise ValueError("Improperly formatted string")
