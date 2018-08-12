template "FAT 长文件名项"

// Template by Roger R鰄rig and Stefan Fleischmann

// 适用于 FAT16 或 FAT32 驱动器扇区目录项
// 不适用于 LFN (长文件名) 目录项。

description "长项格式"
applies_to disk
requires 11 0F
multiple

begin
   hex 1			"次序编号"
	char16[5]	"文件名 (5 个字符, FF 填补)"
	goto 14
	char16[6]	"文件名 (下次 6 个字符)"
	goto 28
	char16[2]	"文件名 (下次 2 个字符)"
	goto 11
	hex 1			"0F = LFN 项"
	move			-1
	binary		"属性 ( - -a-dir-vol-s-h-r)"
	read-only byte "(保留)"
	hex 1			"SFN 校验和"
	goto 26
	uint16		"16 位簇 # (总是 0)"
	move 4
end