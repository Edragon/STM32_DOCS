template "Reiser4 ����ѡ��"

// Created by Jens Kirschner on Feb 16, 2005
// X-Ways Software Technology AG


// ����ѡ�����ǿ�ʼ��ƫ�Ƶ�ַ 0x10000 = 64 KB 
// ����ѡ��������� Reiser4 Format40

description "����ѡ�������� Reiser4 �� Format40"
applies_to disk
//��������
requires 0x0 "52 65 49 73 45 72 34"

begin
	section	"��Ҫ Reiser4 ����ѡ��"
	char[16] "Magic �ַ� ReIsEr4"
	int16 "���̲�� (0: Format40)"
	int16 "���С"
	hex 16 "UUID"
	char[16] "��ǩ"
	int64 "Diskmap Block"
	endsection

	IfEqual "���̲�� (0: Format40)" 0

		goto "���С"

		section "Format40 Superblock"	
		int64 "�����" 
		int64 "���п����"
		int64 "���� #"
		int64 "С�����ж��� ID"
		int64 "�ļ�����"
		int64 "����ѡ�����ˢ�¼���"
		hex 4 "UID"
		char[16] "Magic �ַ� ReIsEr40FoRmAt"
		int16 "������"
		int16 "��ʽ������"
		int64 "���"
		char[432] "δʹ��"
		endsection
	endif
end