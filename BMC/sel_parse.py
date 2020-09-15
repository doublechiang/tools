#!/usr/bin/env python3
# version 1.0

import os
import sys
import logging
import subprocess
from optparse import OptionParser


class Sel():
    """ Feed the Sel elist output line by line, and get a return list contain all of the Sel entry
        The Sel exist in a dictionary form
    """
    def parseLine(self, line):
        """ feed the lines, with an empty lines will close any unfinished sel.
        """
        line = line.lstrip().rstrip()
        if len(line.split()) == 0:
            if self.sel:
                self.sel_list.append(self.sel.copy())
                self.sel=dict()

        if len(line.split(':')) >= 2:
            key, value = self._getKeyValue(line)
            if key == 'SEL Record ID':
                # if sel is not empty, create a new record and 
                if self.sel:
                    self.sel_list.append(self.sel.copy())
                    self.sel=dict()

            self.sel[key] = value
    
    def getList(self):
        return self.sel_list

    def _getKeyValue(self, line):
        token=line.split(':')
        return (token[0].lstrip().rstrip(), token[1].lstrip().rstrip())

    def __init__(self):
        self.sel_list=list()
        self.sel=dict()

class SelParse():

    post_error_code = {
        'a103' : 'Password cleared by jumper',
        'a104' : 'CMOS/NVRAM configuration cleared',
        'a105' : 'BMC Failed (No Response)',
        'a106' : 'BMC Failed (Self Test Fail)',
        '00d5' : 'No space for Legacy Option ROM',
        'a200' : 'DIMM initialization fail. (DIMM_A0)',
        'a201' : 'DIMM initialization fail. (DIMM_A1)',
        'a208' : 'DIMM initialization fail. (DIMM_B0)',
        'a209' : 'DIMM initialization fail. (DIMM_B1)',
        'a210' : 'DIMM initialization fail. (DIMM_C0)',
        'a211' : 'DIMM initialization fail. (DIMM_C1)',
        'a218' : 'DIMM initialization fail. (DIMM_D0)',
        'a219' : 'DIMM initialization fail. (DIMM_D1)',
        'a220' : 'DIMM initialization fail. (DIMM_E0)',
        'a221' : 'DIMM initialization fail. (DIMM_E1)',
        'a228' : 'DIMM initialization fail. (DIMM_F0)',
        'a229' : 'DIMM initialization fail. (DIMM_F1)',
        'a230' : 'DIMM initialization fail. (DIMM_G0)',
        'a231' : 'DIMM initialization fail. (DIMM_G1)',
        'a238' : 'DIMM initialization fail. (DIMM_H0)',
        'a239' : 'DIMM initialization fail. (DIMM_H1)',
        'a2ff' : 'DIMM initialization',
        'a300' : 'DIMM Configuration problem. (DIMM_A0)',
        'a301' : 'DIMM Configuration problem. (DIMM_A1)',
        'a308' : 'DIMM Configuration problem. (DIMM_B0)',
        'a309' : 'DIMM Configuration problem. (DIMM_B1)',
        'a310' : 'DIMM Configuration problem. (DIMM_C0)',
        'a311' : 'DIMM Configuration problem. (DIMM_C1)',
        'a318' : 'DIMM Configuration problem. (DIMM_D0)',
        'a319' : 'DIMM Configuration problem. (DIMM_D1)',
        'a320' : 'DIMM Configuration problem. (DIMM_E0)',
        'a321' : 'DIMM Configuration problem. (DIMM_E1)',
        'a328' : 'DIMM Configuration problem. (DIMM_F0)',
        'a329' : 'DIMM Configuration problem. (DIMM_F1)',
        'a330' : 'DIMM Configuration problem. (DIMM_G0)',
        'a331' : 'DIMM Configuration problem. (DIMM_G1)',
        'a338' : 'DIMM Configuration problem. (DIMM_H0)',
        'a339' : 'DIMM Configuration problem. (DIMM_H1)',
        'a3ff' : 'DIMM Configuration problem.'
    }

    def parseBuffer(self, content):
        sel = Sel()
        for line in content.splitlines():
            sel.parseLine(line)

        sel.parseLine("")
        sel_list=sel.getList()
        self._decodeSensor9e(sel_list)


    def parseFile(self, filepath):
        if not os.path.isfile(filepath):
            logging.error("File path {} does not exist. Exiting...".format(filepath))
            sys.exit(1)

        sel = Sel()        
        with open(filepath) as fp:
            for line in fp:
                sel.parseLine(line)

        sel.parseLine("")
        sel_list=sel.getList()

        self._decodeSensor9e(sel_list)

    def _decodeSensor9e(self, sel_list):
        for sel in sel_list:
            if sel.get('Sensor Number') == '9e':
                if sel.get('Event Data')[0:2] == 'a0':
                    error_code=self._swap(sel.get('Event Data')[2:6])
                    print("ID: {}, EvtData: {}, Desp: {}".format(sel.get('SEL Record ID'), sel.get('Event Data'), SelParse.post_error_code.get(error_code)))


    def _swap(self, bytes):
        lsb = bytes[2:4]
        msb = bytes[0:2]
        return lsb+msb


if __name__ == "__main__":
    logging.basicConfig(level=logging.ERROR)
#    logging.basicConfig(level=logging.WARNING)
    parser = OptionParser()
    parser.add_option("-H", dest="host", help="Specifiy the remote host to query")
    parser.add_option("-U", dest="username", help="Remote BMC username")
    parser.add_option("-P", dest="passw", help="Remote BMC password")
    parser.add_option("-f", dest="fn", help="ipmitool -v sel elist output file")

    (options, args) = parser.parse_args()

    # if all remote host condition provided, calling remote, otherwise call in-band
    if options.fn:
        SelParse().parseFile(options.fn)
        sys.exit()
    elif options.host and options.username and options.passw:
        cmd="ipmitool -H {} -U {} -P {} -v sel elist".format(options.host, options.username, options.passw)
    else:
        cmd="ipmitool -v sel elist"

    result = subprocess.run(cmd.split(), universal_newlines=True, stdout=subprocess.PIPE)
    parser = SelParse()
    parser.parseBuffer(result.stdout)

    
