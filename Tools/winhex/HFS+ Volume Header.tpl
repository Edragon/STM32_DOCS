template "HFS+ 卷标"
description "从卷标开始定位 1024 字节"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// 卷标副本可以用来替换卷标，在卷标结尾之前存储的启动 1024 字节。

big-endian
sector-aligned
applies_to disk
requires 0x0 "48 2B"

begin
	char[2]	signature
	UInt16	version
	UInt32	attributes
	UInt32	lastMountedVersion
	UInt32	journalInfoBlock
 
	AppleDateTime	createDate
	AppleDateTime	modifyDate
	AppleDateTime	backupDate
	AppleDateTime	checkedDate
 
	UInt32	fileCount
	UInt32	folderCount
 
	UInt32	blockSize
	UInt32	totalBlocks
	UInt32	freeBlocks
 
	UInt32	nextAllocation
	UInt32	rsrcClumpSize
	UInt32	dataClumpSize
	UInt32	nextCatalogID
 
	UInt32	writeCount
	Int64	encodingsBitmap
 
	UInt32[8]	finderInfo
 
	section "HFSPlusForkData allocationFile"
	Int64	logicalSize
	UInt32	clumpSize
	UInt32	totalBlocks
	{
	UInt32	startBlock
	UInt32	blockCount
	}[8]

	section "HFSPlusForkData extentsFile"
	Int64	logicalSize
	UInt32	clumpSize
	UInt32	totalBlocks
	{
	UInt32	startBlock
	UInt32	blockCount
	}[8]

	section "HFSPlusForkData catalogFile"
	Int64	logicalSize
	UInt32	clumpSize
	UInt32	totalBlocks
	{
	UInt32	startBlock
	UInt32	blockCount
	}[8]

	section "HFSPlusForkData attributesFile"
	Int64	logicalSize
	UInt32	clumpSize
	UInt32	totalBlocks
	{
	UInt32	startBlock
	UInt32	blockCount
	}[8]

	section "HFSPlusForkData startupFile"
	Int64	logicalSize
	UInt32	clumpSize
	UInt32	totalBlocks
	{
	UInt32	startBlock
	UInt32	blockCount
	}[8]
end