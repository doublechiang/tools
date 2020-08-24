=====================================================================
	Yafuflash2 utility Release version 4.16.21
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.21) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. fix some words display abnormal during flashing BMC 
  	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash2 utility Release version 4.16.20
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.20) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Don't close the session resource if send/get command failed because some commands would be re-tried again.
	2. Support BMC image signed with new format(other than legacy SHA1; e.g. SHA256)
	3. Allow all image types could be signed. (The image size is not multiple of MAX_SIZE_TO_READ)
	4. Fix the return code is 0 when update failed due to unsigned image.(include BIOS and CPLD)
	5. Fix the show wrong percentage while uploading BMC FW. Variable overflow
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash2 utility Release version 4.16.19
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.19) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Fix updating BIOS shows "Please power off the system before update MB BIOS" after updating BMC FW without reset.
	2. Modify the description of updating BIOS failed case.
	3. Modify the return value of function CheckPowerStatus.
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash2 utility Release version 4.16.18
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.18) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. fix Yafuflash display "%%" when upload image in shot time
	2. Remove "Resetting the firmware.........." for S5BN
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash2 utility Release version 4.16.16
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.16) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Add preserve bios option into update bmc script preserve-setting file.
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"

=====================================================================
	Yafuflash2 utility Release version 4.16.15
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.15) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Change preserve bios configuration from preserve-bios to preserve-nvram 
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"
		b) To preserve setting in Windows, run "win-pc.bat"
		   To preserve setting in Linux, run "linux-pc.sh"
	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"
		b) To Preserve setting in Windows, run "win_oob-pc.bat"
		   To preserve setting in Linux, run "linux_oob-pc.sh"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"

=====================================================================
	Yafuflash2 utility Release version 4.16.14
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.14) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Change preserve bios configuration from preserve-nvram to preserve-bios 
	2. Change the user account and password to "admin" and "cmb9.admin" in all script file
	
Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash2 utility Release version 4.16.13
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.13) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. To support update Bridge-IC (-d 0x20) and Bridge-IC bootloader (-d 0x21)
	2. Flush progress printing when flashing and verifying BIOS/BIC/BIC Bootloader
  3. Support "-logo" paramter that for RR11.5 to run time changing web logo. 

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash2 utility Release version 4.16.12
=====================================================================
Utility:
1. Yafuflash2 (version 4.16.12) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Changed to auto exit when user update BMC use different project BMC for 	QSM won't immediately fail issue. (etrack ID: 177869)
	2. add BMC and CPLD bit flag for firmware update identify.

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash2 Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash2 Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash2 Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.11
=====================================================================
Utility:
1. Yafuflash (version 4.16.11) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. For KCS under Linux, default use IPMI driver to send IPMI command.
	2. Automatically detect CA2/CA3 and CA2/CA6 as the KCS I/O address.
	3. Avoid using inb_p() and outb_p() in Linux, since in some Linux distributions implementation,
	   which will send data to Port80, and may cause BMC busy in snoop interrupt.
	4. Enhance the delay of wating USB device, add "Get OEM Info" command
	5. Remove printf message for "The Image Sizes are Different" (S2W project Issue ID:183863)
  6. modify error message to "Please power off the system before update MB BIOS." for OOB BIOS update at DC on.
  7. update script file for preserve configuration by default for BMC FW update.

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.10
=====================================================================
Utility:
1. Yafuflash (version 4.16.10) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Fix Linux OOB BMC update fail on creating IPMI session issue
	2. Fix Windows IB BMC update fail "Error Insuficient Buffer" issue
	3. modify Linux IB BMC update script file for few Linux OS have built-in 
	   ipmi module in kerenl BMC update fail issue 

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.08
=====================================================================
Utility:
1. Yafuflash (version 4.16.08) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Fix incorrect BIOS image can via Yafuflash update issue
	2. Fix Encrypted Image Flash via Yafuflash Error

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"


=====================================================================
	Yafuflash utility Release version 4.16.06
=====================================================================
Utility:
1. Yafuflash (version 4.16.06) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. Avoid infinite loop of "ECFStatus()" and VerifyStatus()" when socket is closed.	
	2. modify output filename from Yafuflash to Yafuflash.

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.04
=====================================================================
Utility:
1. Yafuflash (version 4.16.04) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
	1. for RHEL OS In-Band BMC FW update add issue "modprobe sg" to an init script.	
	2. get BMC status failed than print "BMC not ready..." message for start BMC FW update .

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.03
=====================================================================
Utility:
1. Yafuflash (version 4.16.03) 
   (test for BMC RR10 code base)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
  1. support Yafuflash update BMC by inband USB after BMC disable power saving of using USB.
  2. add parameter "-fb" for flash the BMC firmware without preserving boot section.	

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.02
=====================================================================
Utility:
1. Yafuflash (version 4.16.02)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
  1. The ipmi Drivers [Ucoresys.sys/UCOREW64.sys] copied in the YAfu flash Utility Folder for windows path.

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"



=====================================================================
	Yafuflash utility Release version 4.16.01
=====================================================================
Utility:
1. Yafuflash (version 4.16.01)

Supported BMC chip :  
1) AST2400/AST2500

Changed/Added:
  1. Add a "-preserve-nvram" option that is used to update BIOS and preserve NVRAM space.

Before update firmware image please check as below:
1. copy firmware image file to this directory
2. write the BMC firmware image file name to "rom.txt" and "rom_enc.txt" file

=====================================================================
	YAFUFlash Utility for BMC Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BMC FW via In-Band command line:
		a) in Window, run "win.bat"
		   in Linux, run "linux.sh"

	2. Update BMC FW via Out-of-Band command line:
		a) in Window, run "win_oob.bat <BMC IP>"
		   in Linux, run "linux_oob.sh <BMC IP>"

=====================================================================
	YAFUFlash Utility for BIOS Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update BIOS FW via Out-of-Band command line:
		a) in Window, run "ubios_oob.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_oob.sh <BMC IP> <BIOS Image>"
       
	2. Update BIOS FW with preserve nvram via Out-of-Band command line:
		a) in Window, run "ubios_preserve_nvram.bat <BMC IP> <BIOS Image>"
		   in Linux, run "./ubios_preserve_nvram.sh <BMC IP> <BIOS Image>"

=====================================================================
	YAFUFlash Utility for CPLD Firmware update procedure
=====================================================================
[Notice]:
	in this directory
	1. Update CPLD FW via Out-of-Band command line:
		a) in Window, run "ucpld_oob.bat <BMC IP> <CPLD Image>"
		   in Linux, run "./ucpld_oob.sh <BMC IP> <CPLD Image>"
