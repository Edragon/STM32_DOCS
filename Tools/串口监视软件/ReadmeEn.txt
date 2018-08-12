


CommMonitor searil port monitor
 
Version: 6.1  
  
date:2012-01-02
home: http://www.ceiwei.com 


--------------------------------------------------------------------------------
1. Software Description
------------------

      The newly developed CommMonitor  use kernel driver ComDrv module, more accurate monitoring serial data events.
      CommMonitor detect, intercept, reverse analysis of serial communication protocol is detected RS232/422/485 serial port of professional tools, hardware and software engineers are the best assistant. CommMonitor to listen, intercept, record, analyze serial communication protocol, allowing you to operate the serial port of the application process and details of the simulation time by your listeners or device data, control flow, improve work efficiency.

Secondary development interface DEMO
See detailed method call: Demo \ directory Java7, JavaScript, Delphi, C + + Builder XE2, VS2008 (C #, VC, VB.net)   

\Demo\ActiveXForm (javascript)
\Demo\Delphi7
\Demo\C++BuilderXE
\Demo\VS2008\CSharp(C#)   
\Demo\VS2008\VB.net
\Demo\VS2008\VC 
\Demo\Java7 



2 Feature List:
------------------
 - Real-time data capture record
 - Virtual serial port automatically senses monitor PNP
 - Distinguish between monitoring data view: list view, ASCII view, DUMP view, IOCTL view
 - Monitoring data can be automatically saved to a log file
 - Support for standard serial port, virtual serial port expansion, and USB to serial port monitoring and other equipment
 - Support for list view, ASCII view, DUMP view, IOCTL view to find
 - Support (IOCTLs) monitoring and analysis of its parameters


3 Operating Environment
------------------
  Windows 2000/XP/2003/Win7

Note:
  Vista not tested.
  Support Win7 but not pressure tested, only users of the test;
  64-bit Win7, win2008 (need to disable driver signing), Win2003, XP, (Win7, W2008) but did not pressure tested, only users of the test;
  Ring3 application for Win32-bit systems running 64-bit, 32/64 bit drivers for the sub-version.



4 Install and Uninstall
------------------
  You can run the program directly, without having to install.


5 License
------------------
  This software is a free sharing software, you can download any use.


6. Disclaimer of Warranties
------------------
  CEIWIEI ensure that the software does not contain any trojans, viruses, etc. can cause damage to your system for malicious code. But refused to guarantee any responsibility for the use or inability to use the software caused all the risks and consequences borne by the user.




7. The license agreement and authorize
------------------
   See also: [License Agreement].
 




8 List of documents
------------------
    CommMonitor.exe serial port monitoring tool release
    ComDrv.sys Serial Monitor Sys-driven release
    commmonitor.chm serial monitoring to help CHM documentation
    Readme.txt Readme document
    CommTone.exe serial debugging tools



9. Legacy maintenance update to stop (refer to the previous version 6.0)
--------------------
   Earlier versions of Win32 HOOK APIs in the form of release, and stop legacy maintenance update.

   Old: SDK development and interface go to the official website Demo Download: http://www.ceiwei.com









10. Update log
-------------------------------------------------------------------

 
v6.1 Date :2012 -01-02
-------------------------
    1 to modify part of the memory allocation problem;
    2 new languages OCX  Demo;
    3 Drive Loader directly in the EXE in the package, remove the DLL;
    4 increase the Inno Setup package.



v6.0 Date :2011 -09-15
-------------------------
   1, new writing, using the kernel driver module monitors;
   2, the new user interface, more friendly operating experience;
   Feature List:
 - Real-time data capture record
 - Virtual serial port automatically senses monitor PNP
 - Distinguish between monitoring data view: list view, ASCII view, DUMP view, IOCTL view
 - Monitoring data can be automatically saved to a log file
 - Support for standard serial port, virtual serial port expansion, and USB to serial port monitoring and other equipment
 - Support for list view, ASCII view, DUMP view, IOCTL view to find
 - Support (IOCTLs) monitoring and analysis of its parameters




v5.0 Date :2011 -06-01
------------------------
   1, the new serial number Han EscapeCommFunction interception configuration information;
   2, the number of new GetCommModemStatus Han intercept of CTS, DSR, Ring, Rlsd state response;
   3, shows the same process a number of serial operations log;
   4, the stability of the optimization.


v4.0 Date :2011 -01-01
-------------------------
   1, the new multi-task control, which can monitor any number of procedures, without disturbing each other;
   2, wrap display;
   3, Stability testing;
   4, memory optimization.



v3.0 Date 2010 -02-03
------------------------
   1, no DLL release
 


v2.0 Date :2009 -12-01
------------------------
    1, a new virtual serial port monitor, older version can not change the original virtual serial port monitor;

    2, DLL version, not the global processes HOOK, only the specified processes HOOK;

    3, prepared using pure API all the new monitoring modules, security and stability and efficient;

    4, will not take up the serial port (COM port), only the intercept of the relevant API;

    5, can be opened in the serial monitor, a change some monitoring software can only open the front control;

    6, to capture the serial port (COM port) to open, read and write data, close the operation, and can also monitor the specified process up to 255 serial port;

    7, you can drag the window to capture the icon directly to the target process window, select the process.
 

v2.0 Date :2007 -08-01
------------------------
    1, HOOK API-style serial port monitoring;
    2, will not take up the serial port (COM port), only the intercept of the relevant API;
    3, the global processes HOOK. 



--------------------------------------------------------------------------------




copyright (C) 2003-2011 ceiwei
www.ceiwei.com

