template "Ext2/Ext3 �ڵ�"

// By Jens Kirschner

description "�����ļ��м���Ϣ (�ڵ��С 128 �ֽ�)"
applies_to disk
multiple

begin

	section "File mode"

		octal uint_flex "8,7,6,5,4,3,2,1,0" "Ȩ��"

		move -4
		uint_flex "15,14,13,12" "File type (8=ע����ļ�, 4=Ŀ¼)"

		move -4
		uint_flex "9" "ճ��λ"
	
		move -4
		uint_flex "10" "SGID"

		move -4
		uint_flex "11" "SUID"

		move -2
	endsection

	uint16	"������ ID"
	uint32	"�ֽڴ�С (��С 4 �ֽ�)"
	UNIXDateTime	"����ʱ��"
	UNIXDateTime	"�ڵ�ı� "
	UNIXDateTime	"�޸� "
	UNIXDateTime	"ȱʧ (������� 1/1/70)"
	uint16	"�� ID"
	uint16	"Ӳ���Ӽ���"
	uint32	"��������"
	uint32	"�ļ���־"
	move -4
	uint_flex "19" "��Χ"
	uint32	"ϵͳ����"

	ifequal Extents 1
		section "������Χ��"
		section "��ʹ�ò�ͬ���ⲿ�ڵ�ģ�塣"
		endsection
		move 60
	else	
		numbering 1
		{
			uint32	"ֱ�ӿ� #~"
		} [12]
		uint32	"��ӿ�"
		uint32	"˫��ӿ�"
		uint32	"����ӿ�"
	endif
	
	uint32	"�ļ��汾"
	uint32	"�ļ� ACL"
	uint32	"�ֽڴ�С (��� 4 �ֽ�) "
	uint32	"���ε�ַ "
	uint8		"���� #"
	uint8		"���δ�С "
	uint16	"���"
	hex 4		"����"
	goto 0
	move 128 // �ı��ֵ����ڴ�С (ȱʡ: 128)
end