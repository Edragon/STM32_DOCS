template "��������¼"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// ����������Ӳ�̵� 0 �������κη����ĵ�һ������

description "����������"
applies_to disk
sector-aligned
requires 510 "55 AA"

begin
	read-only hex 440 "�����������������"

	// Addition by Daniel B. Sedory:
	big-endian hexadecimal uint32 "Windows disk signature"
	move -4
	hexadecimal uint32 "Same reversed"
	// This SN is created by any NT-type OS (NT, 2000, XP,
	// 2003) and used in the Windows Registry.

	move 2

	numbering 1

	{
	section	"�������� #~"
	hex 1		"80 = �����"
	uint8		"��ʼͷ"
	uint_flex "5,4,3,2,1,0" "��ʼ����"
	move -4
	uint_flex "7,6,15,14,13,12,11,10,9,8" "��ʼ����"
	move -2
	hex 1		"��������ָʾ (16 ����)"
	uint8		"����ͷ"
	uint_flex "5,4,3,2,1,0" "��������"
	move -4
	uint_flex "7,6,15,14,13,12,11,10,9,8" "��������"
	move -2
	uint32	"������ǰ�ķ��� ~"
	uint32	"�����ڷ��� ~"
	} [4]

	endsection
	read-only hex 2 "���� (55 AA)"
end