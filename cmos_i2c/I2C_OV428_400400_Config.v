/*-------------------------------------------------------------------------
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo.www.cnblogs.com/crazybingo
(C) COPYRIGHT 2012 CrazyBingo. ALL RIGHTS RESERVED
Filename            :       I2C_SC130GS_12801024_Config.v
Author              :       CrazyBingo
Date                :       2019-08-03
Version             :       1.0
Description         :       I2C Configure Data of AR0135.
Modification History    :
Date            By          Version         Change Description
===========================================================================
19/08/03        CrazyBingo  1.0             Original
--------------------------------------------------------------------------*/

`timescale 1ns/1ns
module  I2C_OV428_400400_Config  //1280*1024@60 with AutO/Manual Exposure
(
    input       [7:0]   LUT_INDEX,
    output  reg [23:0]  LUT_DATA,
    output      [7:0]   LUT_SIZE
);
assign  LUT_SIZE = 185;
//raw 10
//-----------------------------------------------------------------
/////////////////////   Config Data LUT   //////////////////////////    
always@(*)
begin
    case(LUT_INDEX)
    0  :LUT_DATA = {16'h0103, 8'h01};
    1  :LUT_DATA = {16'h0100, 8'h00};
    2  :LUT_DATA = {16'h0301, 8'hc8};
    3  :LUT_DATA = {16'h0304, 8'h00};
    4  :LUT_DATA = {16'h0305, 8'hf0};
    5  :LUT_DATA = {16'h0306, 8'h04};
    6  :LUT_DATA = {16'h0307, 8'h04};
    7  :LUT_DATA = {16'h0324, 8'h00};
    8  :LUT_DATA = {16'h0325, 8'hf0};
    9  :LUT_DATA = {16'h032a, 8'h0e};
    10 :LUT_DATA = {16'h032b, 8'h06};
    11 :LUT_DATA = {16'h3001, 8'h14};
    12 :LUT_DATA = {16'h300d, 8'h01};
    13 :LUT_DATA = {16'h300f, 8'h01};
    14 :LUT_DATA = {16'h300e, 8'hd2};
    15 :LUT_DATA = {16'h3013, 8'h31};
    16 :LUT_DATA = {16'h3014, 8'h12};
    17 :LUT_DATA = {16'h3015, 8'h00};
    18 :LUT_DATA = {16'h3018, 8'hf0};
    19 :LUT_DATA = {16'h301a, 8'haa};
    20 :LUT_DATA = {16'h3031, 8'h02};
    21 :LUT_DATA = {16'h3107, 8'h01};
    22 :LUT_DATA = {16'h3200, 8'h00};
    23 :LUT_DATA = {16'h3201, 8'h20};
    24 :LUT_DATA = {16'h3202, 8'h00};
    25 :LUT_DATA = {16'h3204, 8'h8a};
    26 :LUT_DATA = {16'h3207, 8'h00};
    27 :LUT_DATA = {16'h3208, 8'h00};
    28 :LUT_DATA = {16'h3209, 8'h03};
    29 :LUT_DATA = {16'h3215, 8'h03};
    30 :LUT_DATA = {16'h3416, 8'h02};
    31 :LUT_DATA = {16'h3418, 8'h00};
    32 :LUT_DATA = {16'h3501, 8'h00};
    33 :LUT_DATA = {16'h3502, 8'h04};
    34 :LUT_DATA = {16'h3503, 8'h22};
    35 :LUT_DATA = {16'h3508, 8'h01};
    36 :LUT_DATA = {16'h3509, 8'h00};
    37 :LUT_DATA = {16'h3600, 8'h00};
    38 :LUT_DATA = {16'h360e, 8'h02};
    39 :LUT_DATA = {16'h360f, 8'h00};
    40 :LUT_DATA = {16'h3611, 8'h40};
    41 :LUT_DATA = {16'h3612, 8'h80};
    42 :LUT_DATA = {16'h3617, 8'h08};
    43 :LUT_DATA = {16'h3631, 8'h91};
    44 :LUT_DATA = {16'h3660, 8'h00};
    45 :LUT_DATA = {16'h3663, 8'h00};
    46 :LUT_DATA = {16'h3664, 8'h00};
    47 :LUT_DATA = {16'h3668, 8'h04};
    48 :LUT_DATA = {16'h366a, 8'hb5};
    49 :LUT_DATA = {16'h3672, 8'h36};
    50 :LUT_DATA = {16'h3674, 8'hf6};
    51 :LUT_DATA = {16'h3701, 8'h40};
    52 :LUT_DATA = {16'h3702, 8'h4d};
    53 :LUT_DATA = {16'h3708, 8'h0b};
    54 :LUT_DATA = {16'h3709, 8'h11};
    55 :LUT_DATA = {16'h370a, 8'h0e};
    56 :LUT_DATA = {16'h370b, 8'h14};
    57 :LUT_DATA = {16'h370c, 8'h06};
    58 :LUT_DATA = {16'h3732, 8'h00};
    59 :LUT_DATA = {16'h3737, 8'h00};
    60 :LUT_DATA = {16'h3760, 8'h80};
    61 :LUT_DATA = {16'h3730, 8'h10};
    62 :LUT_DATA = {16'h3731, 8'h00};
    63 :LUT_DATA = {16'h3732, 8'h00};
    64 :LUT_DATA = {16'h3733, 8'h00};
    65 :LUT_DATA = {16'h3736, 8'h00};
    66 :LUT_DATA = {16'h373a, 8'h01};
    67 :LUT_DATA = {16'h3809, 8'h04};
    68 :LUT_DATA = {16'h380b, 8'h6c};
    69 :LUT_DATA = {16'h3812, 8'h02};
    70 :LUT_DATA = {16'h3813, 8'hdc};
    71 :LUT_DATA = {16'h3820, 8'h00};
    72 :LUT_DATA = {16'h3821, 8'h00};
    73 :LUT_DATA = {16'h3822, 8'h00};
    74 :LUT_DATA = {16'h3823, 8'h00};
    75 :LUT_DATA = {16'h3824, 8'h02};
    76 :LUT_DATA = {16'h3825, 8'hd7};
    77 :LUT_DATA = {16'h3826, 8'h02};
    78 :LUT_DATA = {16'h3827, 8'hd7};
    79 :LUT_DATA = {16'h3828, 8'h01};
    80 :LUT_DATA = {16'h3829, 8'h90};
    81 :LUT_DATA = {16'h382a, 8'h01};
    82 :LUT_DATA = {16'h382b, 8'h90};
    83 :LUT_DATA = {16'h382c, 8'h03};
    84 :LUT_DATA = {16'h382d, 8'h08};
    85 :LUT_DATA = {16'h382e, 8'h00};
    86 :LUT_DATA = {16'h382f, 8'h00};
    87 :LUT_DATA = {16'h3831, 8'h00};
    88 :LUT_DATA = {16'h3833, 8'h00};
    89 :LUT_DATA = {16'h3840, 8'h80};
    90 :LUT_DATA = {16'h3852, 8'h06};
    91 :LUT_DATA = {16'h3853, 8'hbf};
    92 :LUT_DATA = {16'h3854, 8'h02};
    93 :LUT_DATA = {16'h3855, 8'hdc};
    94 :LUT_DATA = {16'h3856, 8'h0a};
    95 :LUT_DATA = {16'h3a00, 8'h18};
    96 :LUT_DATA = {16'h3a02, 8'h01};
    97 :LUT_DATA = {16'h3a03, 8'h90};
    98 :LUT_DATA = {16'h3a14, 8'h01};
    99 :LUT_DATA = {16'h3a15, 8'h90};
    100:LUT_DATA = {16'h3f05, 8'h00};
    101:LUT_DATA = {16'h4004, 8'h00};
    102:LUT_DATA = {16'h4005, 8'h02};
    103:LUT_DATA = {16'h4006, 8'h00};
    104:LUT_DATA = {16'h4007, 8'h02};
    105:LUT_DATA = {16'h4008, 8'h00};
    106:LUT_DATA = {16'h4009, 8'h01};
    107:LUT_DATA = {16'h400a, 8'h03};
    108:LUT_DATA = {16'h400c, 8'h00};
    109:LUT_DATA = {16'h400d, 8'h01};
    110:LUT_DATA = {16'h4604, 8'h48};
    111:LUT_DATA = {16'h480e, 8'h00};
    112:LUT_DATA = {16'h4813, 8'he4};
    113:LUT_DATA = {16'h4827, 8'h00};
    114:LUT_DATA = {16'h4837, 8'h10};
    115:LUT_DATA = {16'h4b27, 8'h00};
    116:LUT_DATA = {16'h4f01, 8'h13};
    117:LUT_DATA = {16'h5005, 8'h04};
    118:LUT_DATA = {16'h5044, 8'h04};
    119:LUT_DATA = {16'h5045, 8'h02};
    120:LUT_DATA = {16'h5048, 8'h01};
    121:LUT_DATA = {16'h5049, 8'h90};
    122:LUT_DATA = {16'h504a, 8'h01};
    123:LUT_DATA = {16'h504b, 8'h90};
    124:LUT_DATA = {16'h5140, 8'h00};
    125:LUT_DATA = {16'h5148, 8'h01};
    126:LUT_DATA = {16'h5149, 8'h90};
    127:LUT_DATA = {16'h514a, 8'h01};
    128:LUT_DATA = {16'h514b, 8'h90};
    129:LUT_DATA = {16'h5050, 8'h00};
    130:LUT_DATA = {16'h5051, 8'h00};
    131:LUT_DATA = {16'h5052, 8'h00};
    132:LUT_DATA = {16'h5053, 8'h00};
    133:LUT_DATA = {16'h5054, 8'h01};
    134:LUT_DATA = {16'h5055, 8'h90};
    135:LUT_DATA = {16'h5056, 8'h01};
    136:LUT_DATA = {16'h5057, 8'h90};
    137:LUT_DATA = {16'h5058, 8'h01};
    138:LUT_DATA = {16'h5059, 8'h90};
    139:LUT_DATA = {16'h505a, 8'h01};
    140:LUT_DATA = {16'h505b, 8'h90};
    141:LUT_DATA = {16'h3800, 8'h01};
    142:LUT_DATA = {16'h3805, 8'h01};
    143:LUT_DATA = {16'h3806, 8'hd0};
    144:LUT_DATA = {16'h3a1a, 8'h06};
    145:LUT_DATA = {16'h3204, 8'hce};
    146:LUT_DATA = {16'h3208, 8'h10};
    147:LUT_DATA = {16'h3d85, 8'h0b};
    148:LUT_DATA = {16'h3603, 8'h50};
    149:LUT_DATA = {16'h3604, 8'h14};
    150:LUT_DATA = {16'h3605, 8'h40};
    151:LUT_DATA = {16'h3607, 8'h00};
    152:LUT_DATA = {16'h3608, 8'h30};
    153:LUT_DATA = {16'h3a11, 8'hd0};
    154:LUT_DATA = {16'h3a1b, 8'h58};
    155:LUT_DATA = {16'h3a0f, 8'h58};
    156:LUT_DATA = {16'h3a10, 8'h48};
    157:LUT_DATA = {16'h3a1e, 8'h48};
    158:LUT_DATA = {16'h3a05, 8'h28};
    159:LUT_DATA = {16'h3602, 8'h08};
    160:LUT_DATA = {16'h3606, 8'h08};
    161:LUT_DATA = {16'h3523, 8'h03};
    162:LUT_DATA = {16'h3524, 8'h00};
    163:LUT_DATA = {16'h3a19, 8'hff};
    164:LUT_DATA = {16'h3a13, 8'h94};
    165:LUT_DATA = {16'h3524, 8'h00};
    166:LUT_DATA = {16'h3601, 8'h84};
    167:LUT_DATA = {16'h3503, 8'hbb};
    168:LUT_DATA = {16'h3501, 8'h01};
    169:LUT_DATA = {16'h3502, 8'hca};
    170:LUT_DATA = {16'h3508, 8'h01};
    171:LUT_DATA = {16'h3509, 8'h40};
    172:LUT_DATA = {16'h350a, 8'h01};
    173:LUT_DATA = {16'h350b, 8'h00};
    174:LUT_DATA = {16'h350c, 8'h00};
    175:LUT_DATA = {16'h3001, 8'hD4};
    176:LUT_DATA = {16'h3002, 8'h0D};
    177:LUT_DATA = {16'h3003, 8'h91};
    178:LUT_DATA = {16'h3004, 8'h84};
    179:LUT_DATA = {16'h3007, 8'h80};
    180:LUT_DATA = {16'hE000, 8'hA0};
    181:LUT_DATA = {16'h3980, 8'h11};
    182:LUT_DATA = {16'h3991, 8'hFF};
    183:LUT_DATA = {16'h3992, 8'hFF};
    184:LUT_DATA = {16'h0100, 8'h01};
		default:LUT_DATA    =   {16'h0000, 8'h00};
    endcase
end

endmodule
