// address bus
`define ADDR_BUS                31:0
`define ADDR_BUS_WIDTH          32

// instruction bus
`define INST_BUS                31:0
`define INST_BUS_WIDTH          32

// data bus
`define DATA_BUS                31:0
`define DATA_BUS_WIDTH          32

// double size data bus
`define DOUBLE_DATA_BUS         64:0
`define DOUBLE_DATA_BUS_WIDTH   64

// half size data bus
`define HALF_DATA_BUS           15:0
`define HALF_DATA_BUS_WIDTH     16

// coprocessor address bus
`define CP0_ADDR_BUS            4:0
`define CP0_ADDR_BUS_WIDTH      5

// register bus
`define REG_ADDR_BUS            4:0
`define REG_ADDR_BUS_WIDTH      5

// instruction information bus
`define INST_OP_BUS             5:0
`define INST_OP_BUS_WIDTH       6
`define FUNCT_BUS               5:0
`define FUNCT_BUS_WIDTH         6
`define SHAMT_BUS               4:0
`define SHAMT_BUS_WIDTH         5

`define STALL_BUS               5:0
`define STALL_BUS_WIDTH         6
