`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HUST
// Engineer: 张苏跃
// 
// Create Date: 2018/03/2 09:42:02
// Design Name: CPU_Optimal_Streamline
// Module Name: ID_EX
// 
//////////////////////////////////////////////////////////////////////////////////

//ID_EX流水部件
module id_ex(
    input       clk, rst,
    input       [3:0] ALUOP_i,
    input       [4:0] rw_i,
    input       jr_i,jal_i,j_i,bne_i,beq_i,blez_i,
    input       Memwrite_i, MemToReg_i,Regwrite_i,ALUsrc_i,RegDst_i,
    input       lb_i,
    input       lui_i,
    input       [31:0]index_i,
    input       [31:0] A_i, B_i,Ext_i, Imm_i,PC_i,
    output /*reg*/  [3:0] ALUOP_o,
    output /*reg*/  [4:0] rw_o,
    output /*reg*/  jr_o,jal_o,j_o,bne_o,beq_o,blez_o,
    output /*reg*/  Memwrite_o, MemToReg_o,Regwrite_o,ALUsrc_o,RegDst_o,
    output /*reg*/  lb_o,
    output /*reg*/  lui_o,
    output /*reg*/  [31:0]index_o,
    output /*reg*/  [31:0] A_o, B_o,Ext_o, Imm_o,PC_o
    );
    //WB，在访存结束之后，写回寄存器需要的控制信号
    assign rw_o = rw_i;
    assign MemToReg_o = MemToReg_i;    //决定写回数据的来源，是ALU还是Mem
    assign jal_o = jal_i;         //决定写回数据的来源，是上面的结果还是PC+1
    assign lui_o = lui_i;         //决定写回数据的来源，是否是LUI式的拓展
    assign Regwrite_o = Regwrite_i;    //决定是否写回
    assign RegDst_o = RegDst_i;      //决定写回到哪个寄存器
    //Mem，ALU计算之后，写入存储器之前需要的控制信号
    assign Memwrite_o = Memwrite_i;    //决定是否存进ram
    assign lb_o = lb_i;          //决定mem的load方式
    //EX，ALU需要的信号
    assign ALUOP_o =ALUOP_i;        //ALU的运算符，源于IS的指令
    assign ALUsrc_o = ALUsrc_i;      //决定ALU的B，是寄存器还是Imm
    assign jr_o = jr_i;          //NPC中决定跳转
    assign j_o = j_i;           //同上
    assign bne_o = bne_i;         //同上
    assign beq_o = beq_i;         //同上
    assign blez_o = blez_i;        //同上   
    assign index_o = index_i;
    //A,B,PC,IMM
    assign A_o = A_i;           //用于ALU的操作数
    assign B_o = B_i;           //用于ALU的操作数
    assign PC_o = PC_i;          //用于NPC决定下一条指令位置
    assign Ext_o = Ext_i;
    assign Imm_o = Imm_i;            //用于1.ALU操作数2.写回3.NPC

endmodule
/*    always @(posedge clk) begin
        if (rst) begin
            //WB，在访存结束之后，写回寄存器需要的控制信号
            MemToReg_o <= 0;    //决定写回数据的来源，是ALU还是Mem
            jal_o <= 0;         //决定写回数据的来源，是上面的结果还是PC+1
            lui_o <= 0;         //决定写回数据的来源，是否是LUI式的拓展
            Regwrite_o <= 0;    //决定是否写回
            RegDst_o <= 0;      //决定写回到哪个寄存器
            //Mem，ALU计算之后，写入存储器之前需要的控制信号
            Memwrite_o <= 0;    //决定是否存进ram
            lb_o <= 0;          //决定mem的load方式
            //EX，ALU需要的信号
            ALUOP_o <=0;        //ALU的运算符，源于IS的指令
            ALUsrc_o <= 0;      //决定ALU的B，是寄存器还是Imm
            jr_o <= 0;          //NPC中决定跳转
            j_o <= 0;           //同上
            bne_o <= 0;         //同上
            beq_o <= 0;         //同上
            blez_o <= 0;        //同上   
            //A,B,PC,IMM
            A_o <= 0;           //用于ALU的操作数
            B_o <= 0;           //用于ALU的操作数
            PC_o <= 0;          //用于NPC决定下一条指令位置
            Ext_o <= Ext_i;     //用于1.ALU操作数2.NPC
            Imm <= 0            //写回
        end
        else if () begin
            
        end
    end*/