template "Ext2/Ext3 节点"

// By Jens Kirschner

description "包含文件中继信息 (节点大小 128 字节)"
applies_to disk
multiple

begin

	section "File mode"

		octal uint_flex "8,7,6,5,4,3,2,1,0" "权限"

		move -4
		uint_flex "15,14,13,12" "File type (8=注册表文件, 4=目录)"

		move -4
		uint_flex "9" "粘性位"
	
		move -4
		uint_flex "10" "SGID"

		move -4
		uint_flex "11" "SUID"

		move -2
	endsection

	uint16	"所有者 ID"
	uint32	"字节大小 (最小 4 字节)"
	UNIXDateTime	"访问时间"
	UNIXDateTime	"节点改变 "
	UNIXDateTime	"修改 "
	UNIXDateTime	"缺失 (如果不是 1/1/70)"
	uint16	"组 ID"
	uint16	"硬链接计数"
	uint32	"扇区计数"
	uint32	"文件标志"
	move -4
	uint_flex "19" "范围"
	uint32	"系统从属"

	ifequal Extents 1
		section "跳过范围。"
		section "请使用不同的外部节点模板。"
		endsection
		move 60
	else	
		numbering 1
		{
			uint32	"直接块 #~"
		} [12]
		uint32	"间接块"
		uint32	"双间接快"
		uint32	"三间接块"
	endif
	
	uint32	"文件版本"
	uint32	"文件 ACL"
	uint32	"字节大小 (最大 4 字节) "
	uint32	"区段地址 "
	uint8		"区段 #"
	uint8		"区段大小 "
	uint16	"填充"
	hex 4		"保留"
	goto 0
	move 128 // 改变此值定义节大小 (缺省: 128)
end