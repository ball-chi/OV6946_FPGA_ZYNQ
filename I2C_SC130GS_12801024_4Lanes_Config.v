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
24/06/06        CrazyStaff  1.1             Low_Rate
--------------------------------------------------------------------------*/

`timescale 1ns/1ns

module  I2C_SC130GS_12801024_4Lanes_Config //1280*720
(
    input       [8:0]   LUT_INDEX,
    output  reg [23:0]  LUT_DATA,
    output      [8:0]   LUT_SIZE
);
assign  LUT_SIZE = 319 + 1;

//-----------------------------------------------------------------
/////////////////////   Config Data LUT   //////////////////////////    
always@(*)
begin
    case(LUT_INDEX)
0  :	LUT_DATA = {16'h0103,	8'h01};
1  :	LUT_DATA = {16'h0100,	8'h00};
2  :	LUT_DATA = {16'h3039,	8'hd3};
3  :	LUT_DATA = {16'h3034,	8'h01};
4  :	LUT_DATA = {16'h3035,	8'hc2};
5  :	LUT_DATA = {16'h330b,	8'h4c};
6  :	LUT_DATA = {16'h3664,	8'h09};
7  :	LUT_DATA = {16'h3638,	8'h82};
8  :	LUT_DATA = {16'h3d08,	8'h00};
9  :	LUT_DATA = {16'h3640,	8'h03};
10 :	LUT_DATA = {16'h3205,	8'h93};
11 :	LUT_DATA = {16'h3620,	8'h42};
12 :	LUT_DATA = {16'h3623,	8'h06};
13 :	LUT_DATA = {16'h3627,	8'h02};
14 :	LUT_DATA = {16'h3621,	8'h28};
15 :	LUT_DATA = {16'h363b,	8'h00};
16 :	LUT_DATA = {16'h3633,	8'h24};
17 :	LUT_DATA = {16'h3634,	8'hff};
18 :	LUT_DATA = {16'h3416,	8'h10};
19 :	LUT_DATA = {16'h3e03,	8'h0b};
20 :	LUT_DATA = {16'h3e08,	8'h03};
21 :	LUT_DATA = {16'h3e09,	8'h20};
22 :	LUT_DATA = {16'h3e01,	8'h23};
23 :	LUT_DATA = {16'h3e14,	8'hb0};
24 :	LUT_DATA = {16'h330b,	8'h40};
25 :	LUT_DATA = {16'h3e08,	8'h3f};
26 :	LUT_DATA = {16'h363b,	8'h80};
27 :	LUT_DATA = {16'h3623,	8'h07};
28 :	LUT_DATA = {16'h5000,	8'h01};
29 :	LUT_DATA = {16'h3e01,	8'h00};
30 :	LUT_DATA = {16'h3e02,	8'h30};
31 :	LUT_DATA = {16'h320c,	8'h05};
32 :	LUT_DATA = {16'h320d,	8'h46};
33 :	LUT_DATA = {16'h320e,	8'h02};
34 :	LUT_DATA = {16'h320f,	8'h58};
35 :	LUT_DATA = {16'h3638,	8'h85};
36 :	LUT_DATA = {16'h3306,	8'h50};
37 :	LUT_DATA = {16'h330b,	8'h68};
38 :	LUT_DATA = {16'h3308,	8'h10};
39 :	LUT_DATA = {16'h3e01,	8'h00};
40 :	LUT_DATA = {16'h363b,	8'h00};
41 :	LUT_DATA = {16'h3663,	8'hf8};
42 :	LUT_DATA = {16'h3664,	8'h0a};
43 :	LUT_DATA = {16'h3633,	8'h27};
44 :	LUT_DATA = {16'h303a,	8'h3a};
45 :	LUT_DATA = {16'h303a,	8'h3a};
46 :	LUT_DATA = {16'h303a,	8'h3a};
47 :	LUT_DATA = {16'h303a,	8'h3a};
48 :	LUT_DATA = {16'h363b,	8'h00};
49 :	LUT_DATA = {16'h3416,	8'h38};
50 :	LUT_DATA = {16'h3e08,	8'h23};
51 :	LUT_DATA = {16'h3c00,	8'h41};
52 :	LUT_DATA = {16'h303f,	8'h11};
53 :	LUT_DATA = {16'h3018,	8'h10};
54 :	LUT_DATA = {16'h3019,	8'h00};
55 :	LUT_DATA = {16'h3031,	8'h08};
56 :	LUT_DATA = {16'h3000,	8'h00};
57 :	LUT_DATA = {16'h3001,	8'h00};
58 :	LUT_DATA = {16'h302b,	8'h80};
59 :	LUT_DATA = {16'h3022,	8'h10};
60 :	LUT_DATA = {16'h3030,	8'h04};
61 :	LUT_DATA = {16'h3039,	8'h10};
62 :	LUT_DATA = {16'h303a,	8'h30};
63 :	LUT_DATA = {16'h303b,	8'h01};
64 :	LUT_DATA = {16'h303c,	8'h04};
65 :	LUT_DATA = {16'h3039,	8'h20};
66 :	LUT_DATA = {16'h303a,	8'h31};
67 :	LUT_DATA = {16'h303b,	8'h02};
68 :	LUT_DATA = {16'h3e01,	8'h08};
69 :	LUT_DATA = {16'h3620,	8'h43};
70 :	LUT_DATA = {16'h3621,	8'h18};
71 :	LUT_DATA = {16'h4501,	8'hc0};
72 :	LUT_DATA = {16'h4502,	8'h16};
73 :	LUT_DATA = {16'h3623,	8'h07};
74 :	LUT_DATA = {16'h5000,	8'h01};
75 :	LUT_DATA = {16'h3620,	8'h44};
76 :	LUT_DATA = {16'h3300,	8'h30};
77 :	LUT_DATA = {16'h3e01,	8'h04};
78 :	LUT_DATA = {16'h363b,	8'h80};
79 :	LUT_DATA = {16'h3664,	8'h0a};
80 :	LUT_DATA = {16'h3e08,	8'h23};
81 :	LUT_DATA = {16'h3416,	8'h00};
82 :	LUT_DATA = {16'h3633,	8'h20};
83 :	LUT_DATA = {16'h3633,	8'h23};
84 :	LUT_DATA = {16'h3211,	8'h0c};
85 :	LUT_DATA = {16'h3e0f,	8'h05};
86 :	LUT_DATA = {16'h363b,	8'h08};
87 :	LUT_DATA = {16'h3633,	8'h22};
88 :	LUT_DATA = {16'h3302,	8'h0c};
89 :	LUT_DATA = {16'h3383,	8'h0a};
90 :	LUT_DATA = {16'h3623,	8'h04};
91 :	LUT_DATA = {16'h3382,	8'h0f};
92 :	LUT_DATA = {16'h3e0f,	8'h04};
93 :	LUT_DATA = {16'h3e08,	8'h27};
94 :	LUT_DATA = {16'h3e08,	8'h23};
95 :	LUT_DATA = {16'h3664,	8'h05};
96 :	LUT_DATA = {16'h330b,	8'h68};
97 :	LUT_DATA = {16'h3638,	8'h84};
98 :	LUT_DATA = {16'h363b,	8'h00};
99 :	LUT_DATA = {16'h3632,	8'h54};
100:	LUT_DATA = {16'h3633,	8'h32};
101:	LUT_DATA = {16'h3416,	8'h0e};
102:	LUT_DATA = {16'h3664,	8'h0e};
103:	LUT_DATA = {16'h3663,	8'h88};
104:	LUT_DATA = {16'h330b,	8'h50};
105:	LUT_DATA = {16'h3622,	8'h06};
106:	LUT_DATA = {16'h3630,	8'hb3};
107:	LUT_DATA = {16'h3416,	8'h11};
108:	LUT_DATA = {16'h3e0e,	8'h00};
109:	LUT_DATA = {16'h3623,	8'h14};
110:	LUT_DATA = {16'h3518,	8'h00};
111:	LUT_DATA = {16'h3519,	8'hc0};
112:	LUT_DATA = {16'h5b00,	8'h02};
113:	LUT_DATA = {16'h5b01,	8'h03};
114:	LUT_DATA = {16'h5b02,	8'h01};
115:	LUT_DATA = {16'h5b03,	8'h01};
116:	LUT_DATA = {16'h3e03,	8'h00};
117:	LUT_DATA = {16'h330b,	8'h54};
118:	LUT_DATA = {16'h3632,	8'h74};
119:	LUT_DATA = {16'h3623,	8'h1b};
120:	LUT_DATA = {16'h3e03,	8'h0b};
121:	LUT_DATA = {16'h3e08,	8'h03};
122:	LUT_DATA = {16'h3e09,	8'h20};
123:	LUT_DATA = {16'h3e01,	8'h25};
124:	LUT_DATA = {16'h3e02,	8'h60};
125:	LUT_DATA = {16'h3630,	8'h73};
126:	LUT_DATA = {16'h3039,	8'h00};
127:	LUT_DATA = {16'h330b,	8'hf4};
128:	LUT_DATA = {16'h3633,	8'h12};
129:	LUT_DATA = {16'h3630,	8'h63};
130:	LUT_DATA = {16'h3664,	8'h0c};
131:	LUT_DATA = {16'h303a,	8'h22};
132:	LUT_DATA = {16'h3632,	8'h70};
133:	LUT_DATA = {16'h3633,	8'h02};
134:	LUT_DATA = {16'h330a,	8'h01};
135:	LUT_DATA = {16'h330b,	8'h5c};
136:	LUT_DATA = {16'h3038,	8'h44};
137:	LUT_DATA = {16'h3620,	8'h23};
138:	LUT_DATA = {16'h3635,	8'h44};
139:	LUT_DATA = {16'h3623,	8'h18};
140:	LUT_DATA = {16'h320c,	8'h03};
141:	LUT_DATA = {16'h320d,	8'h84};
142:	LUT_DATA = {16'h320e,	8'h02};
143:	LUT_DATA = {16'h320f,	8'h0d};
144:	LUT_DATA = {16'h3207,	8'h02};
145:	LUT_DATA = {16'h3213,	8'h04};
146:	LUT_DATA = {16'h3e01,	8'h20};
147:	LUT_DATA = {16'h3e02,	8'hb0};
148:	LUT_DATA = {16'h303a,	8'h2b};
149:	LUT_DATA = {16'h330a,	8'h01};
150:	LUT_DATA = {16'h330b,	8'h08};
151:	LUT_DATA = {16'h3306,	8'h70};
152:	LUT_DATA = {16'h335d,	8'h0a};
153:	LUT_DATA = {16'h3300,	8'h20};
154:	LUT_DATA = {16'h3348,	8'h03};
155:	LUT_DATA = {16'h3349,	8'h74};
156:	LUT_DATA = {16'h334a,	8'h02};
157:	LUT_DATA = {16'h334b,	8'ha0};
158:	LUT_DATA = {16'h3333,	8'h80};
159:	LUT_DATA = {16'h3334,	8'h30};
160:	LUT_DATA = {16'h3620,	8'h33};
161:	LUT_DATA = {16'h3632,	8'h74};
162:	LUT_DATA = {16'h3633,	8'h74};
163:	LUT_DATA = {16'h3630,	8'h63};
164:	LUT_DATA = {16'h3310,	8'h70};
165:	LUT_DATA = {16'h3319,	8'h68};
166:	LUT_DATA = {16'h3382,	8'h60};
167:	LUT_DATA = {16'h3384,	8'h64};
168:	LUT_DATA = {16'h3400,	8'h73};
169:	LUT_DATA = {16'h3664,	8'h0d};
170:	LUT_DATA = {16'h363a,	8'h34};
171:	LUT_DATA = {16'h363b,	8'h82};
172:	LUT_DATA = {16'h3035,	8'hd2};
173:	LUT_DATA = {16'h3664,	8'h07};
174:	LUT_DATA = {16'h3306,	8'h88};
175:	LUT_DATA = {16'h330b,	8'h5c};
176:	LUT_DATA = {16'h334b,	8'hf8};
177:	LUT_DATA = {16'h3400,	8'h53};
178:	LUT_DATA = {16'h3333,	8'h90};
179:	LUT_DATA = {16'h3e01,	8'h27};
180:	LUT_DATA = {16'h3e02,	8'h20};
181:	LUT_DATA = {16'h330e,	8'h1a};
182:	LUT_DATA = {16'h3039,	8'h23};
183:	LUT_DATA = {16'h303a,	8'h2f};
184:	LUT_DATA = {16'h303b,	8'h0d};
185:	LUT_DATA = {16'h3034,	8'h25};
186:	LUT_DATA = {16'h3035,	8'h2a};
187:	LUT_DATA = {16'h320c,	8'h02};
188:	LUT_DATA = {16'h320d,	8'hee};
189:	LUT_DATA = {16'h320e,	8'h01};
190:	LUT_DATA = {16'h320f,	8'ha9};
191:	LUT_DATA = {16'h3205,	8'h8b};
192:	LUT_DATA = {16'h3202,	8'h00};
193:	LUT_DATA = {16'h3203,	8'h38};
194:	LUT_DATA = {16'h3206,	8'h01};
195:	LUT_DATA = {16'h3207,	8'hcc};
196:	LUT_DATA = {16'h320a,	8'h03};
197:	LUT_DATA = {16'h320b,	8'h20};
198:	LUT_DATA = {16'h3f08,	8'h04};
199:	LUT_DATA = {16'h3348,	8'h02};
200:	LUT_DATA = {16'h3349,	8'hde};
201:	LUT_DATA = {16'h334a,	8'h01};
202:	LUT_DATA = {16'h334b,	8'hb0};
203:	LUT_DATA = {16'h330a,	8'h00};
204:	LUT_DATA = {16'h330b,	8'h6e};
205:	LUT_DATA = {16'h3306,	8'h28};
206:	LUT_DATA = {16'h3623,	8'h14};
207:	LUT_DATA = {16'h3620,	8'h32};
208:	LUT_DATA = {16'h3e01,	8'h1a};
209:	LUT_DATA = {16'h3e02,	8'h70};
210:	LUT_DATA = {16'h363b,	8'h00};
211:	LUT_DATA = {16'h3311,	8'h10};
212:	LUT_DATA = {16'h3310,	8'h70};
213:	LUT_DATA = {16'h3039,	8'h22};
214:	LUT_DATA = {16'h363a,	8'h24};
215:	LUT_DATA = {16'h3630,	8'h63};
216:	LUT_DATA = {16'h3639,	8'h74};
217:	LUT_DATA = {16'h3633,	8'h44};
218:	LUT_DATA = {16'h330b,	8'h5e};
219:	LUT_DATA = {16'h3039,	8'h50};
220:	LUT_DATA = {16'h303a,	8'h0d};
221:	LUT_DATA = {16'h3306,	8'h10};
222:	LUT_DATA = {16'h330b,	8'h34};
223:	LUT_DATA = {16'h334b,	8'h60};
224:	LUT_DATA = {16'h3e01,	8'h0f};
225:	LUT_DATA = {16'h3e02,	8'hf0};
226:	LUT_DATA = {16'h3633,	8'h72};
227:	LUT_DATA = {16'h3625,	8'h00};
228:	LUT_DATA = {16'h3638,	8'h83};
229:	LUT_DATA = {16'h3518,	8'h07};
230:	LUT_DATA = {16'h3519,	8'hc8};
231:	LUT_DATA = {16'h3e0f,	8'h14};
232:	LUT_DATA = {16'h330b,	8'h3a};
233:	LUT_DATA = {16'h3416,	8'h31};
234:	LUT_DATA = {16'h3018,	8'h70};
235:	LUT_DATA = {16'h303b,	8'h01};
236:	LUT_DATA = {16'h320d,	8'hf6};
237:	LUT_DATA = {16'h320c,	8'h02};
238:	LUT_DATA = {16'h330b,	8'hec};
239:	LUT_DATA = {16'h3306,	8'h48};
240:	LUT_DATA = {16'h3349,	8'hee};
241:	LUT_DATA = {16'h334a,	8'h02};
242:	LUT_DATA = {16'h334b,	8'h48};
243:	LUT_DATA = {16'h320c,	8'h02};
244:	LUT_DATA = {16'h320d,	8'hf4};
245:	LUT_DATA = {16'h320e,	8'h02};
246:	LUT_DATA = {16'h320f,	8'h17};
247:	LUT_DATA = {16'h3205,	8'h8b};
248:	LUT_DATA = {16'h3202,	8'h00};
249:	LUT_DATA = {16'h3203,	8'h00};
250:	LUT_DATA = {16'h3206,	8'h02};
251:	LUT_DATA = {16'h3207,	8'h04};
252:	LUT_DATA = {16'h320a,	8'h04};
253:	LUT_DATA = {16'h320b,	8'h00};
254:	LUT_DATA = {16'h3034,	8'h01};
255:	LUT_DATA = {16'h3035,	8'hd2};
256:	LUT_DATA = {16'h303a,	8'h10};
257:	LUT_DATA = {16'h3e01,	8'h21};
258:	LUT_DATA = {16'h3e02,	8'h50};
259:	LUT_DATA = {16'h3308,	8'h50};
260:	LUT_DATA = {16'h3380,	8'hff};
261:	LUT_DATA = {16'h334b,	8'hb0};
262:	LUT_DATA = {16'h3310,	8'hf0};
263:	LUT_DATA = {16'h3319,	8'he8};
264:	LUT_DATA = {16'h3384,	8'he4};
265:	LUT_DATA = {16'h3382,	8'he0};
266:	LUT_DATA = {16'h3633,	8'h62};
267:	LUT_DATA = {16'h3039,	8'h54};
268:	LUT_DATA = {16'h303a,	8'h1f};
269:	LUT_DATA = {16'h3034,	8'h25};
270:	LUT_DATA = {16'h3035,	8'h2a};
271:	LUT_DATA = {16'h320c,	8'h03};
272:	LUT_DATA = {16'h320d,	8'h10};
273:	LUT_DATA = {16'h320e,	8'h02};
274:	LUT_DATA = {16'h320f,	8'h0e};
275:	LUT_DATA = {16'h3624,	8'h20};
276:	LUT_DATA = {16'h3e01,	8'h20};
277:	LUT_DATA = {16'h334b,	8'he8};
278:	LUT_DATA = {16'h330a,	8'h01};
279:	LUT_DATA = {16'h330b,	8'h20};
280:	LUT_DATA = {16'h3638,	8'h82};
281:	LUT_DATA = {16'h335d,	8'h00};
282:	LUT_DATA = {16'h3621,	8'h08};
283:	LUT_DATA = {16'h3620,	8'h23};
284:	LUT_DATA = {16'h3627,	8'h01};
285:	LUT_DATA = {16'h3018,	8'h30};
286:	LUT_DATA = {16'h303b,	8'h05};
287:	LUT_DATA = {16'h3034,	8'h01};
288:	LUT_DATA = {16'h3035,	8'hd2};
289:	LUT_DATA = {16'h3039,	8'h14};
290:	LUT_DATA = {16'h303a,	8'h37};
291:	LUT_DATA = {16'h330a,	8'h00};
292:	LUT_DATA = {16'h330b,	8'h70};
293:	LUT_DATA = {16'h320c,	8'h03};
294:	LUT_DATA = {16'h320d,	8'h00};
295:	LUT_DATA = {16'h3e01,	8'h1a};
296:	LUT_DATA = {16'h3e02,	8'h00};
297:	LUT_DATA = {16'h3624,	8'h40};
298:	LUT_DATA = {16'h320c,	8'h03};
299:	LUT_DATA = {16'h320d,	8'h20};
300:	LUT_DATA = {16'h320e,	8'h02};
301:	LUT_DATA = {16'h320f,	8'h58};
302:	LUT_DATA = {16'h3039,	8'h53};
303:	LUT_DATA = {16'h303a,	8'h2d};
304:	LUT_DATA = {16'h330b,	8'h80};
305:	LUT_DATA = {16'h3633,	8'h63};
306:	LUT_DATA = {16'h3658,	8'h9a};
307:	LUT_DATA = {16'h3626,	8'h00};
308:	LUT_DATA = {16'h3621,	8'h0a};
309:	LUT_DATA = {16'h320c,	8'h02};
310:	LUT_DATA = {16'h320d,	8'hf8};
311:	LUT_DATA = {16'h320e,	8'h02};
312:	LUT_DATA = {16'h320f,	8'h0e};
313:	LUT_DATA = {16'h3018,	8'h70};
314:	LUT_DATA = {16'h303c,	8'h14};
315:	LUT_DATA = {16'h4837,	8'h53};
316:	LUT_DATA = {16'h3f09,	8'h98};
317:	LUT_DATA = {16'h363a,	8'h64};
318:	LUT_DATA = {16'h3630,	8'h73};
319:	LUT_DATA = {16'h0100,	8'h01};

        

		default:LUT_DATA    =   {16'h0000, 8'h00};
    endcase
end

endmodule
