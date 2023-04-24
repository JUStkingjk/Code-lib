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
	MOV [BX+1],AL ;放入缓存
    
    CMP AL,'a'
    JNB Handler 
	CMP AL,'z'
	JNA Handler
Handler1:

    MOV AH,4CH
    INT 21H

	
CODE ENDS
END BAGIN
