template "Ext2/Ext3 目录项"

// Template by Eoghan Casey
// Revised by Jens Kirschner on Sep 29, 2004

// 适用于 Ext2 驱动器的扇区
// 它包含一个目录启动和第一节点项。这个模板仅显示指定文件
// -- 已删除的文件名是不显示的。

description "定位特定文件的信息节点"
applies_to disk
multiple

begin
	uint32	"节点"
	uint16	"项长度"
	uint8		"Name length"
	uint8		"类型 (1=文件 2=目录 7=符号链接)"
	char[Name length]	"文件名称"
	goto		0
	move		"项长度"
end