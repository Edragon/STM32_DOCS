using System;
using System.IO.Ports;
using System.Text;
using System.Threading;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using NewLife;
using NewLife.Graphics;

namespace Athena6
{
    public class Program
    {
        // 雅典娜六号
        static Cpu.Pin[] ledPins = new Cpu.Pin[] { Pins.PE5, Pins.PE6 };
        static Cpu.Pin[] btnPins = new Cpu.Pin[] { Pins.PC0, Pins.PC1 };

        //static Thread th;
        public static void Main()
        {
            try
            {
                Print(SystemInfo.OEMString);
                Print(SystemInfo.Version.ToString());

                //TestTime();
                //TestFS();
                //TestButton();
                //TestCOM();
                //TestCOM2();
                //TestLed();
                TestTFT();
                //TestPWM();
                //TestPWM2();
                //TestMotor();
                //TestTimer();
                //TestIOTimer();

                //// 多线程调用要测试的功能
                //th = new Thread(TestButton);
                //th.Start();

                //Thread.Sleep(60000);
                //th.Abort();
                //th = null;

                Debug.Print(DateTime.Now.ToString());
                Debug.Print("All OK!");
            }
            catch (Exception ex)
            {
                Debug.Print(ex.Message + "\r\n" + ex.StackTrace);
            }

            while (true) { Thread.Sleep(1000); }
        }

        static void Print(String msg)
        {
            Debug.Print(msg);
            TFT.Print("\r\n" + msg);
        }

        static void TestLed()
        {
            // 声明为输出端口
            var leds = new OutputPort[ledPins.Length];
            for (int i = 0; i < leds.Length; i++)
            {
                leds[i] = new OutputPort(ledPins[i], i % 2 == 0);
            }

            // 实例化4位数码管
            var led4 = new Led4();
            led4.LedPins = new Cpu.Pin[] {
                Pins.PC0, Pins.PF9, Pins.PF7, Pins.PF5, Pins.PF3, Pins.PF1,
                Pins.PF2, Pins.PF4, Pins.PF6, Pins.PF8, Pins.PF10, Pins.PC1
            };
            // 数码管以16进制来显示数字
            led4.IsHex = true;
            // 开始显示
            led4.Start();

            var k = 0;
            for (int i = 0; i < 200; i++)
            {
                // 保证只有一个灯亮，递加，实现跑马灯效果
                for (int j = 0; j < leds.Length; j++)
                {
                    leds[j].Write(k == j);
                }
                if (k++ >= leds.Length) k = 0;
                led4.Value = i;

                Thread.Sleep(50);
            }
            led4.Stop();
        }

        static InterruptPort[] btns;
        static void TestButton()
        {
            // 声明为中断端口
            btns = new InterruptPort[btnPins.Length];
            for (var i = 0; i < btns.Length; i++)
            {
                btns[i] = new InterruptPort(btnPins[i], true, Port.ResistorMode.PullDown, Port.InterruptMode.InterruptEdgeBoth);
                // 设置中断事件
                //btns[i].OnInterrupt += new NativeEventHandler(OnPress);
            }
        }

        static void OnPress(uint data1, uint data2, DateTime time)
        {
            Print("Button: " + Pins.GetName((Cpu.Pin)data1) + "," + (data2 == 0 ? "Down" : "Up"));
        }

        static void TestTFT()
        {
            //TFT.Clear(TFT.Colors.Red);

            // 调试口输出字符串
            Debug.Print("Design by NewLife");

            // 输出所有可见ASCII字符
            for (int i = 32; i < 128; i++)
            {
                TFT.Print(((Char)i).ToString());
            }

            //TFT.Clear(TFT.Colors.Black);
            // 画线，左上角到右下角，红色
            TFT.DrawLine(0, 0, TFT.Width - 1, TFT.Height - 1, TFT.Colors.Red);
            // 修改背景色前景色后输出字符
            //TFT.BackColor = TFT.Colors.Green;
            TFT.ForeColor = TFT.Colors.Magenta;
            Print("Hello! NewLife Develop Team!");
            Print("X:" + TFT.X);
            Print("Y:" + TFT.Y);
            Print("BackLight:" + TFT.BackLight);
            Print("LCD:0x" + TFT.DeviceCode.ToString("X"));

            // 画矩形
            TFT.DrawRectangle(10, 70, 120, 160, TFT.Colors.Blue);

            // 画线，右上角到左下角，绿色
            TFT.DrawLine(TFT.Width - 1, 0, 0, TFT.Height - 1, TFT.Colors.Green);
            Print("Test Finished!");
        }

        static void TestADC()
        {
            var adc1 = new AnalogInput(Cpu.AnalogChannel.ANALOG_0);
            var adc3 = new AnalogInput(Cpu.AnalogChannel.ANALOG_3);

            while (true)
            {
                Print("ADC: " + adc3.ReadRaw() + "  " + adc1.ReadRaw());

                Thread.Sleep(1000);
            }
        }

        static void TestPWM()
        {
            var pin = HardwareProvider.HwProvider.GetPwmPinForChannel(Cpu.PWMChannel.PWM_0);
            Debug.Print("PwmPinForChannel:" + pin);
            var count = HardwareProvider.HwProvider.GetPWMChannelsCount();
            Debug.Print("PWMChannelsCount:" + count);

            //如果通道共用同一时钟，则周期以第一个的设置为准
            var pwm0 = new PWM(Cpu.PWMChannel.PWM_0, 500, 250, PWM.ScaleFactor.Microseconds, false);
            // 可以得到稳定的1M输出，注意调整逻辑分析仪的采样频率
            //var pwm1 = new PWM(Cpu.PWMChannel.PWM_4, 1000000, 0.5, false);
            var pwm1 = new PWM(Cpu.PWMChannel.PWM_4, 2, 1, PWM.ScaleFactor.Microseconds, false);

            Debug.Print("Period:" + pwm0.Period);
            Debug.Print("Duration:" + pwm0.Duration);

            var led = new OutputPort(ledPins[0], true);

            for (uint i = 1; i < 100; i++)
            {
                led.Write(!led.Read());

                Debug.Print("pwm0 Start");
                //pwm0.Duration = 5;
                pwm0.Start();
                Thread.Sleep(500);
                Debug.Print("pwm0 Stop");
                pwm0.Stop();

                Debug.Print("pwm1 Start");
                //pwm1.Duration = i;
                pwm1.Start();
                Thread.Sleep(500);
                Debug.Print("pwm1 Stop");
                pwm1.Stop();
                Thread.Sleep(300);
            }

            //pwm1.Start();
            while (true)
            {
                var b = led.Read();
                led.Write(!b);

                Thread.Sleep(100);
            }
            //pwm0.Stop();
            //pwm1.Stop();
        }

        static void TestPWM2()
        {
            // PWM.ScaleFactor.Microseconds(1000000)/10=100kHz
            var pwm0 = new PWM(Cpu.PWMChannel.PWM_0, 10, 5, PWM.ScaleFactor.Microseconds, false);
            var pwm1 = new PWM(Cpu.PWMChannel.PWM_3, 20, 10, PWM.ScaleFactor.Microseconds, false);
            pwm0.Start();
            pwm1.Start();

            //while (true) Thread.Sleep(100);
        }

        static void TestIOTimer()
        {
            var f = 100;

            var timer = new IOTimer(5, 0);
            timer.Frequency = f;
            //timer.Period = 10;
            timer.DutyCycle = 0.5;
            // 设为0，避免Start后就发出脉冲
            timer.Count = 0;
            // 让低电平有效，否则脉冲停止后小车电机一直转动
            timer.Invert = true;

            var timer2 = new IOTimer(5, 1);
            timer2.Frequency = f;
            //timer2.Period = 20;
            timer2.DutyCycle = 0.5;
            // 设为0，避免Start后就发出脉冲
            timer2.Count = 0;
            // 让低电平有效，否则脉冲停止后小车电机一直转动
            timer2.Invert = true;

            Debug.Print("Timer1:" + Pins.GetName(timer.Pin));
            Debug.Print("Timer2:" + Pins.GetName(timer2.Pin));
            timer.Start();
            timer2.Start();

            var dir = new OutputPort(Pins.PA2, false);
            for (int i = 0; i < 10; i++)
            {
                Thread.Sleep(1000);
                Debug.Print("Timer1:" + timer.Count);

                // 反向
                dir.Write(!dir.Read());
                timer.Count = f - f * i / 10;
            }

            Thread.Sleep(1000);
            Debug.Print("Timer1:" + timer.Count);
            Debug.Print("Timer2:" + timer2.Count);
        }

        static void TestBacklight()
        {
            // 关闭打开LCD的背光
            while (true)
            {
                Debug.Print(Utility.GetMachineTime().ToString());
                Utility.Backlight(true);
                Thread.Sleep(10000);
                Utility.Backlight(false);
                Thread.Sleep(5000);
            }
        }

        //必须为全局变量（非全局会提取数据失败，V4.1没有这个问题）
        private static ExtendedWeakReference _ref;
        private static class TypeUniqueToOurApp { }

        //需要永久保存的类，必须置 [Serializable] 标识
        [Serializable]
        private sealed class NumBoots
        {
            public Int32 BootCount;
            public NumBoots(Int32 bootCount) { BootCount = bootCount; }
        }

        static void TestWeakRef()
        {
            _ref =
                ExtendedWeakReference.RecoverOrCreate(
                typeof(TypeUniqueToOurApp),  //作为标识的类
                0,                           //ID标识，这个比较有用
                ExtendedWeakReference.c_SurvivePowerdown);

            //数据重要次序：OkayToThrowAway->NiceToHave->Important->Critical->System
            _ref.Priority = (Int32)ExtendedWeakReference.PriorityLevel.Important;

            //获取数据
            var numBoots = (NumBoots)_ref.Target;

            if (numBoots == null)
            {
                Debug.Print("the first time!");
                numBoots = new NumBoots(1);
            }
            else
            {
                numBoots = new NumBoots(numBoots.BootCount + 1);
                Debug.Print("This is boot #" + numBoots.BootCount);
            }

            //保存数据
            _ref.Target = numBoots;

            //延时等待保存
            Thread.Sleep(2000);
        }

        static void TestCOM()
        {
            var port = new SerialPort("COM1", 115200, Parity.None, 8, StopBits.One);
            port.Open();
            port.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);

            var bts = Encoding.UTF8.GetBytes("www.NewLifeX.com");
            for (int i = 0; i < 3; i++)
            {
                port.Write(bts, 0, bts.Length);
                Thread.Sleep(1000);
            }

            // 关了COM1就看不到调试输出了
            if (port.PortName != "COM1") port.Close();
        }

        /// <summary>输出TTL</summary>
        static void TestCOM2()
        {
            var port = new SerialPort("COM4");
            Thread.Sleep(1000);
            Debug.Print("Open " + port.PortName);

            port.Open();

            for (int i = 0; i < 10; i++)
            {
                var bts = i % 2 == 0 ? new Byte[] { 0 } : new Byte[] { 0xF };
                port.Write(bts, 0, bts.Length);
                Thread.Sleep(500);
            }

            // 关了COM1就看不到调试输出了
            if (port.PortName != "COM1") port.Close();
        }

        static void port_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            var port = sender as SerialPort;
            if (port.BytesToRead > 0)
            {
                var bts = new byte[port.BytesToRead];
                port.Read(bts, 0, bts.Length);

                Thread.Sleep(3000);
                Debug.Print(new String(Encoding.UTF8.GetChars(bts)));

                //把接收到的数据之间返回
                port.Write(bts, 0, bts.Length);
                port.Flush();
            }
        }

        static void TestMotor()
        {
            var pins = new Cpu.Pin[] { Pins.PD13, Pins.PD11, Pins.PD9, Pins.PB15 };
            var ps = new OutputPort[pins.Length];
            for (int i = 0; i < ps.Length; i++)
            {
                ps[i] = new OutputPort(pins[i], false);
            }

            var k = 0;
            for (int i = 0; i < 10000; i++)
            {
                ps[k].Write(false);
                if (++k >= 4) k = 0;
                ps[k].Write(true);

                Thread.Sleep(8);
            }
        }

        static Timer timer;
        static Timer timer2;
        static OutputPort port;
        static OutputPort port2;
        static OutputPort port3;
        static void TestTimer()
        {

            port = new OutputPort(Pins.PA0, true);
            port2 = new OutputPort(Pins.PA1, true);
            var dueTime = new TimeSpan(0, 0, 1);
            var period = new TimeSpan(1);
            //timer = new Timer(OnTime, null, dueTime, period);
            timer = new Timer(OnTime, null, 1, 1);

            port3 = new OutputPort(ledPins[0], true);
            timer2 = new Timer(OnTime2, null, 50, 50);
        }

        static void OnTime(Object state)
        {
            var flag = port.Read();
            port.Write(!flag);
            port2.Write(flag);
        }

        static void OnTime2(Object state)
        {
            port3.Write(!port3.Read());
        }

        static void TestTime()
        {
            // 设定MF时间
            Debug.Print(DateTime.Now.ToString());
            Utility.SetLocalTime(new DateTime(2012, 12, 21));
            Debug.Print(DateTime.Now.ToString());

            //Debug.Print("LastSyncStatus:" + TimeService.LastSyncStatus.Flags);
            //Debug.Print("CurrentTimeUTC:" + TimeService.LastSyncStatus.CurrentTimeUTC);

            //TimeService.Start();
            //Debug.Print(DateTime.Now.ToString());

            //TimeService.UpdateNow(0);
            //Debug.Print(DateTime.Now.ToString());
        }

        static void TestFS()
        {
            //var fns = VolumeInfo.GetFileSystems();
            //if (fns == null)
            //{
            //    Debug.Print("No FileSystems");
            //}
            //else
            //{
            //    Debug.Print("FileSystems:" + fns.Length + " " + fns[0]);

            //    var fis = VolumeInfo.GetVolumes();
            //    if (fis.Length > 0)
            //    {
            //        var fs = fis[0];
            //        Debug.Print("Name:" + fs.Name);
            //        Debug.Print("SerialNumber:" + fs.SerialNumber);
            //        Debug.Print("TotalSize:" + fs.TotalSize);
            //        Debug.Print("TotalFreeSpace:" + fs.TotalFreeSpace);
            //        Debug.Print("VolumeID:" + fs.VolumeID);
            //        Debug.Print("VolumeLabel:" + fs.VolumeLabel);
            //        Debug.Print("DeviceFlags:" + fs.DeviceFlags);
            //        Debug.Print("FileSystemFlags:" + fs.FileSystemFlags);

            //        //var f = File.Create(@"Root\x.bin");
            //        //f.Close();

            //        //var buf = Encoding.UTF8.GetBytes("www.NewLifeX.com");
            //        //File.WriteAllBytes(@"Root\x.bin", buf);
            //    }
            //}
        }
    }
}