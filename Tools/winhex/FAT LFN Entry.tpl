template "FAT ���ļ�����"

// Template by Roger R�hrig and Stefan Fleischmann

// ������ FAT16 �� FAT32 ����������Ŀ¼��
// �������� LFN (���ļ���) Ŀ¼�

description "�����ʽ"
applies_to disk
requires 11 0F
multiple

begin
   hex 1			"������"
	char16[5]	"�ļ��� (5 ���ַ�, FF �)"
	goto 14
	char16[6]	"�ļ��� (�´� 6 ���ַ�)"
	goto 28
	char16[2]	"�ļ��� (�´� 2 ���ַ�)"
	goto 11
	hex 1			"0F = LFN ��"
	move			-1
	binary		"���� ( - -a-dir-vol-s-h-r)"
	read-only byte "(����)"
	hex 1			"SFN У���"
	goto 26
	uint16		"16 λ�� # (���� 0)"
	move 4
end