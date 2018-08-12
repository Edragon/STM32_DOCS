template "Reiser4 超级选块"

// Created by Jens Kirschner on Feb 16, 2005
// X-Ways Software Technology AG


// 超级选块总是开始在偏移地址 0x10000 = 64 KB 
// 超级选块仅适用于 Reiser4 Format40

description "超级选块适用于 Reiser4 的 Format40"
applies_to disk
//扇区对齐
requires 0x0 "52 65 49 73 45 72 34"

begin
	section	"主要 Reiser4 超级选块"
	char[16] "Magic 字符 ReIsEr4"
	int16 "磁盘插件 (0: Format40)"
	int16 "块大小"
	hex 16 "UUID"
	char[16] "标签"
	int64 "Diskmap Block"
	endsection

	IfEqual "磁盘插件 (0: Format40)" 0

		goto "块大小"

		section "Format40 Superblock"	
		int64 "块计数" 
		int64 "空闲块计数"
		int64 "根块 #"
		int64 "小量空闲对象 ID"
		int64 "文件计数"
		int64 "超级选块计数刷新计数"
		hex 4 "UID"
		char[16] "Magic 字符 ReIsEr40FoRmAt"
		int16 "树调试"
		int16 "格式化策略"
		int64 "标记"
		char[432] "未使用"
		endsection
	endif
end