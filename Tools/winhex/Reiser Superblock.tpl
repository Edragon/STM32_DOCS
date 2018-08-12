template "ReiserFS ����ѡ��"

// Created by Jens Kirschner on Oct 5, 2004
// X-Ways Software Technology AG

// ����ѡ�����ǿ�ʼ������ƫ�Ƶ�ַ 0x10000 = 64 KB

description "������ ReiserFS ������ƫ�Ƶ�ַ 0x10000"
applies_to disk
sector-aligned
requires 0x34 "52 65 49 73 45 72" // Reiser magic "ReIsEr"

begin
	uint32	"�����"
	uint32	"���п����"
	uint32	"���� #"
	uint32	"��־�� #"
	uint32	"��־�豸 #"
	uint32	"��־��С"
	uint32	"������"
	uint32	"��־ Magic"
	uint32	"������������"
	uint32	"����ύ����(��)"
	uint32	"���������(��)"
	uint16	"���С"
	uint16	"����С���� ID ����"
	uint16	"��ǰ��С���� ID ����"
	uint16	"״̬ (1=���)"
	char[10]	"Reiser Magic"
	uint16	"״̬ (fsck)"
	uint32	"��ϣ���ܴ���"
	uint16	"���߶�"
	uint16	"��λͼ����"
	uint16	"�汾"
	uint16	"������־"

	uint32	"������"
	uint32	"���"
	hex 16	"UUID"
	char[16]	"���"
end