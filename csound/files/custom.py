'''
Modify this file, by platform, to handle nonstandard options for third-party
dependencies. If you do modify this file, you should make it read-only
(or otherwise protect it) so that CVS will not overwrite it.

Order is important: place local paths ahead of system paths.
'''
import sys
import os

customCPPPATH = []
customCCFLAGS = []
customCXXFLAGS = []
customLIBS = []
customLIBPATH = []
customSHLINKFLAGS = []
customSWIGFLAGS = []

if sys.platform[:5] == 'linux':
    platform = 'linux'
    customCPPPATH.append(os.environ['LDFLAGS'])
    customCCFLAGS.append(os.environ['CFLAGS'])
    customCXXFLAGS.append(os.environ['CFLAGS'])
    customLIBPATH.append(os.environ['LDFLAGS'])
else:
    platform = 'unsupported platform'

