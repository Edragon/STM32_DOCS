template "Ext2/Ext3 ������"

// Created by Jens Kirschner on Sep 29, 2004
// X-Ways Software Technology AG

description "��λѡ����"
applies_to disk
sector-aligned
multiple

begin
	uint32	"��λͼ��"
	uint32	"�ڵ�λͼ��"
	uint32	"�ڵ���"
	uint16	"���п����"
	uint16	"���нڵ����"
	uint16	"Ŀ¼����"
	uint16	"���"	
	hex 12	"����"
end
