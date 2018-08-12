template "FAT 引导扇区"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 启动扇区格式为 MSDOS 4.0 以上版本 (包含 Windows 9x)
// 适用于 FAT12/FAT16 格式的逻辑驱动器 0 扇区。

description "BIOS 参数块 (BPB) 和其它"
applies_to disk
sector-aligned

requires 0x0	"EB"	// JMP 指令通常是使用 EB xx 90
requires 0x2	"90"	// (虽然旧的驱动器可能使用 E9 xx xx)
requires 0x1FE "55 AA"

begin
	read-only hex 3 "JMP 指令"
	char[8]	"OEM"

	section	"BIOS 参数块"
	uint16	"字节 / 扇区"
	uint8		"扇区 / 簇"
	uint16	"保留扇区"
	uint8		"FAT 计数"
	uint16	"根项目"
	uint16	"扇区 (32 MB 以下)"
	hex 1		"媒介描述 (16 进制)"
	uint16	"扇区 / FAT"
	uint16	"扇区 / 磁轨"
	uint16	"头"
	uint32	"隐藏扇区"
	uint32	"扇区 (32 MB 以上)"
	endsection

	hex 1		"BIOS 驱动 (16 进制, HD=8x)"
	read-only uint8 "(未使用)"
	hex 1		"扩展启动特征 (29h)"
	uint32	"卷序列号 (十进制)"
	move -4
	hex 4		"卷序列号 (16 进制)"
	char[11] "卷标签"
	char[8]	"文件系统"

	goto		0x1FE
	read-only hex 2 "特征 (55 AA)"
end