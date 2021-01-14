    .section .data
    

    .global gUnknown_08076130
gUnknown_08076130:
    .incbin "baserom.gba", 0x00076124, 0xC

    .global eeprom_list
eeprom_list:
    .incbin "baserom.gba", 0x00076130, 0xC

    .global gUnknown_0807613C
gUnknown_0807613C:
    .incbin "baserom.gba", 0x0007613C, 0xC

    .global epMaxTime
epMaxTime:
    .incbin "baserom.gba", 0x00076148, 0x68
    
    .global gUnknown_080761B0
gUnknown_080761B0:
    .space 0xB890
