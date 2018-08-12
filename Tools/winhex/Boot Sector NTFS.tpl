template "NTFS 引导扇区"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 适用于 NTFS 格式逻辑磁盘 0 扇区或引导扇区镜像，
// 它将定位在分区结尾附近。

description "NTFS 分区引导扇区"
applies_to disk
sector-aligned

requires 0x00	"EB" 					// 字节 0 到 2 是
requires 0x02	"90"					// JMP 指令
requires 0x03	"4E 54 46 53 20"	// ID 必须是 "NTFS"
requires 0x1FE	"55 AA"				// "magic" 特征

begin
	read-only hex 3	"JMP 指令"					//00
	char[8]				"文件系统 ID"				//03
	uint16				"字节 / 扇区"				//0B
	uint8					"扇区 / 簇"					//0D
	uint16				"保留扇区"					//0E
	hex 3					"(始终零)"					//10
	read-only hex 2	"(未使用)"					//13 
	hex 1					"媒介描述"					//15
	read-only hex 2	"(未使用)"					//16
	uint16				"扇区 / 磁轨"				//18
	uint16				"头"							//1A
	uint32				"隐藏扇区"					//1C
	read-only hex 4	"(未使用)"					//20
	read-only hex 4	"(总是 80 00 80 00)"		//24
	int64					"合计扇区"					//28
	int64					"开始 C# $MFT"				//30
	int64					"开始 C# $MFTMirr"		//38
	int8					"文件记录大小指示器"		//40
	read-only uint24	"(未使用)"
	int8					"簇 / 索引块"				//44
	read-only uint24	"(未使用)"
	hex 4					"32 位序列号 (16 进制)"
	move -4
	hexadecimal uint32 "32 位 SN (16 进制，保留)"
	move -4
	hex 8					"64 位序列号 (16 进制)"
	uint32				"校验和"						//50
	goto 0x1FE			//boot load code follows
	read-only hex 2	"签名 (55 AA)"				//1FE
end