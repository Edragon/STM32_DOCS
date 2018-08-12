template "Ext2/Ext3/Ext4 ����ѡ��"

// Created by Jens Kirschner
// X-Ways Software Technology AG, 2004-2007

// ����ѡ�����ǿ�ʼ��λ��������ϵͳѡ���С�� 1024��
// ����������ĵ�һ��ѡ��, ���� "ϡ�賬��ѡ�鹦��" ����������������


description "Ӧ�õ�ƫ�Ƶ�ַ��һ�� Ext2/3/4 ������ 1024"
applies_to disk
sector-aligned

requires 0x38 "53 EF" // ext2 magic 

begin
	uint32	"�ڵ����"
	uint32	"�����"
	uint32	"���������"
	uint32	"���ɿ����"
	uint32	"���ɽڵ����"
	uint32	"��һ�����ݿ� "
	uint32	"���С (0=1K, 1=2K, 2=4K) "
	int32		"���δ�С(��ͬ)"
	uint32	"�� / ��"
	uint32	"���� / �� "
	uint32	"�ڵ� / ��"
	UNIXDateTime	"���װʱ��"
	UNIXDateTime	"���д��ʱ��"
	uint16	"֧�ּ���"
	int16		"���֧�ּ���"
	hex 2		"Magic ���� (53 EF)"
	uint16	"�ļ�ϵͳ״̬"
	uint16	"����⵽����ʱ����Ϊ"
	uint16	"�ֲ���������"
	UNIXDateTime	"���һ�μ��ʱ��"
	uint32	"У��ʱ���ʱ��(��)"
	uint32	"ϵͳ (0: Linux)"
	uint32	"У������"
	uint16	"ȱʡ�û� ID ������"
	uint16	"ȱʡ�� ID ������"

	IfEqual "У������" 0
				// δѡ����չ����ѡ��
	Else
		section "��չ����ѡ������"	
		uint32	"��һ���Ǳ����ڵ�"
		uint16	"�ڵ��С"
		uint16	"���Ǹ�����ѡ����"

		section "���������Ա�־"
		uint_flex "2" "��־"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,1,0"	"Others"

		section "���������Ա�־"
		uint_flex "1" "Ŀ¼���ļ�����"
		move -4
		uint_flex "6" "ʹ�÷�Χ"
		move -4
		uint_flex "7" "64λ����"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,5,4,3,2,0"	"Others"

		section "RO����������־"
		uint_flex "0" "ϡ�賬��ѡ��"
		move -4
		uint_flex "31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1"	"Others"
		endsection 

		hex 16	"��� UUID"
		char[16]	"����"
		char[64] "�ϴ�����·��"
		uint32	"λͼ�㷨" 
		uint8		"��Ԥ����"
		uint8		"Ŀ¼��Ԥ����"
		move 2
		hex 16	"��־ UUID"
		uint32	"��־�ڵ�"
		uint32	"��־�豸 #"
		uint32	"�����������ڵ�"
		numbering 1 {
			uint32	"��ϣ���� ~"
		} [4]
		uint8		"ȱʡ��ϣ�汾"
		move 3
		uint32	"ȱʡ����ѡ��"
		uint32	"��һ�� metablock ����"
		UNIXDateTime	"�ļ�ϵͳ����"
		
		section "��־�����ڵ㱸��" //17x 4 �ֽ�
		{
			uint32	"��־�� ~"
		}[12]
		uint32	"��־��ӿ�"
		uint32	"��־˫��ӿ�"
		uint32	"��־����ӿ�"
		uint32	"δ֪"
		uint32	"��־�ļ���С"			

		section "64 λ֧��"
		uint32	"����� hi DWord"
		uint32	"��Դ�� hi DWord"
		uint32	"���п� hi DWord"
	EndIf
end