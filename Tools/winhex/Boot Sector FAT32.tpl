template "FAT32 ��������"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// ������ FAT32 ��ʽ�߼��������� 0 ������

description "BIOS ������ (BPB) ������"
applies_to disk
sector-aligned

requires 0x02	"90"
requires 0x52	"46 41 54 33 32" // ="FAT32" ��ƫ�Ƶ�ַ 52
requires 0x1FE "55 AA"

begin
	read-only hex 3 "JMP ָ��"
	char[8]	"OEM"

	section	"BIOS ������"
	uint16	"�ֽ� / ����"
	uint8		"���� / ��"
	uint16	"��������"
	uint8		"FAT ����"
	uint16	"����Ŀ (δʹ��)"
	uint16	"���� (С����)"
	hex 1		"ý������ (16 ����)"
	uint16	"���� / FAT (С����)"
	uint16	"���� / �Ź�"
	uint16	"ͷ"
	uint32	"��������"
	uint32	"���� (������)"
	
	section	"FAT32 ����"
	uint32	"���� / FAT"
	uint16	"�ӳ�"
	uint16	"�汾"
	uint32	"��Ŀ¼�� 1 ��"
	uint16	"FSInfo ����"
	uint16	"������������"
	read-only hex 12 "(����)"
	endsection
	
	hex 1		"BIOS ���� (16 ����, HD=8x)"
	read-only uint8 (δʹ��)
	hex 1		"��չ�������� (29h)"
	uint32	"�����к� (10 ����)"
	move -4
	hex 4		"�����к� (16 ����)"
	char[11] "���ǩ"
	char[8]	"�ļ�ϵͳ"
	endsection

	goto		0x1FE
	read-only hex 2 "���� (55 AA)"
end