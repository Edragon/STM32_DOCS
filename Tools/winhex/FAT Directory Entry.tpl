template "FAT Ŀ¼��"

// Template by Stefan Fleischmann
// X-Ways Software Technology AG

// ������ FAT16 �� FAT32 ����������Ŀ¼��
// �������� LFN (���ļ���) Ŀ¼�

description "��׼/�� ���ʽ"
applies_to disk
multiple

begin
	char[8]	"�ļ��� (��հ�)"
	char[3]	"��չ�� (��հ�)"
	hex 1		"0F = LFN ��"
	move		-1
	binary	"���� ( - -a-dir-vol-s-h-r)"
	goto		0
	hex 1		"00 = ��δʹ��, E5 = ����"
	move		11
	read-only byte "(����)"
	move		1
	DOSDateTime	"�������� & ʱ��"
	move		-5
	byte		"����ʱ�侫��: 10 ���뵥λ"
	move		2
	DOSDateTime	"�������� (��ʱ��!)"
	move		2
	DOSDateTime	"�������� & ʱ��"
	move		-6
	uint16	"(FAT 32) ���� / �� #"
	move		4
	uint16	"16 λ�� #"
	uint32	"�ļ���С (0 ΪĿ¼)
end