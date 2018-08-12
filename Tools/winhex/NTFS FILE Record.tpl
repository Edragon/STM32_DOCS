template "NTFS 文件记录"

// Template by Jens Kirschner
// X-Ways Software Technology AG

// 适用于 NTFS 主文件表 (MFT) 的文件记录。

description "适用于在主要文件表的记录"
applies_to disk
sector-aligned
multiple

begin   
	char[4]	"特征: 文件"
	uint16	"偏移地址更新次序"
	uint16	"更新次序大小在 words"
	int64		"日志文件次序编号"
	uint16	"次序编号 (重新计算)"
	uint16 	"硬链接计数 "
	uint16	"到第一个标志偏移地址"
	hex 2		"标记 "
	uint32	"文件记录实时大小"
	uint32	"分配记录大小"
	int64		"基础记录 (0: 自身)"
	uint16	"下一个属性 ID"
	IfEqual "到第一个属性偏移地址" 56
		move 2
		uint32 "记录 ID"
	EndIf
	goto	 "偏移地址更新次序"
	hex 2		"更新次序编号"
	//Update Sequence Array -> disregarded here
	goto "到第一个标志偏移地址"

	{
		endsection

		hexadecimal uint32 "Attribute type"
		IfEqual "Attribute type" 4294967295
			ExitLoop
		EndIf
		uint16 "Length of the attribute"
		move 2
		IfEqual "Attribute type" 16 //属性类型 0x10: 标准信息
			move 16
			FileTime "创建在 UTC"
			FileTime "修改在 UTC"
			FileTime "记录改变在 UTC"
			FileTime "最后访问在 UTC"
			move -48
		EndIf
		IfEqual "Attribute type" 48 //标志类型 0x30: 文件名
			move 16
			uint32	"根源文件记录"
			move 2
			uint16	"根源重新计算"
			move 56
			uint8 "Namelength"
			move 1
			char16[Namelength] "Filename"
			move -82
			move (Namelength*(-2))
		EndIf
		move "Length of the attribute"
		move -8

		IfEqual "Length of the attribute" 0
			ExitLoop
		EndIf
	}[20] //arbitrary number to avoid infinite loops
	
	Goto 0
	Move 1024
end