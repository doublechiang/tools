; The README of ASPEED iRMP SOC Flash Utility in Linux
;===============================================================================
1.System Requirement:
- Linux Environment
- Support ASPEED Chips
  >> AST1000/2000 A1 and after
  >> AST1100/2050/2100/2150/2200
  >> AST2300/1300/1050
  >> AST2400/1400
  >> AST2400/1400 + AST1070
  >> AST1010
  >> AST2500
  >> AST2600
2.Run Script File Usage:
- chmod u+x *.sh
- Select the update script
  >> socflash.sh: the firmware is provided by ASPEED, AMI, Avocent
  >> socflsah_elom.sh: the firmware is provided by Quanta
- Run Script
  >> Format1:
     ++ ./socflash.sh [new image] [backup image]
  >> Format2: Update image only
     ++ ./socflash.sh -s [new image]
  >> Format3: Backup old image only
     ++ ./socflash.sh -b [backup image]
3.Run Execution File Usage: (New Command Interface)
- Format:
  >> socflash [operand]
     ++ operand list
     +++ if=the update file
     +++ of=the backup file
     +++ is=the input string
     ++++ blank is not allowed in the string and the length of the string is below than 40 bytes
     ++++ example: is=11:22:33:44:55:66
     +++ bus=PCI device bus number
     +++ cs=chip select
     ++++ AST1000/2000: 0/1 (default: 0)
     ++++ AST1100/2050/2100: 0/1/2
     +++++ default: get from SCU trapping
     ++++++ if Boot Trapping is disabled, then set to 0 for AST2100, and 2 for others
     +++ flashtype=flash chip type
     ++++ 0/1/2/3: NOR/NAND/SPI/SYS SPI Flash
     +++++ SYS SPI: AST2500/2400/1400/2300/1300/1050 only
     +++ width= NOR flash bus width
     ++++ 8/16: AST2400/1400/2300/1300/1050
     ++++ 8   : AST2100/2200
     ++++ 16  : AST2000
     +++ skip=the skip size in bytes at the start of input file (default=0)
     +++ offset=the offset in bytes at the start of the flash (default=0)
     +++ count=the size in bytes copy to the flash (default=the size of the flash)
     +++ backupcount=the size in bytes backup from the flash (default=the size of the flash)
     +++ lpcport=the LPC port number (0x2e/0x4e) (it is required for "option=l")
     +++ writeclk/readclk/eraseclk: SPI Write CLK/Read CLK/EraseCLK
     ++++ writeclk=50	; The Max. SPI Write CLK is 50MHz
     +++ gpio_cs=r2: special options for AST2500 SPI2 use GPIOR2 as CS
     +++ gpio_b/gpio_f=set gpio before/after flash update program execute
     ++++ support chips: AST1100/2050/2100/2150/2200/1300/2300/1400/2400
     ++++ limitation: max. gpio set: 10
     ++++ format:[port+pin+data ....]
     ++++ example: gpio_b=c41a71 means set GPIO C4 to 1, A7 to 1 before program execute
     ++++ example: gpio_f=c40a70 means set GPIO C4 to 0, A7 to 0 after program execute
     +++ reginit_b/reginit_f=Reg. Table File
     ++++ set ARM interface reg. before/after flash update
     ++++ command example: reginit_b=reginit.inf
     ++++ reg. file format: [addr] [mask] [data]
     +++++ ex: 0x1e6e2000 0xffffffff 0x1688a8a8	; write 0x1688a8a8 to 0x1e6e2000
     +++++ notes: skip the command if add ";" at the first of the line
     +++ comport=the com port used
     ++++ only effect for option=u
     ++++ for example: comport=0 if use /dev/ttyS0
     ++++ only for standard COM port(ttyS), please use "portname" if use USB2COM
     +++ portname=the device file name of com port
     ++++ only effect for option=u
     ++++ for example: portname=/dev/ttyUSB0 if use /dev/ttyUSB0
     +++ baudrate=921600/115200(default)
     ++++ only effect for option=u
     ++++ ex: comport=0
     +++ rstflash=mxic
     ++++ execute software rest command for MX25L512 SPI flash
     +++ option=f|c|2|r|d|x|l|i|m
     ++++ f: skip the comparision of flash data and force to update
     ++++ c: use chip erase instead of sector erase
     ++++ r: reset scratch
     ++++ d: disable ARM after update flash
     ++++ 2: two flash update support
     +++++ AST1100/2050/2100: two SPI solution: 1st SPI is on CS2; 2nd SPI is on CS0
     +++++ AST2000: two NOR Flash Solution: 1st Flash is on CS0; 2nd Flash is on CS1
     ++++ x: low speed mode (SPI only)
     +++++ use this option if can' find SPI flash or update properly in normal mode
     ++++ l: Update firmware through LPC path
     +++++ AST2400/1400/2300/1300/1050 only
     ++++ i: Update Firmware Image to Flash only if Image and Flash Size are the same
     ++++ m: Update firmware through co-processor
     +++++ AST2400/1400 + AST1070 only
     ++++ w: Trigget WDT reset only
     ++++ u: Update firmware through UART
     +++++ AST2500/2600
     +++++ Running socflash utility on client machine and connect UART port to BMC debug UART port
     ++++ t: Skip Verification
     +++++ The updated data will not be validated. Please be aware of the risk before using this option.
  >> example:
     ++ socflash if=new.bin of=old.bin option=f
     +++ update the firmware image to new.bin
     +++ bacup the old firmware to old.bin
     +++ force to update without comparision
4.Run Execution File Usage: (Legacy Interface)
- Format:
  >> Normal: SOCFlash [-options] [the update soc file*] [the backup file*] [Chip Select] [Flash Type] [Skip Size] [Programming Size]
  >> Backup Only: SOCFlash -b [the backup file*] [Chip Select] [Flash Type] [Start Offset] [Programming Size]
  >> Skip Backup: SOCFlash -s [the update soc file*] [Chip Select] [Flash Type] [Start Offset] [Programming Size]
     ++ The fields add * means must have
- Options:
  >> Chip Select:
     ++ AST1000/2000: 0/1 (default: 0)
     ++ AST1100/2050/2100: 0/1/2
     +++ default: get from SCU trapping
     ++++ if Boot Trapping is disabled, then set to 0 for AST2100, and 2 for others
  >> Flash Type: (AST1100/2050/2100)
     ++ 0/1/2: NOR/NAND/SPI
  >> Skip Size: Skip size from image start (default: 0x0)
  >> Programming Size: The size need to program to Flash
  >> options:
     ++ b: backup only
     ++ s: skip backup
     ++ f: force to update flash
     ++ 2: special for two SPI support on AST1100/2050/2100
     +++   Boot CS: 2; Secondary CS: 0
- Example: socflash all.bin old.bin
5.Return Code:
- 0: success
- 1: failed
6.Support Flash Chip List:
- NOR:
  >> MXIC MX29LV640DT, MX29GL128E, MX29GL128DT, MX29GL256E
  >> Spansion S29xx064MxxR4, S29GL128Nx8, S29GL256Nx8
  >> SST 39VF640
  >> ST STM29W640F, M20EW256M, M29W256G, M29W640G
- NAND:
  >> Micron MT29F2G08
  >> Samsung K9F1G08U0A
- SPI:
  >> Spansion S25FL64A, S25FL128P, S25FL128S
  >> SST 25VF016B, 25VF064C
  >> ST M65P64, M25P128
  >> Winbond W25X16, W25X32, W25X64, W25Q16V, W25Q32BV, W25Q64BV, W25Q128BV
  >> MXIC MX25L12805D, MX25l2005C, MX25L3205D, MX25L6445E
  >> Numonyx N25Q128
  >> ATMEL AT26DF321, AT25DF321, AT25DF161
  >> [AST2300/2400] Spansion S25FL256S
  >> [AST2300/2400] Winbond 25Q256FV
  >> [AST2300/2400] MXIC MX25L25635E/F, MX25L25735E, MX66L512
  >> [AST2300/2400] Numonyx N25Q256, N25Q512
7.Verified Linux Distribution List
- RHEL 4.6 x86/x64
- RHEL 5.1 x86/x64
8.FAQ:
- Load Driver Failed and show message as follow:
  insmod: error inserting 'socflash_drv.ko': -1 Invalid module format
  >> Use the older version of SOCFLASH, please update to v.0.50 and after
- New Command Interface Support:
  >> Support New Command Interface after than v.0.90
- Show Error Message "Can't Open /dev/mem File"
  >> Please login as "root" user
- SOCFlash through LPC Path: AST1010/1050/1250
  >> add "option=l" and assign LPC port, "lpcport=0x2e" for example.
- SOCFlash through co-precessor: AST2400/1400 + AST1070
  >> add "option=m"
- SOCFlash through COM port: AST2500/2600
  >> Usage:
  +++ add option: "option=u"
  +++ assign COM port: "comport=3" example for com3
  +++ assign baudrate(only need for 921600): "baudrate=921600"
  >> Troubleshoot:
  +++ try normal speed instead if failed with "baudrate=921600"
- New support chips from v.0.96
  >> MXIC MX29GL128E, MX29GL256E
  >> SST 39VF640
  >> ST M20EW256M, M29W256G
- New support chips from v.0.97
  >> ST M29W640G
- New support chips from v.0.98
  >> SST 25VF064C
- New support chips from v.1.02
  >> MXIC MX29GL128DT/B
  >> Winbond W25Q64BV, W25Q128BV
  >> Numonyx N25Q128
- New support chips from v.1.03
  >> Winbond W25Q16V, W25Q32BV, W25X32
  >> ATMEL AT26DF321, AT25DF321
  >> MXIC MX25L3205D, MX25L6445E, MX25L25635E(AST2300), MX25L25735E(AST2300)
- New support chips from v.1.05
  >> Spansion S29GL064 8-bits mode for AST1300/2100/2150/2200/2300
- New support chips from v.1.06
  >> Support Numonyx N25Q256, Spansion S25FL256S on AST1050/1300/2300
- New support chips from v.1.07
  >> Numonyx N25Q512 on AST1050/1300/2300
  >> MXIC MX25L25635F on AST1050/1300/2300
  >> ATMEL AT25DF161
  >> Winbond 25Q256FV
- New support chips from v.1.08
  >> Spansion S25FL128/256S 256KB sector size
  >> MXIC MX66L512
9.Contact Window:
- chin-ting_kuo@aspeedtech.com

