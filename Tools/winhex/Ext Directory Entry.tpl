template "Ext2/Ext3 Ŀ¼��"

// Template by Eoghan Casey
// Revised by Jens Kirschner on Sep 29, 2004

// ������ Ext2 ������������
// ������һ��Ŀ¼�����͵�һ�ڵ�����ģ�����ʾָ���ļ�
// -- ��ɾ�����ļ����ǲ���ʾ�ġ�

description "��λ�ض��ļ�����Ϣ�ڵ�"
applies_to disk
multiple

begin
	uint32	"�ڵ�"
	uint16	"���"
	uint8		"Name length"
	uint8		"���� (1=�ļ� 2=Ŀ¼ 7=��������)"
	char[Name length]	"�ļ�����"
	goto		0
	move		"���"
end