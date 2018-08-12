template "Ext2/Ext3 组描述"

// Created by Jens Kirschner on Sep 29, 2004
// X-Ways Software Technology AG

description "定位选块组"
applies_to disk
sector-aligned
multiple

begin
	uint32	"块位图块"
	uint32	"节点位图块"
	uint32	"节点表块"
	uint16	"空闲块计数"
	uint16	"空闲节点计数"
	uint16	"目录计数"
	uint16	"填充"	
	hex 12	"保留"
end
