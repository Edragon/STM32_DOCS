template "ReiserFS 超级选块"

// Created by Jens Kirschner on Oct 5, 2004
// X-Ways Software Technology AG

// 超级选块总是开始在扇区偏移地址 0x10000 = 64 KB

description "适用于 ReiserFS 分区的偏移地址 0x10000"
applies_to disk
sector-aligned
requires 0x34 "52 65 49 73 45 72" // Reiser magic "ReIsEr"

begin
	uint32	"块计数"
	uint32	"空闲块计数"
	uint32	"根块 #"
	uint32	"日志块 #"
	uint32	"日志设备 #"
	uint32	"日志大小"
	uint32	"最大处理块"
	uint32	"日志 Magic"
	uint32	"最大批量处理块"
	uint32	"最大提交寿命(秒)"
	uint32	"最大处理寿命(秒)"
	uint16	"块大小"
	uint16	"最大大小对象 ID 数组"
	uint16	"当前大小对象 ID 数组"
	uint16	"状态 (1=清除)"
	char[10]	"Reiser Magic"
	uint16	"状态 (fsck)"
	uint32	"哈希功能代码"
	uint16	"树高度"
	uint16	"块位图块编号"
	uint16	"版本"
	uint16	"保留日志"

	uint32	"节生成"
	uint32	"标记"
	hex 16	"UUID"
	char[16]	"卷标"
end