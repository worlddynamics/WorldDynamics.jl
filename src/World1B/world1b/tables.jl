_tables = copy(World1A._tables)
_ranges = copy(World1A._ranges)

_tables[:brmm] = (1.2, 1.0, 0.85, 0.75, 0.7, 0.7)
_tables[:cfifr] = (1.0, 0.6, 0.3, 0.15, 0.1)
_tables[:ciqr] = (0.7, 0.8, 1.0, 1.5, 2.0)

_ranges[:ciqr] = (0.0, 2.0)

gettables() = copy(_tables)
getranges() = copy(_ranges)
