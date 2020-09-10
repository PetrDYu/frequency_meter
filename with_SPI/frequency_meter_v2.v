
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module frequency_meter_v2(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	inout 		    [35:0]		GPIO,
	
	inout				 [35:0]		GPIO_1
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire cout_i;
reg cout_b, sclr_b = 0, aclr_i = 0, led_out = 0;

//отладочные линии для подключения к PLL

wire clk_0_0, clk_0_1, clk_0_2, clk_0_3, clk_0_4, clk_0_5, clk_0_6, clk_0_7, clk_0_8;
wire clk_1_0, clk_1_1, clk_1_2, clk_1_3, clk_1_4, clk_1_5, clk_1_6, clk_1_7, clk_1_8;
wire clk_2_0, clk_2_1;

//Вариант переключения между входными частотами от PLL посредством свитчей (SW)

//assign clk_base = SW[0] ? clk_1_0 : clk_0_0;
//assign clk_in = SW[0] ? (SW[1] ? (SW[2] ? (SW[3] ? clk_1_8 : clk_1_7) : (SW[3] ? clk_1_6 : clk_1_5)) : (SW[2] ? (SW[3] ? clk_1_4 : clk_1_3) : (SW[3] ? clk_1_2 : clk_1_1))) : 
								//(SW[1] ? (SW[2] ? (SW[3] ? clk_0_8 : clk_0_7) : (SW[3] ? clk_0_6 : clk_0_5)) : (SW[2] ? (SW[3] ? clk_0_4 : clk_0_3) : (SW[3] ? clk_0_2 : clk_0_1)));

//Параметр, дублирующий значение в модуле freq_m_module для вывода его на 7-сегментные индикаторы
								
parameter freq_base = 31'd200_000_000;//MHz

//=======================================================
//  Structural coding
//=======================================================

//Вывод значения опорной частоты на 7-сегментные индикаторы (без 3х младших разрядов)

SEG_HEX u0
(
	
	.iDIG(freq_base /31'd1000 % 31'd10),
	.oHEX_D(HEX0),
	.lock(CLOCK_50)
	
);

SEG_HEX u1
(
	
	.iDIG(freq_base /31'd10_000 % 31'd10),
	.oHEX_D(HEX1),
	.lock(CLOCK_50)
	
);

SEG_HEX u2
(
	
	.iDIG(freq_base /31'd100_000 % 31'd10),
	.oHEX_D(HEX2),
	.lock(CLOCK_50)
	
);

SEG_HEX u3
(
	
	.iDIG(freq_base /31'd1_000_000 % 31'd10),
	.oHEX_D(HEX3),
	.lock(CLOCK_50)
	
);

SEG_HEX u4
(
	
	.iDIG(freq_base /31'd10_000_000 % 31'd10),
	.oHEX_D(HEX4),
	.lock(CLOCK_50)
	
);

SEG_HEX u5
(
	
	.iDIG(freq_base / 31'd100_000_000),
	.oHEX_D(HEX5),
	.lock(CLOCK_50)
	
);

//Вариант переключения опорных частот кнопками, в случае, если freq_base определить как регистр (в таком случае не работало)

/*always @(negedge KEY[1] or negedge KEY[2])
begin
	
	if (KEY[1] == 1'b0) freq_base = 31'd700_000_000;
	if (KEY[2] == 1'b0) freq_base = 31'd200_000_000;
	
end*/

//Все PLL используются только для отладки и демонстрации возможностей частотомера

PLL_temp pll_0
(
	
	.refclk(CLOCK_50),
	.rst(~KEY[0]),
	.outclk_0(clk_0_0),//700 МГц, но на Cyclone V корректно не работает 
	.outclk_1(clk_0_1),//100 МГц
	.outclk_2(clk_0_2),//200 МГц
	.outclk_3(clk_0_3),//233_333_333 Гц
	.outclk_4(clk_0_4),//280 МГц
	.outclk_5(clk_0_5),//350 МГц
	.outclk_6(clk_0_6),//466_666_666 Гц
	.outclk_7(clk_0_7),//25 МГц
	.outclk_8(clk_0_8),//5 МГц
	
);

PLL_temp_1 pll_1
(
	
	.refclk(CLOCK_50),
	.rst(~KEY[0]),
	.outclk_0(clk_1_0),//200 МГц
	.outclk_1(clk_1_1),//100 МГц
	.outclk_2(clk_1_2),//150 МГц
	.outclk_3(clk_1_3),//171_428_571 Гц
	.outclk_4(clk_1_4),//133_333_333 Гц
	.outclk_5(clk_1_5),//109_090_909 Гц
	.outclk_6(clk_1_6),//75 МГц
	.outclk_7(clk_1_7),//30 МГц
	.outclk_8(clk_1_8),//5 МГц
	
);

PLL_acur1 pll_2
(
	
	.refclk(CLOCK_50),
	.rst(~KEY[0]),
	.outclk_0(clk_2_0)//100_396_825 Гц
	
);

PLL_accur pll_3
(
	
	.refclk(clk_2_0),
	.rst(~KEY[0]),
	.outclk_0(clk_2_1)//99_998_424 Гц
	
);

//Подключение модуля частотомера, все пояснения внутри модуля

freq_m_module freq_meter
(
	
	.clk_base(clk_1_0),
	.clk_in(clk_0_5),
	.freq_mem(freq_mem),
	.cout_i(cout_i),
	.cout_b(cout_b)
	
);

always @(posedge cout_b)
begin
	
	led_out = led_out + 1'b1;
	
end

assign LEDR[0] = led_out;

// SPI

reg rstb, aset;
/*rstb - сигнал reset SPI
  aset - сигнал асинхронного сброса счётчика байтов для SPI*/

wire done;//сигнал завершения отправки очередного байта по SPI
reg [7:0] tdata = 8'b0;//регистр, содержащий данный, отправляемые по SPI

wire [3:0] i; //номер отправленного байта (изменяется от 0 до 3), необходим для побайтной отправки 32-битного числа
reg [31:0] freq_mem; //регистр-хранилище для данных об измеряемой частоте

wire ss, sck, sdin, sdout; //линии SPI

//подключение соответствующих линий SPI 
assign ss = GPIO[3];
assign sck = GPIO[1];
assign sdin = GPIO[5];
assign GPIO[7] = sdout;

//выключение SPI до момента первого рассчитанного значения частоты
initial
begin

	rstb = 1'b0;
	aset = 1'b1;	
end

//Включение SPI, когда появилось первое значение частоты
always @(posedge cout_b)
begin
	
	aset = 1'b0;
	rstb = 1'b1;
	
end

//Передача на SPI поочерёдно 4 байт значения частоты
always @(posedge done)
begin

	case (i)
		0: tdata = freq_mem[7 : 0];
		1: tdata = freq_mem[15 : 8];
		2: tdata = freq_mem[23 : 16];
		3: tdata = freq_mem[31 : 24];
	endcase
	
end

//Счётчик номера байта
Counter_4 count_n_freq
 (
	
	.clock(done),
	.q(i),
	.aset(aset)
	
 );

//Отладочные светодиоды, отражающие правильное подключение линий SPI (загораются в момент передачи данных)
assign LEDR[1] = ~GPIO[3];
assign LEDR[2] = GPIO[1];

//Подключение модуля SPI (модуль разработан не мной, там комментариев нет)
 spi_slave spi
(
	
	.rstb(rstb),	//Сброс SPI
	.ten(1'b1),		//Разрешение передачи
	.tdata(tdata),	//Регистр для передачи данных
	.mlb(1'b1),		//С какого бита начинается передача по SPI
	.ss(ss),			//slave select
	.sck(sck),		//SPI clk
	.sdin(sdin),	//data in
	.sdout(sdout),	//data out
	.done(done),	//сигнал завершения передачи одного байта
	
);

endmodule
