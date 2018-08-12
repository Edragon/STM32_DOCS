template "主引导记录"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 适用于物理硬盘的 0 扇区或任何分区的第一扇区。

description "包含分区表"
applies_to disk
sector-aligned
requires 510 "55 AA"

begin
	read-only hex 440 "主引导程序载入代码"

	// Addition by Daniel B. Sedory:
	big-endian hexadecimal uint32 "Windows disk signature"
	move -4
	hexadecimal uint32 "Same reversed"
	// This SN is created by any NT-type OS (NT, 2000, XP,
	// 2003) and used in the Windows Registry.

	move 2

	numbering 1

	{
	section	"分区表项 #~"
	hex 1		"80 = 活动分区"
	uint8		"开始头"
	uint_flex "5,4,3,2,1,0" "开始扇区"
	move -4
	uint_flex "7,6,15,14,13,12,11,10,9,8" "开始柱面"
	move -2
	hex 1		"分区类型指示 (16 进制)"
	uint8		"结束头"
	uint_flex "5,4,3,2,1,0" "结束扇区"
	move -4
	uint_flex "7,6,15,14,13,12,11,10,9,8" "结束柱面"
	move -2
	uint32	"扇区在前的分区 ~"
	uint32	"扇区在分区 ~"
	} [4]

	endsection
	read-only hex 2 "特征 (55 AA)"
end