template "Ext2/Ext3/Ext4 超级选块"

// Created by Jens Kirschner
// X-Ways Software Technology AG, 2004-2007

// 超级选块总是开始定位在扇区或系统选块大小的 1024。
// 它总是在组的第一个选块, 除非 "稀疏超级选块功能" 是设置在驱动器。


description "应用到偏移地址的一个 Ext2/3/4 分区的 1024"
applies_to disk
sector-aligned

requires 0x38 "53 EF" // ext2 magic 

begin
	uint32	"节点计数"
	uint32	"块计数"
	uint32	"保留块计数"
	uint32	"自由块计数"
	uint32	"自由节点计数"
	uint32	"第一个数据块 "
	uint32	"块大小 (0=1K, 1=2K, 2=4K) "
	int32		"区段大小(相同)"
	uint32	"块 / 组"
	uint32	"区段 / 组 "
	uint32	"节点 / 组"
	UNIXDateTime	"最后安装时间"
	UNIXDateTime	"最后写入时间"
	uint16	"支持计数"
	int16		"最大支持计数"
	hex 2		"Magic 特征 (53 EF)"
	uint16	"文件系统状态"
	uint16	"当检测到错误时的行为"
	uint16	"局部修正级别"
	UNIXDateTime	"最后一次检查时间"
	uint32	"校验时最大时间(秒)"
	uint32	"系统 (0: Linux)"
	uint32	"校正级别"
	uint16	"缺省用户 ID 保留块"
	uint16	"缺省组 ID 保留块"

	IfEqual "校正级别" 0
				// 未选择扩展超级选块
	Else
		section "扩展超级选块扇区"	
		uint32	"第一个非保留节点"
		uint16	"节点大小"
		uint16	"这是个超级选块组"

		section "兼容性特性标志"
		uint_flex "2" "日志"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,1,0"	"Others"

		section "不兼容特性标志"
		uint_flex "1" "目录项文件类型"
		move -4
		uint_flex "6" "使用范围"
		move -4
		uint_flex "7" "64位块编号"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,5,4,3,2,0"	"Others"

		section "RO兼容特征标志"
		uint_flex "0" "稀疏超级选块"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1"	"Others"
		endsection 

		hex 16	"卷的 UUID"
		char[16]	"卷名"
		char[64] "上次载入路径"
		uint32	"位图算法" 
		uint8		"块预分配"
		uint8		"目录块预分配"
		move 2
		hex 16	"日志 UUID"
		uint32	"日志节点"
		uint32	"日志设备 #"
		uint32	"最后孤体索引节点"
		numbering 1 {
			uint32	"哈希种子 ~"
		} [4]
		uint8		"缺省哈希版本"
		move 3
		uint32	"缺省载入选项"
		uint32	"第一个 metablock 块组"
		UNIXDateTime	"文件系统创建"
		
		section "日志索引节点备份" //17x 4 字节
		{
			uint32	"日志块 ~"
		}[12]
		uint32	"日志间接块"
		uint32	"日志双间接块"
		uint32	"日志三间接块"
		uint32	"未知"
		uint32	"日志文件大小"			

		section "64 位支持"
		uint32	"块计数 hi DWord"
		uint32	"资源块 hi DWord"
		uint32	"空闲块 hi DWord"
	EndIf
end