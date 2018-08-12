template "FAT ��������"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// ����������ʽΪ MSDOS 4.0 ���ϰ汾 (���� Windows 9x)
// ������ FAT12/FAT16 ��ʽ���߼������� 0 ������

description "BIOS ������ (BPB) ������"
applies_to disk
sector-aligned

requires 0x0	"EB"	// JMP ָ��ͨ����ʹ�� EB xx 90
requires 0x2	"90"	// (��Ȼ�ɵ�����������ʹ�� E9 xx xx)
requires 0x1FE "55 AA"

begin
	read-only hex 3 "JMP ָ��"
	char[8]	"OEM"

	section	"BIOS ������"
	uint16	"�ֽ� / ����"
	uint8		"���� / ��"
	uint16	"��������"
	uint8		"FAT ����"
	uint16	"����Ŀ"
	uint16	"���� (32 MB ����)"
	hex 1		"ý������ (16 ����)"
	uint16	"���� / FAT"
	uint16	"���� / �Ź�"
	uint16	"ͷ"
	uint32	"��������"
	uint32	"���� (32 MB ����)"
	endsection

	hex 1		"BIOS ���� (16 ����, HD=8x)"
	read-only uint8 "(δʹ��)"
	hex 1		"��չ�������� (29h)"
	uint32	"�����к� (ʮ����)"
	move -4
	hex 4		"�����к� (16 ����)"
	char[11] "���ǩ"
	char[8]	"�ļ�ϵͳ"

	goto		0x1FE
	read-only hex 2 "���� (55 AA)"
end