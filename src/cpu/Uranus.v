`timescale 1ns / 1ps

// Block Design: Core.bd
// generated by autowire.py

module Uranus(
    input clk,
    input rst
);

    wire clk_1 = clk;
    wire rst_1 = rst;
    wire pc_0_rom_en;
    wire[31:0] pc_0_addr;
    wire[31:0] rom_0_inst;
    wire[31:0] ifid_0_addr_out;
    wire[31:0] ifid_0_inst_out;
    wire id_0_write_reg_en;
    wire[4:0] id_0_write_reg_addr;
    wire[31:0] id_0_operand_2;
    wire[31:0] id_0_operand_1;
    wire[4:0] id_0_shamt;
    wire[5:0] id_0_funct;
    wire[4:0] id_0_reg_addr_2;
    wire[4:0] id_0_reg_addr_1;
    wire id_0_reg_read_en_2;
    wire id_0_reg_read_en_1;
    wire[5:0] idex_0_funct_out;
    wire[4:0] idex_0_shamt_out;
    wire[31:0] idex_0_operand_1_out;
    wire[31:0] idex_0_operand_2_out;
    wire idex_0_write_reg_en_out;
    wire[4:0] idex_0_write_reg_addr_out;
    wire[31:0] ex_0_result_out;
    wire ex_0_write_reg_en_out;
    wire[4:0] ex_0_write_reg_addr_out;
    wire[31:0] exmem_0_result_out;
    wire exmem_0_write_reg_en_out;
    wire[4:0] exmem_0_write_reg_addr_out;
    wire[31:0] mem_0_result_out;
    wire mem_0_write_reg_en_out;
    wire[4:0] mem_0_write_reg_addr_out;
    wire memwb_0_write_reg_en_out;
    wire[31:0] memwb_0_result_out;
    wire[4:0] memwb_0_write_reg_addr_out;
    wire[31:0] regreadproxy_0_read_data_1;
    wire[31:0] regreadproxy_0_read_data_2;
    wire[31:0] regfile_0_read_data_1;
    wire[31:0] regfile_0_read_data_2;
    wire memwb_0_hilo_write_en_out;
    wire[31:0] memwb_0_hi_out;
    wire[31:0] memwb_0_lo_out;
    wire[31:0] hilo_0_hi;
    wire[31:0] hilo_0_lo;
    wire ex_0_hilo_write_en;
    wire[31:0] ex_0_hi_out;
    wire[31:0] ex_0_lo_out;
    wire exmem_0_hilo_write_en_out;
    wire[31:0] exmem_0_hi_out;
    wire[31:0] exmem_0_lo_out;
    wire mem_0_hilo_write_en_out;
    wire[31:0] mem_0_hi_out;
    wire[31:0] mem_0_lo_out;
    wire[31:0] hiloreadproxy_0_hi_out;
    wire[31:0] hiloreadproxy_0_lo_out;
    wire id_0_branch_flag;
    wire[31:0] id_0_branch_addr;

    IFID ifid_0(
        .clk(clk_1),
        .rst(rst_1),
        .addr_in(pc_0_addr),
        .inst_in(rom_0_inst),
        .addr_out(ifid_0_addr_out),
        .inst_out(ifid_0_inst_out)
    );

    IDEX idex_0(
        .clk(clk_1),
        .rst(rst_1),
        .write_reg_en_in(id_0_write_reg_en),
        .write_reg_addr_in(id_0_write_reg_addr),
        .operand_2_in(id_0_operand_2),
        .operand_1_in(id_0_operand_1),
        .shamt_in(id_0_shamt),
        .funct_in(id_0_funct),
        .funct_out(idex_0_funct_out),
        .shamt_out(idex_0_shamt_out),
        .operand_1_out(idex_0_operand_1_out),
        .operand_2_out(idex_0_operand_2_out),
        .write_reg_en_out(idex_0_write_reg_en_out),
        .write_reg_addr_out(idex_0_write_reg_addr_out)
    );

    ROM rom_0(
        .en(pc_0_rom_en),
        .addr(pc_0_addr),
        .inst(rom_0_inst)
    );

    RegFile regfile_0(
        .clk(clk_1),
        .rst(rst_1),
        .read_addr_2(id_0_reg_addr_2),
        .read_addr_1(id_0_reg_addr_1),
        .read_en_2(id_0_reg_read_en_2),
        .read_en_1(id_0_reg_read_en_1),
        .write_en(memwb_0_write_reg_en_out),
        .write_data(memwb_0_result_out),
        .write_addr(memwb_0_write_reg_addr_out),
        .read_data_1(regfile_0_read_data_1),
        .read_data_2(regfile_0_read_data_2)
    );

    RegReadProxy regreadproxy_0(
        .read_addr_2(id_0_reg_addr_2),
        .read_addr_1(id_0_reg_addr_1),
        .read_en_2(id_0_reg_read_en_2),
        .read_en_1(id_0_reg_read_en_1),
        .data_from_ex(ex_0_result_out),
        .reg_write_en_from_ex(ex_0_write_reg_en_out),
        .reg_write_addr_from_ex(ex_0_write_reg_addr_out),
        .data_from_mem(mem_0_result_out),
        .reg_write_en_from_mem(mem_0_write_reg_en_out),
        .reg_write_addr_from_mem(mem_0_write_reg_addr_out),
        .read_data_1(regreadproxy_0_read_data_1),
        .read_data_2(regreadproxy_0_read_data_2),
        .data_1_from_reg(regfile_0_read_data_1),
        .data_2_from_reg(regfile_0_read_data_2)
    );

    EX ex_0(
        .rst(rst_1),
        .funct(idex_0_funct_out),
        .shamt(idex_0_shamt_out),
        .operand_1(idex_0_operand_1_out),
        .operand_2(idex_0_operand_2_out),
        .write_reg_en_in(idex_0_write_reg_en_out),
        .write_reg_addr_in(idex_0_write_reg_addr_out),
        .result_out(ex_0_result_out),
        .write_reg_en_out(ex_0_write_reg_en_out),
        .write_reg_addr_out(ex_0_write_reg_addr_out),
        .hilo_write_en(ex_0_hilo_write_en),
        .hi_out(ex_0_hi_out),
        .lo_out(ex_0_lo_out),
        .hi_in(hiloreadproxy_0_hi_out),
        .lo_in(hiloreadproxy_0_lo_out)
    );

    EXMEM exmem_0(
        .clk(clk_1),
        .rst(rst_1),
        .result_in(ex_0_result_out),
        .write_reg_en_in(ex_0_write_reg_en_out),
        .write_reg_addr_in(ex_0_write_reg_addr_out),
        .result_out(exmem_0_result_out),
        .write_reg_en_out(exmem_0_write_reg_en_out),
        .write_reg_addr_out(exmem_0_write_reg_addr_out),
        .hilo_write_en_in(ex_0_hilo_write_en),
        .hi_in(ex_0_hi_out),
        .lo_in(ex_0_lo_out),
        .hilo_write_en_out(exmem_0_hilo_write_en_out),
        .hi_out(exmem_0_hi_out),
        .lo_out(exmem_0_lo_out)
    );

    MEM mem_0(
        .rst(rst_1),
        .result_in(exmem_0_result_out),
        .write_reg_en_in(exmem_0_write_reg_en_out),
        .write_reg_addr_in(exmem_0_write_reg_addr_out),
        .result_out(mem_0_result_out),
        .write_reg_en_out(mem_0_write_reg_en_out),
        .write_reg_addr_out(mem_0_write_reg_addr_out),
        .hilo_write_en_in(exmem_0_hilo_write_en_out),
        .hi_in(exmem_0_hi_out),
        .lo_in(exmem_0_lo_out),
        .hilo_write_en_out(mem_0_hilo_write_en_out),
        .hi_out(mem_0_hi_out),
        .lo_out(mem_0_lo_out)
    );

    MEMWB memwb_0(
        .clk(clk_1),
        .rst(rst_1),
        .result_in(mem_0_result_out),
        .write_reg_en_in(mem_0_write_reg_en_out),
        .write_reg_addr_in(mem_0_write_reg_addr_out),
        .write_reg_en_out(memwb_0_write_reg_en_out),
        .result_out(memwb_0_result_out),
        .write_reg_addr_out(memwb_0_write_reg_addr_out),
        .hilo_write_en_out(memwb_0_hilo_write_en_out),
        .hi_out(memwb_0_hi_out),
        .lo_out(memwb_0_lo_out),
        .hilo_write_en_in(mem_0_hilo_write_en_out),
        .hi_in(mem_0_hi_out),
        .lo_in(mem_0_lo_out)
    );

    HILO hilo_0(
        .clk(clk_1),
        .rst(rst_1),
        .write_en(memwb_0_hilo_write_en_out),
        .hi_in(memwb_0_hi_out),
        .lo_in(memwb_0_lo_out),
        .hi(hilo_0_hi),
        .lo(hilo_0_lo)
    );

    HILOReadProxy hiloreadproxy_0(
        .wb_hilo_write_en(memwb_0_hilo_write_en_out),
        .wb_hi_in(memwb_0_hi_out),
        .wb_lo_in(memwb_0_lo_out),
        .hi_in(hilo_0_hi),
        .lo_in(hilo_0_lo),
        .mem_hilo_write_en(mem_0_hilo_write_en_out),
        .mem_hi_in(mem_0_hi_out),
        .mem_lo_in(mem_0_lo_out),
        .hi_out(hiloreadproxy_0_hi_out),
        .lo_out(hiloreadproxy_0_lo_out)
    );

    ID id_0(
        .rst(rst_1),
        .addr(ifid_0_addr_out),
        .inst(ifid_0_inst_out),
        .write_reg_en(id_0_write_reg_en),
        .write_reg_addr(id_0_write_reg_addr),
        .operand_2(id_0_operand_2),
        .operand_1(id_0_operand_1),
        .shamt(id_0_shamt),
        .funct(id_0_funct),
        .reg_addr_2(id_0_reg_addr_2),
        .reg_addr_1(id_0_reg_addr_1),
        .reg_read_en_2(id_0_reg_read_en_2),
        .reg_read_en_1(id_0_reg_read_en_1),
        .reg_data_1(regreadproxy_0_read_data_1),
        .reg_data_2(regreadproxy_0_read_data_2),
        .branch_flag(id_0_branch_flag),
        .branch_addr(id_0_branch_addr)
    );

    PC pc_0(
        .clk(clk_1),
        .rst(rst_1),
        .rom_en(pc_0_rom_en),
        .addr(pc_0_addr),
        .branch_flag(id_0_branch_flag),
        .branch_addr(id_0_branch_addr)
    );

endmodule // Uranus
