template "NTFS �ļ���¼"

// Template by Jens Kirschner
// X-Ways Software Technology AG

// ������ NTFS ���ļ��� (MFT) ���ļ���¼��

description "����������Ҫ�ļ���ļ�¼"
applies_to disk
sector-aligned
multiple

begin   
	char[4]	"����: �ļ�"
	uint16	"ƫ�Ƶ�ַ���´���"
	uint16	"���´����С�� words"
	int64		"��־�ļ�������"
	uint16	"������ (���¼���)"
	uint16 	"Ӳ���Ӽ��� "
	uint16	"����һ����־ƫ�Ƶ�ַ"
	hex 2		"��� "
	uint32	"�ļ���¼ʵʱ��С"
	uint32	"�����¼��С"
	int64		"������¼ (0: ����)"
	uint16	"��һ������ ID"
	IfEqual "����һ������ƫ�Ƶ�ַ" 56
		move 2
		uint32 "��¼ ID"
	EndIf
	goto	 "ƫ�Ƶ�ַ���´���"
	hex 2		"���´�����"
	//Update Sequence Array -> disregarded here
	goto "����һ����־ƫ�Ƶ�ַ"

	{
		endsection

		hexadecimal uint32 "Attribute type"
		IfEqual "Attribute type" 4294967295
			ExitLoop
		EndIf
		uint16 "Length of the attribute"
		move 2
		IfEqual "Attribute type" 16 //�������� 0x10: ��׼��Ϣ
			move 16
			FileTime "������ UTC"
			FileTime "�޸��� UTC"
			FileTime "��¼�ı��� UTC"
			FileTime "�������� UTC"
			move -48
		EndIf
		IfEqual "Attribute type" 48 //��־���� 0x30: �ļ���
			move 16
			uint32	"��Դ�ļ���¼"
			move 2
			uint16	"��Դ���¼���"
			move 56
			uint8 "Namelength"
			move 1
			char16[Namelength] "Filename"
			move -82
			move (Namelength*(-2))
		EndIf
		move "Length of the attribute"
		move -8

		IfEqual "Length of the attribute" 0
			ExitLoop
		EndIf
	}[20] //arbitrary number to avoid infinite loops
	
	Goto 0
	Move 1024
end