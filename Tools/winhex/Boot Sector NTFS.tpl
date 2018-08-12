template "NTFS ��������"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// ������ NTFS ��ʽ�߼����� 0 ������������������
// ������λ�ڷ�����β������

description "NTFS ������������"
applies_to disk
sector-aligned

requires 0x00	"EB" 					// �ֽ� 0 �� 2 ��
requires 0x02	"90"					// JMP ָ��
requires 0x03	"4E 54 46 53 20"	// ID ������ "NTFS"
requires 0x1FE	"55 AA"				// "magic" ����

begin
	read-only hex 3	"JMP ָ��"					//00
	char[8]				"�ļ�ϵͳ ID"				//03
	uint16				"�ֽ� / ����"				//0B
	uint8					"���� / ��"					//0D
	uint16				"��������"					//0E
	hex 3					"(ʼ����)"					//10
	read-only hex 2	"(δʹ��)"					//13 
	hex 1					"ý������"					//15
	read-only hex 2	"(δʹ��)"					//16
	uint16				"���� / �Ź�"				//18
	uint16				"ͷ"							//1A
	uint32				"��������"					//1C
	read-only hex 4	"(δʹ��)"					//20
	read-only hex 4	"(���� 80 00 80 00)"		//24
	int64					"�ϼ�����"					//28
	int64					"��ʼ C# $MFT"				//30
	int64					"��ʼ C# $MFTMirr"		//38
	int8					"�ļ���¼��Сָʾ��"		//40
	read-only uint24	"(δʹ��)"
	int8					"�� / ������"				//44
	read-only uint24	"(δʹ��)"
	hex 4					"32 λ���к� (16 ����)"
	move -4
	hexadecimal uint32 "32 λ SN (16 ���ƣ�����)"
	move -4
	hex 8					"64 λ���к� (16 ����)"
	uint32				"У���"						//50
	goto 0x1FE			//boot load code follows
	read-only hex 2	"ǩ�� (55 AA)"				//1FE
end