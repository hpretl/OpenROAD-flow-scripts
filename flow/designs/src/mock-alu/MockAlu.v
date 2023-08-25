module MockAlu(
  input         clock,
  input         reset,
  input  [4:0]  io_op,
  input  [63:0] io_a,
  input  [63:0] io_b,
  output [63:0] io_out
);
  wire [63:0] barrel_io_data;
  wire [5:0] barrel_io_shiftAmount;
  wire [4:0] barrel_io_dir;
  wire [63:0] barrel_io_out;
  wire [63:0] multResult_mult_a;
  wire [63:0] multResult_mult_b;
  wire [127:0] multResult_mult_o;
  wire  multResult_mult_clk;
  wire  multResult_mult_rst;
  wire [63:0] operand_io_a;
  wire [63:0] operand_io_b;
  wire [63:0] operand_io_out;
  wire [63:0] operand_1_io_a;
  wire [63:0] operand_1_io_b;
  wire [63:0] operand_1_io_out;
  wire [63:0] operand_2_io_a;
  wire [63:0] operand_2_io_b;
  wire [63:0] operand_2_io_out;
  reg [4:0] op;
  reg [63:0] a;
  reg [63:0] b;
  wire  _isSubtraction_T = op == 5'h4;
  wire  _isSubtraction_T_1 = op == 5'hb;
  wire  _isSubtraction_T_2 = op == 5'hc;
  wire  _isSubtraction_T_3 = op == 5'hd;
  wire  _isSubtraction_T_4 = op == 5'hf;
  wire  _isSubtraction_T_5 = op == 5'he;
  wire  _isSubtraction_T_6 = op == 5'h10;
  wire  isSubtraction = _isSubtraction_T | _isSubtraction_T_1 | _isSubtraction_T_2 | _isSubtraction_T_3 |
    _isSubtraction_T_4 | _isSubtraction_T_5 | _isSubtraction_T_6;
  wire [63:0] _modifiedB_T = ~b;
  wire [63:0] modifiedB = isSubtraction ? _modifiedB_T : b;
  wire [64:0] _extendedResult_T = a + modifiedB;
  wire [64:0] _GEN_0 = {{64'd0}, isSubtraction};
  wire [64:0] extendedResult = _extendedResult_T + _GEN_0;
  wire [63:0] result = extendedResult[63:0];
  wire  carryOut = extendedResult[64];
  wire  isTrueZero = ~(|result);
  wire  isNegative = result[63];
  wire  _T_3 = ~isTrueZero;
  wire  _T_4 = isTrueZero | isNegative;
  wire  _T_5 = ~carryOut;
  wire  _T_7 = isTrueZero | _T_5;
  wire [63:0] _io_out_T_2 = 5'h5 == op ? operand_io_out : 64'h0;
  wire [63:0] _io_out_T_4 = 5'h6 == op ? operand_1_io_out : _io_out_T_2;
  wire [63:0] _io_out_T_6 = 5'h7 == op ? operand_2_io_out : _io_out_T_4;
  wire [63:0] _io_out_T_8 = 5'h0 == op ? result : _io_out_T_6;
  wire [63:0] _io_out_T_10 = 5'h4 == op ? result : _io_out_T_8;
  wire [63:0] _io_out_T_12 = 5'hb == op ? {{63'd0}, isTrueZero} : _io_out_T_10;
  wire [63:0] _io_out_T_14 = 5'hc == op ? {{63'd0}, _T_3} : _io_out_T_12;
  wire [63:0] _io_out_T_16 = 5'hd == op ? {{63'd0}, isNegative} : _io_out_T_14;
  wire [63:0] _io_out_T_18 = 5'hf == op ? {{63'd0}, _T_4} : _io_out_T_16;
  wire [63:0] _io_out_T_20 = 5'he == op ? {{63'd0}, _T_5} : _io_out_T_18;
  wire [63:0] _io_out_T_22 = 5'h10 == op ? {{63'd0}, _T_7} : _io_out_T_20;
  wire [63:0] _io_out_T_24 = 5'h8 == op ? barrel_io_out : _io_out_T_22;
  wire [63:0] _io_out_T_26 = 5'h9 == op ? barrel_io_out : _io_out_T_24;
  wire [63:0] _io_out_T_28 = 5'ha == op ? barrel_io_out : _io_out_T_26;
  reg [127:0] io_out_REG;
  BarrelShifter barrel (
    .io_data(barrel_io_data),
    .io_shiftAmount(barrel_io_shiftAmount),
    .io_dir(barrel_io_dir),
    .io_out(barrel_io_out)
  );
  multiplier multResult_mult (
    .a(multResult_mult_a),
    .b(multResult_mult_b),
    .o(multResult_mult_o),
    .clk(multResult_mult_clk),
    .rst(multResult_mult_rst)
  );
  assign operand_io_out = operand_io_a & operand_io_b;
  assign operand_1_io_out = operand_1_io_a | operand_1_io_b;
  assign operand_2_io_out = operand_2_io_a ^ operand_2_io_b;
  assign io_out = io_out_REG[63:0];
  assign barrel_io_data = a;
  assign barrel_io_shiftAmount = b[5:0];
  assign barrel_io_dir = io_op;
  assign multResult_mult_a = a;
  assign multResult_mult_b = b;
  assign multResult_mult_clk = clock;
  assign multResult_mult_rst = reset;
  assign operand_io_a = a;
  assign operand_io_b = b;
  assign operand_1_io_a = a;
  assign operand_1_io_b = b;
  assign operand_2_io_a = a;
  assign operand_2_io_b = b;
  always @(posedge clock) begin
    op <= io_op;
    a <= io_a;
    b <= io_b;
    if (5'h11 == op) begin
      io_out_REG <= multResult_mult_o;
    end else begin
      io_out_REG <= {{64'd0}, _io_out_T_28};
    end
  end
endmodule