from tonpy import VmDict, CellBuilder

d = VmDict(32)
d.set(0, CellBuilder().store_int(123, 32).begin_parse())
d[1] = CellBuilder().store_int(123, 32).begin_parse()
print(d.is_empty())
print(d.get_cell().to_boc())
#d = VmDict(64, True)

# d = tonpy.VmDict(32, cell_root=tonpy.Cell())
# d[1] = 0x222222222
# print(d.is_empty())