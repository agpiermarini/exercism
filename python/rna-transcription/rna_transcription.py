def to_rna(dna_strand):
    complement = ""
    for i in dna_strand:
        if complements[i]:
            complement += complements[i]
        else:
            raise Exception("Not a valid DNA strand")

    return complement


complements = {'G': 'C',
               'C': 'G',
               'T': 'A',
               'A': 'U'
               }
