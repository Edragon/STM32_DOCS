template "FAT 目录项"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 适用于 FAT16 或 FAT32 驱动器扇区目录项
// 不适用于 LFN (长文件名) 目录项。

description "标准/短 项格式"
applies_to disk
multiple

begin
	char[8]	"文件名 (填补空白)"
	char[3]	"扩展名 (填补空白)"
	hex 1		"0F = LFN 项"
	move		-1
	binary	"属性 ( - -a-dir-vol-s-h-r)"
	goto		0
	hex 1		"00 = 从未使用, E5 = 擦除"
	move		11
	read-only byte "(保留)"
	move		1
	DOSDateTime	"创建日期 & 时间"
	move		-5
	byte		"创建时间精度: 10 毫秒单位"
	move		2
	DOSDateTime	"访问日期 (无时间!)"
	move		2
	DOSDateTime	"更新日期 & 时间"
	move		-6
	uint16	"(FAT 32) 高字 / 簇 #"
	move		4
	uint16	"16 位簇 #"
	uint32	"文件大小 (0 为目录)
end