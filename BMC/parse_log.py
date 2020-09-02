#!/usr/bin/env python3

import os
import sys
import logging


class Entry():

    def addline(self, line):
        token = line.split()
        # if it's a sel,record the record number.
        if token[0] == 'SEL':
            self.record = token[4]
            #logging.info('SEL logged, ID=%s', self.record)
        if token[0] == 'FRU':
            #logging.debug('FRU token being parsed')
            self.fru =True
        if token[0] == 'Timestamp':
            self.timestamp = token[2]
        if token[0] == 'Description':
            # Some of the SEL do not have description, skip it.
            # logging.debug("token=%s", token)
            if len(token) < 3:
                return self
            if token[2] == 'Correctable' and token[3] == 'ECC':
                # logging.debug("ECC logged=%s", line)
                self.ECC = True
            if token[2] == 'IERR':
                self.ierr = True
            if token[2] == 'Uncorrectable' and token[3] == 'machine':
                self.umce = True
            if token[2] == 'Uncorrectable' and token[3] == 'ECC':
                self.uecc = True
            if token[2] == 'Upper' and token[3] == 'Critical':
                self.ucgh = True
            if token[2] == 'Lower' and token[3] == 'Critical':
                self.lcgl = True

        if self.fru:
            if token[0] == 'Chassis' and token[1] == 'Serial':
                self.serial = token[3]
                #logging.debug("FRU serial number %s is saved", self.serial)
            if token[0] == 'Board' and token[1] == 'Serial':
                self.board_serial = token[3]
        return self

    
    def __str__(self):
        return "Entry ECC =%s" % self.ECC

    def __init__(self):
        self.record =None
        self.fru=False
        self.serial = None
        self.board_serial = None
        self.ECC=False
        self.ierr=False
        self.umce=False
        self.uecc=False
        self.ucgh=False
        self.lcgl=False
        self.timestamp=None



def parse_entry(sel):
    system = {'ECC': False, 'serial': None, 'board_sn': None, 'ierr':False, 'umce':False, 'uecc': False, 'ucgh': False, 'lcgl': False, 
        'ecctime': None, 'ierrtime': None, 'umcetime': None, 'uecctime': None, 'ucghtime': None, 'lcgltime': None
    } 
    for i in sel:
        if i.fru:
            if i.serial:
                system['serial'] = i.serial
            if i.board_serial:
                system['board_sn'] = i.board_serial
        if i.record:
            if i.ECC:
                system['ECC'] = True
                system['ecctime'] = i.timestamp
            if i.ierr:
                system['ierr'] = True
                system['ierrtime'] = i.timestamp
            if i.umce:
                system['umce'] = True
                system['umcetime'] = i.timestamp
            if i.uecc:
                system['uecc'] = True
                system['uecctime'] = i.timestamp
            if i.ucgh:
                system['ucgh'] = True
                system['ucghtime'] = i.timestamp
            if i.lcgl:
                system['lcgl'] = True
                system['lcgltime'] = i.timestamp
            

    print("Chassis SN=%s, Board SN=%s, ECC=%s, ECCTime=%s, IERR=%s, IERRTime=%s, UMCE=%s, UMCETime=%s, UECC=%s, UECCTime=%s, UCGH=%s, UCGHTime=%s, LCGL=%s, LCGLTime=%s" % (system['serial'], 
        system['board_sn'], system['ECC'], system['ecctime'], system['ierr'], system['ierrtime'], 
        system['umce'], system['umcetime'], system['uecc'], system['uecctime'], 
        system['ucgh'], system['ucghtime'], system['lcgl'], system['lcgltime']))
        

def parse_file(filepath):
    if not os.path.isfile(filepath):
       logging.error("File path {} does not exist. Exiting...".format(filepath))
       sys.exit()
      
    sel = []
    entry = None
    with open(filepath) as fp:
        for line in fp:
            line = line.rstrip()
            if len(line.split()) > 0:
                # any keyword 'SEL' will create a new SEL
                if line.split()[0] == 'SEL' or line.split()[0] == 'FRU':
                    if (entry == None):
                        entry = Entry().addline(line)
                # any line with a space before 
                if line[0] == ' ':
                    if entry:
                        entry.addline(line)
            else:
                sel.append(entry)
                entry = None
                # any empty line will close the entry

    # all information saved in 
    parse_entry(sel)




def main():
    if len(sys.argv) < 2:
        logging.error("a directory path must be included")
        sys.exit()
    
#    parse_file(sys.argv[1])

    directory = sys.argv[1]
    for filename in os.listdir(directory):
        if (filename.endswith(".log")):
#            logging.debug("processing %s", filename)
            print(filename, end=', ')
            parse_file(os.path.join(directory, filename))



if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
#    logging.basicConfig(level=logging.WARNING)
    main()