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

module  I2C_SC2210_19201080_4Lanes_Config //1920*1080
(
    input       [8:0]   LUT_INDEX,
    output  reg [23:0]  LUT_DATA,
    output      [8:0]   LUT_SIZE
);
assign  LUT_SIZE = 264 + 1;

//-----------------------------------------------------------------
/////////////////////   Config Data LUT   //////////////////////////    
always@(*)
begin
    case(LUT_INDEX)
0:	LUT_DATA = {16'h0103,8'h01}; 
1:	LUT_DATA = {16'h0100,8'h00}; 
2:	LUT_DATA = {16'h36e9,8'h80}; 
3:	LUT_DATA = {16'h36f9,8'h80}; 
4:	LUT_DATA = {16'h3001,8'h07}; 
5:	LUT_DATA = {16'h3002,8'hc0}; 
6:	LUT_DATA = {16'h300a,8'h2c}; 
7:	LUT_DATA = {16'h300f,8'h00}; 
8:	LUT_DATA = {16'h3018,8'h73}; 
9:	LUT_DATA = {16'h3019,8'h00}; 
10:	LUT_DATA = {16'h301f,8'hac}; 
11:	LUT_DATA = {16'h3031,8'h0a}; 
12:	LUT_DATA = {16'h3033,8'h20}; 
13:	LUT_DATA = {16'h3038,8'h22}; 
14:	LUT_DATA = {16'h3106,8'h81}; 
15:	LUT_DATA = {16'h3201,8'h04}; 
16:	LUT_DATA = {16'h3203,8'h04}; 
17:	LUT_DATA = {16'h3204,8'h07}; 
18:	LUT_DATA = {16'h3205,8'h8b}; 
19:	LUT_DATA = {16'h3206,8'h04}; 
20:	LUT_DATA = {16'h3207,8'h43}; 
21:	LUT_DATA = {16'h320c,8'h04}; 
22:	LUT_DATA = {16'h320d,8'h37}; 
23:	LUT_DATA = {16'h320e,8'h04}; 
24:	LUT_DATA = {16'h320f,8'h58}; 
25:	LUT_DATA = {16'h3211,8'h04}; 
26:	LUT_DATA = {16'h3213,8'h04}; 
27:	LUT_DATA = {16'h3231,8'h02}; 
28:	LUT_DATA = {16'h3253,8'h04}; 
29:	LUT_DATA = {16'h3301,8'h0a}; 
30:	LUT_DATA = {16'h3302,8'h10}; 
31:	LUT_DATA = {16'h3304,8'h58}; 
32:	LUT_DATA = {16'h3305,8'h00}; 
33:	LUT_DATA = {16'h3306,8'hb0}; 
34:	LUT_DATA = {16'h3308,8'h20}; 
35:	LUT_DATA = {16'h3309,8'h98}; 
36:	LUT_DATA = {16'h330a,8'h01}; 
37:	LUT_DATA = {16'h330b,8'h68}; 
38:	LUT_DATA = {16'h330e,8'h48}; 
39:	LUT_DATA = {16'h3314,8'h92}; 
40:	LUT_DATA = {16'h3000,8'hc0}; 
41:	LUT_DATA = {16'h331e,8'h49}; 
42:	LUT_DATA = {16'h331f,8'h89}; 
43:	LUT_DATA = {16'h334c,8'h10}; 
44:	LUT_DATA = {16'h335d,8'h60}; 
45:	LUT_DATA = {16'h335e,8'h02}; 
46:	LUT_DATA = {16'h335f,8'h06}; 
47:	LUT_DATA = {16'h3364,8'h16}; 
48:	LUT_DATA = {16'h3366,8'h92}; 
49:	LUT_DATA = {16'h3367,8'h10}; 
50:	LUT_DATA = {16'h3368,8'h04}; 
51:	LUT_DATA = {16'h3369,8'h00}; 
52:	LUT_DATA = {16'h336a,8'h00}; 
53:	LUT_DATA = {16'h336b,8'h00}; 
54:	LUT_DATA = {16'h336d,8'h03}; 
55:	LUT_DATA = {16'h337c,8'h08}; 
56:	LUT_DATA = {16'h337d,8'h0e}; 
57:	LUT_DATA = {16'h337f,8'h33}; 
58:	LUT_DATA = {16'h3390,8'h10}; 
59:	LUT_DATA = {16'h3391,8'h30}; 
60:	LUT_DATA = {16'h3392,8'h40}; 
61:	LUT_DATA = {16'h3393,8'h0a}; 
62:	LUT_DATA = {16'h3394,8'h0a}; 
63:	LUT_DATA = {16'h3395,8'h0a}; 
64:	LUT_DATA = {16'h3396,8'h08}; 
65:	LUT_DATA = {16'h3397,8'h30}; 
66:	LUT_DATA = {16'h3398,8'h3f}; 
67:	LUT_DATA = {16'h3399,8'h30}; 
68:	LUT_DATA = {16'h339a,8'h30}; 
69:	LUT_DATA = {16'h339b,8'h30}; 
70:	LUT_DATA = {16'h339c,8'h30}; 
71:	LUT_DATA = {16'h33a2,8'h0a}; 
72:	LUT_DATA = {16'h33b9,8'h0e}; 
73:	LUT_DATA = {16'h33e1,8'h08}; 
74:	LUT_DATA = {16'h33e2,8'h18}; 
75:	LUT_DATA = {16'h33e3,8'h18}; 
76:	LUT_DATA = {16'h33e4,8'h18}; 
77:	LUT_DATA = {16'h33e5,8'h10}; 
78:	LUT_DATA = {16'h33e6,8'h06}; 
79:	LUT_DATA = {16'h33e7,8'h02}; 
80:	LUT_DATA = {16'h33e8,8'h18}; 
81:	LUT_DATA = {16'h33e9,8'h10}; 
82:	LUT_DATA = {16'h33ea,8'h0c}; 
83:	LUT_DATA = {16'h33eb,8'h10}; 
84:	LUT_DATA = {16'h33ec,8'h04}; 
85:	LUT_DATA = {16'h33ed,8'h02}; 
86:	LUT_DATA = {16'h33ee,8'ha0}; 
87:	LUT_DATA = {16'h33ef,8'h08}; 
88:	LUT_DATA = {16'h33f4,8'h18}; 
89:	LUT_DATA = {16'h33f5,8'h10}; 
90:	LUT_DATA = {16'h33f6,8'h0c}; 
91:	LUT_DATA = {16'h33f7,8'h10}; 
92:	LUT_DATA = {16'h33f8,8'h06}; 
93:	LUT_DATA = {16'h33f9,8'h02}; 
94:	LUT_DATA = {16'h33fa,8'h18}; 
95:	LUT_DATA = {16'h33fb,8'h10}; 
96:	LUT_DATA = {16'h33fc,8'h0c}; 
97:	LUT_DATA = {16'h33fd,8'h10}; 
98:	LUT_DATA = {16'h33fe,8'h04}; 
99:	LUT_DATA = {16'h33ff,8'h02}; 
100:	LUT_DATA = {16'h360f,8'h01}; 
101:	LUT_DATA = {16'h3622,8'hf7}; 
102:	LUT_DATA = {16'h3625,8'h0a}; 
103:	LUT_DATA = {16'h3627,8'h02}; 
104:	LUT_DATA = {16'h3630,8'ha2}; 
105:	LUT_DATA = {16'h3631,8'h00}; 
106:	LUT_DATA = {16'h3632,8'hd8}; 
107:	LUT_DATA = {16'h3633,8'h43}; 
108:	LUT_DATA = {16'h3635,8'h20}; 
109:	LUT_DATA = {16'h3638,8'h24}; 
110:	LUT_DATA = {16'h363a,8'h80}; 
111:	LUT_DATA = {16'h363b,8'h02}; 
112:	LUT_DATA = {16'h363e,8'h22}; 
113:	LUT_DATA = {16'h3670,8'h48}; 
114:	LUT_DATA = {16'h3671,8'hf7}; 
115:	LUT_DATA = {16'h3672,8'hf7}; 
116:	LUT_DATA = {16'h3673,8'h07}; 
117:	LUT_DATA = {16'h367a,8'h40}; 
118:	LUT_DATA = {16'h367b,8'h7f}; 
119:	LUT_DATA = {16'h3690,8'h42}; 
120:	LUT_DATA = {16'h3691,8'h43}; 
121:	LUT_DATA = {16'h3692,8'h54}; 
122:	LUT_DATA = {16'h369c,8'h40}; 
123:	LUT_DATA = {16'h369d,8'h7f}; 
124:	LUT_DATA = {16'h36b5,8'h40}; 
125:	LUT_DATA = {16'h36b6,8'h7f}; 
126:	LUT_DATA = {16'h36c0,8'h80}; 
127:	LUT_DATA = {16'h36c1,8'h9f}; 
128:	LUT_DATA = {16'h36c2,8'h9f}; 
129:	LUT_DATA = {16'h36cc,8'h20}; 
130:	LUT_DATA = {16'h36cd,8'h20}; 
131:	LUT_DATA = {16'h36ce,8'h30}; 
132:	LUT_DATA = {16'h36d0,8'h20}; 
133:	LUT_DATA = {16'h36d1,8'h40}; 
134:	LUT_DATA = {16'h36d2,8'h7f}; 
135:	LUT_DATA = {16'h36ea,8'h38}; 
136:	LUT_DATA = {16'h36eb,8'h0e}; 
137:	LUT_DATA = {16'h36ec,8'h13}; 
138:	LUT_DATA = {16'h36ed,8'h14}; 
139:	LUT_DATA = {16'h36fa,8'h3a}; 
140:	LUT_DATA = {16'h36fb,8'h15}; 
141:	LUT_DATA = {16'h36fc,8'h01}; 
142:	LUT_DATA = {16'h36fd,8'h14}; 
143:	LUT_DATA = {16'h3905,8'hd8}; 
144:	LUT_DATA = {16'h3907,8'h01}; 
145:	LUT_DATA = {16'h3908,8'h11}; 
146:	LUT_DATA = {16'h391b,8'h83}; 
147:	LUT_DATA = {16'h391f,8'h00}; 
148:	LUT_DATA = {16'h3933,8'h28}; 
149:	LUT_DATA = {16'h3934,8'ha6}; 
150:	LUT_DATA = {16'h3940,8'h70}; 
151:	LUT_DATA = {16'h3942,8'h08}; 
152:	LUT_DATA = {16'h3943,8'hbc}; 
153:	LUT_DATA = {16'h3958,8'h02}; 
154:	LUT_DATA = {16'h3959,8'h04}; 
155:	LUT_DATA = {16'h3980,8'h61}; 
156:	LUT_DATA = {16'h3987,8'h0b}; 
157:	LUT_DATA = {16'h3990,8'h00}; 
158:	LUT_DATA = {16'h3991,8'h00}; 
159:	LUT_DATA = {16'h3992,8'h00}; 
160:	LUT_DATA = {16'h3993,8'h00}; 
161:	LUT_DATA = {16'h3994,8'h00}; 
162:	LUT_DATA = {16'h3995,8'h00}; 
163:	LUT_DATA = {16'h3996,8'h00}; 
164:	LUT_DATA = {16'h3997,8'h00}; 
165:	LUT_DATA = {16'h3998,8'h00}; 
166:	LUT_DATA = {16'h3999,8'h00}; 
167:	LUT_DATA = {16'h399a,8'h00}; 
168:	LUT_DATA = {16'h399b,8'h00}; 
169:	LUT_DATA = {16'h399c,8'h00}; 
170:	LUT_DATA = {16'h399d,8'h00}; 
171:	LUT_DATA = {16'h399e,8'h00}; 
172:	LUT_DATA = {16'h399f,8'h00}; 
173:	LUT_DATA = {16'h39a0,8'h00}; 
174:	LUT_DATA = {16'h39a1,8'h00}; 
175:	LUT_DATA = {16'h39a2,8'h03}; 
176:	LUT_DATA = {16'h39a3,8'h30}; 
177:	LUT_DATA = {16'h39a4,8'h03}; 
178:	LUT_DATA = {16'h39a5,8'h60}; 
179:	LUT_DATA = {16'h39a6,8'h03}; 
180:	LUT_DATA = {16'h39a7,8'ha0}; 
181:	LUT_DATA = {16'h39a8,8'h03}; 
182:	LUT_DATA = {16'h39a9,8'hb0}; 
183:	LUT_DATA = {16'h39aa,8'h00}; 
184:	LUT_DATA = {16'h39ab,8'h00}; 
185:	LUT_DATA = {16'h39ac,8'h00}; 
186:	LUT_DATA = {16'h39ad,8'h20}; 
187:	LUT_DATA = {16'h39ae,8'h00}; 
188:	LUT_DATA = {16'h39af,8'h40}; 
189:	LUT_DATA = {16'h39b0,8'h00}; 
190:	LUT_DATA = {16'h39b1,8'h60}; 
191:	LUT_DATA = {16'h39b2,8'h00}; 
192:	LUT_DATA = {16'h39b3,8'h00}; 
193:	LUT_DATA = {16'h39b4,8'h08}; 
194:	LUT_DATA = {16'h39b5,8'h14}; 
195:	LUT_DATA = {16'h39b6,8'h20}; 
196:	LUT_DATA = {16'h39b7,8'h38}; 
197:	LUT_DATA = {16'h39b8,8'h38}; 
198:	LUT_DATA = {16'h39b9,8'h20}; 
199:	LUT_DATA = {16'h39ba,8'h14}; 
200:	LUT_DATA = {16'h39bb,8'h08}; 
201:	LUT_DATA = {16'h39bc,8'h08}; 
202:	LUT_DATA = {16'h39bd,8'h10}; 
203:	LUT_DATA = {16'h39be,8'h20}; 
204:	LUT_DATA = {16'h39bf,8'h30}; 
205:	LUT_DATA = {16'h39c0,8'h30}; 
206:	LUT_DATA = {16'h39c1,8'h20}; 
207:	LUT_DATA = {16'h39c2,8'h10}; 
208:	LUT_DATA = {16'h39c3,8'h08}; 
209:	LUT_DATA = {16'h39c4,8'h00}; 
210:	LUT_DATA = {16'h39c5,8'h80}; 
211:	LUT_DATA = {16'h39c6,8'h00}; 
212:	LUT_DATA = {16'h39c7,8'h80}; 
213:	LUT_DATA = {16'h39c8,8'h00}; 
214:	LUT_DATA = {16'h39c9,8'h00}; 
215:	LUT_DATA = {16'h39ca,8'h80}; 
216:	LUT_DATA = {16'h39cb,8'h00}; 
217:	LUT_DATA = {16'h39cc,8'h00}; 
218:	LUT_DATA = {16'h39cd,8'h00}; 
219:	LUT_DATA = {16'h39ce,8'h00}; 
220:	LUT_DATA = {16'h39cf,8'h00}; 
221:	LUT_DATA = {16'h39d0,8'h00}; 
222:	LUT_DATA = {16'h39d1,8'h00}; 
223:	LUT_DATA = {16'h39e2,8'h05}; 
224:	LUT_DATA = {16'h39e3,8'heb}; 
225:	LUT_DATA = {16'h39e4,8'h07}; 
226:	LUT_DATA = {16'h39e5,8'hb6}; 
227:	LUT_DATA = {16'h39e6,8'h00}; 
228:	LUT_DATA = {16'h39e7,8'h3a}; 
229:	LUT_DATA = {16'h39e8,8'h3f}; 
230:	LUT_DATA = {16'h39e9,8'hb7}; 
231:	LUT_DATA = {16'h39ea,8'h02}; 
232:	LUT_DATA = {16'h39eb,8'h4f}; 
233:	LUT_DATA = {16'h39ec,8'h08}; 
234:	LUT_DATA = {16'h39ed,8'h00}; 
235:	LUT_DATA = {16'h3e00,8'h00}; 
236:	LUT_DATA = {16'h3e01,8'h45}; 
237:	LUT_DATA = {16'h3e02,8'h40}; 
238:	LUT_DATA = {16'h3e03,8'h0b}; 
239:	LUT_DATA = {16'h3e06,8'h00}; 
240:	LUT_DATA = {16'h3e07,8'h80}; 
241:	LUT_DATA = {16'h3e08,8'h03}; 
242:	LUT_DATA = {16'h3e09,8'h40}; 
243:	LUT_DATA = {16'h3e14,8'h31}; 
244:	LUT_DATA = {16'h3e1b,8'h3a}; 
245:	LUT_DATA = {16'h3e26,8'h40}; 
246:	LUT_DATA = {16'h3f08,8'h08}; 
247:	LUT_DATA = {16'h4401,8'h1a}; 
248:	LUT_DATA = {16'h4407,8'hc0}; 
249:	LUT_DATA = {16'h4418,8'h34}; 
250:	LUT_DATA = {16'h4500,8'h18}; 
251:	LUT_DATA = {16'h4501,8'hb4}; 
252:	LUT_DATA = {16'h4509,8'h20}; 
253:	LUT_DATA = {16'h4603,8'h00}; 
254:	LUT_DATA = {16'h4800,8'h24}; 
255:	LUT_DATA = {16'h4837,8'h25}; 
256:	LUT_DATA = {16'h5000,8'h0e}; 
257:	LUT_DATA = {16'h550f,8'h20}; 
258:	LUT_DATA = {16'h8c50,8'h40}; 
259:	LUT_DATA = {16'h36e9,8'h24}; 
260:	LUT_DATA = {16'h36f9,8'h14}; 
261:	LUT_DATA = {16'h3652,8'h44}; 
262:	LUT_DATA = {16'h3653,8'h44}; 
263:	LUT_DATA = {16'h3654,8'h44}; 
264:	LUT_DATA = {16'h0100,8'h01}; 
		default:LUT_DATA    =   {16'h0000, 8'h00};
    endcase
end

endmodule
