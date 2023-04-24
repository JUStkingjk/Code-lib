DATA SEGMENT
    BUF DB 3 DUP(0);缓存接受到的小写字母
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
BAGIN:
	MOV AX,DATA
    MOV DS,AX ;初始化数据段寄存器

	MOV BX,OFFSET BUF ;bx指向缓存的首地址

    MOV AH,1
    INT 21H ;调用中断接收键盘输入（单个字符，存在AL中）
    INC BX
	MOV [BX],AL ;放入缓存
    
    CMP [BX],'a'
    JNB Handler1 ;判断输入大于a
	JMP EXIT

Handler1:
	CMP [BX],'z'
    JNA Handler2 ;判断输入小于z
    JMP EXIT

Handler2:
	CMP [BX],'a'
    JNE HandlerZ
	;当输入为a时
    MOV [BX-1],'z'
    INC AL
    MOV [BX+1],AL

HandlerZ:  ;当输入为z时
	CMP [BX],'z'
    JNE Common
	MOV [BX+1],'a'
    DEC AL
    MOV [BX-1],AL
    
Common:
	MOV 	

EXIT:
    MOV AH,4CH
    INT 21H

	
CODE ENDS
END BAGIN
