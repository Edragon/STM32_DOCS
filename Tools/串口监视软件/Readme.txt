         
                 串口监视精灵CommMonitor



 
当前版本：6.1  
发布日期：2012-01-02 
主页：http://www.ceiwei.com 
--------------------------------------------------------------------------------



1.软件描述
------------------

      全新开发的CommMonitor 使用内核驱动ComDrv模块，更准确的监视串口数据，事件。
      CommMonitor 侦测、拦截、逆向分析串口通信协议, 是侦测RS232/422/485串行端口的专业工具软件，是软硬件工程师的最佳助手。CommMonitor 能侦听、拦截、记录、分析串行通信协议，让您对应用程序操作串行端口的过程和细节，让您及时的模拟被侦听程序或设备的数据、控制流，提高工作效率。

      二次开发接口DEMO 
      详细调用方法请参看： Demo\  目录的Java7、JavaScript、Delphi、C++Builder XE2、VS2008(C#,VC,VB.net)调用DEMO

\Demo\ActiveXForm (javascript)
\Demo\Delphi7
\Demo\C++BuilderXE
\Demo\VS2008\CSharp(C#)   
\Demo\VS2008\VB.net
\Demo\VS2008\VC 
\Demo\Java7 


2.功能列表: 
------------------
 - 数据传输实时捕获记录
 - 自动感知虚拟串口PNP监控
 - 区分监控数据视图：列表视图，ASCII视图，DUMP视图，IOCTL视图
 - 可自动保存监控数据到日志文件
 - 支持标准串行口、扩展虚拟串行口，以及USB转串行口等设备的监控
 - 支持列表视图，ASCII视图，DUMP视图，IOCTL视图查找
 - 支持(IOCTLs)及其参数的监控与分析


3.运行环境
------------------
  Windows 2000/XP/2003/Win7.
注意：
  支持Windows 2003/64位,XP64位 没有经过压力测试, 只有网友测试通过；
  应用层程序为Win32位可运行在64位系统上，驱动为分32/64位版本；
  Vista未测试；
  支持Win7但未经过压力测试，只有网友测试通过。 




4.安装与卸载
------------------
  可以直接运行程序，无需安装。


5.使用许可
------------------
  本软件是一款共享免费软件，您可以下载任意使用。


6.拒绝担保
------------------
  CEIWIEI 保证该软件不含任何木马，病毒等能够对您的系统造成破坏的恶意代码。但拒绝任何责任担保，对因使用或不能使用该软件所导致的全部风险及后果均由用户自己承担。




7.许可协议与授权
------------------
   请参看:[许可协议]。
 




8.文件清单
------------------
    CommMonitor.exe         串口监视工具 发布版
    ComDrv.sys              串口监视Sys驱动  发布版  
    commmonitor.chm         串口监视 帮助CHM文档
    Readme.txt              Readme文档
    CommTone.exe            串口调试工具



9.旧版维护更新停止(指6.0版本以前的)
--------------------
   旧版为Win32 HOOK APIs的形式发布，同时停止旧版维护更新。

   旧版：SDK开发Demo 及接口 请到官网下载: http://www.ceiwei.com



10.ActiveX接口(CommMonitor6x.ocx) 
-----------------------------------------------------

详细调用方法请参看： Demo\  目录的Java7、JavaScript、Delphi、C++Builder XE2、VS2008(C#,VC,VB.net)调用DEMO

\Demo\ActiveXForm (javascript)
\Demo\Delphi7
\Demo\C++BuilderXE
\Demo\VS2008\CSharp(C#)   
\Demo\VS2008\VB.net
\Demo\VS2008\VC 
\Demo\Java7  

CommMonitor6x.ocx注册方法
-----------------------------
   1.打开Reg.bat注册OCX组件。
   2.打开UnReg.bat反注册组件，删除。



HTML javascript 嵌入注意
---------------------
1.360等安全软件会拦截IE浏览器加载OCX，建议打开前先关闭或加入白名单。
2.如果是普通户需要管理员权限注册OCX控件。
3.CommMonitor6x.ocx为试用版。
4.支持IE5.0或以上浏览器。
5.互联网发布时，客户端 Internet选项->安全->Internet->ActiveX项,相应的选项要启用。


相关常量
---------------------------
  IRP_MJ_CREATE                   =$00;  //串口打口
  IRP_MJ_CLOSE                    =$02;  //串口关闭
  IRP_MJ_READ                     =$03;  //读取数据
  IRP_MJ_WRITE                    =$04;  //写入数据
  IRP_MJ_DEVICE_CONTROL           =$0E;  //控制码
  IRP_MJ_CLEANUP                  =$12;  //清理串口实例




CommMonitor6x.ocx的调用接口Delphi描述
-------------------------------------
    方法：
    function PauseMonitor(bPause: WordBool): WordBool; safecall;              //暂停监控串
    function StartMonitor(const sPortName: WideString): WordBool; safecall;   //监控串口
    function StopMonitor: WordBool; safecall;                                 //停止监控  
    function GetPIDImagerName(dwPID: LongWord): WideString; safecall;         //将进PID转成进程名


    事件:
    //OnMonitor为数据蒱获事件
    //sPortName为当前蒱获串口的名称
    //dwCtrlCode为控制码或IRP_MJ function Code;  大于$400的为控制码(IRP_MJ_DEVICE_CONTROL)
    //dwPID为当前蒱获串口所在的进程的PID
    //vtData为二进制数据
    //dwSize为二进制数据的长度
    procedure OnMonitor(const sPortName: WideString; dwCtrlCode: Integer; dwPID: Integer; 
                        var vtData: OleVariant; dwSize: Integer);  
    
   //OnAscii为数据蒱获事件
   //sPortName为当前蒱获串口的名称
   //dwCtrlCode为控制码或IRP_MJ function Code; 大于$400的为控制码(IRP_MJ_DEVICE_CONTROL)
   //dwPID为当前蒱获串口所在的进程的PID
   //vtData它会将蒱获的数据以16进制格式化输出为可识别ASCII码数据,同时ctlCode码也会格式化输出
   //dwSize为二进制数据的长度，不是16进制格式化输出的长度
   procedure OnAscii(const sPortName: WideString; dwCtrlCode: Integer; dwPID: Integer; 
                      const sData: WideString; dwSize: Integer); 
 
备注:
---------
     ActiveX开发接口是试用版和发布的内核驱动是一样的，这个OCX控件试用版本的限制是每调用200次读写串口数据就会自动终止目标程序，并将试用的字符通过串口数据传到界面上来。






10.更新日志
-------------------------------------------------------------------

v6.1 日期：2012-01-02
-------------------------
   1.修改部分内存分配问题；
   2.新增多种语言OCX Demo;
   3.驱动Loader直接封装在EXE中,去掉DLL;
   4.增加Inno安装包。


v6.0  日期：2011-09-15
-------------------------
   1、全新编写，采用内核驱动模块监控；
   2、全新用户界面,更友好的操作体验；
   功能列表：
 - 数据传输实时捕获记录
 - 自动感知虚拟串口PNP监控
 - 区分监控数据视图：列表视图，ASCII视图，DUMP视图，IOCTL视图
 - 可自动保存监控数据到日志文件
 - 支持标准串行口、扩展虚拟串行口，以及USB转串行口等设备的监控
 - 支持列表视图，ASCII视图，DUMP视图，IOCTL视图查找
 - 支持(IOCTLs)及其参数的监控与分析    




v5.0  日期：2011-06-01
------------------------
   1、新增串口EscapeCommFunction涵数的配置信息的拦截；
   2、新增GetCommModemStatus 涵数的拦截对CTS、DSR、Ring、Rlsd的状态响应；
   3、显示同一进程中的多个串口操作日志记录；
   4、稳定性优化。


v4.0  日期：2011-01-01
-------------------------
   1、新增多任务监控，可同时监控任意多个程序，互不干扰；
   2、自动换行显示功能；
   3、稳定性检测；         
   4、内存优化。



v3.0  日期：2010-02-03
------------------------
   1、无DLL版发布  
 


v2.0  日期：2009-12-01
------------------------
    1、新增对虚拟串口的监视，改变了原来旧版不能对虚拟串口的监视；

    2、DLL版，不会对全局进程进行HOOK，只对指定的进程进行HOOK；

    3、使用纯API全新编写了所有监视模块，安全稳定高效；

    4、不会占用串口(COM口)，只会对相关的API进行拦截；

    5、可以在串口打开后监控，一改有些监控软件只能在打开前监控；

    6、能捕获串口(COM口)的打开、读写数据 、关闭操作，并能同时监视指定进程的最多255个串口；

    7、可以直接拖动窗口捕获图标到目标进程窗口上选取进程。 
 

v2.0  日期：2007-08-01
------------------------
    1、HOOK API式串口监控；
    2、不会占用串口(COM口)，只会对相关的API进行拦截；
    3、对全局进程进行HOOK。
 
  


--------------------------------------------------------------------------------
copyright (C) 2003-2011 ceiwei
www.ceiwei.com





