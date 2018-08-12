template "FAT32 引导扇区"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 适用于 FAT32 格式逻辑驱动器的 0 扇区。

description "BIOS 参数块 (BPB) 和其它"
applies_to disk
sector-aligned

requires 0x02	"90"
requires 0x52	"46 41 54 33 32" // ="FAT32" 在偏移地址 52
requires 0x1FE "55 AA"

begin
	read-only hex 3 "JMP 指令"
	char[8]	"OEM"

	section	"BIOS 参数块"
	uint16	"字节 / 扇区"
	uint8		"扇区 / 簇"
	uint16	"保留扇区"
	uint8		"FAT 计数"
	uint16	"根项目 (未使用)"
	uint16	"扇区 (小容量)"
	hex 1		"媒介描述 (16 进制)"
	uint16	"扇区 / FAT (小容量)"
	uint16	"扇区 / 磁轨"
	uint16	"头"
	uint32	"隐藏扇区"
	uint32	"扇区 (大容量)"
	
	section	"FAT32 扇区"
	uint32	"扇区 / FAT"
	uint16	"延迟"
	uint16	"版本"
	uint32	"根目录第 1 簇"
	uint16	"FSInfo 扇区"
	uint16	"备份引导扇区"
	read-only hex 12 "(保留)"
	endsection
	
	hex 1		"BIOS 驱动 (16 进制, HD=8x)"
	read-only uint8 (未使用)
	hex 1		"扩展启动特征 (29h)"
	uint32	"卷序列号 (10 进制)"
	move -4
	hex 4		"卷序列号 (16 进制)"
	char[11] "卷标签"
	char[8]	"文件系统"
	endsection

	goto		0x1FE
	read-only hex 2 "特征 (55 AA)"
end