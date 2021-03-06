
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

	input lvds_in, //входная линия LVDS
	output lvds_out,//выходная линия LVDS
	
	/// Пины для SPI ///
	
	input SPI_SS,
	input SPI_SCK,
	input SPI_DIN,
	output SPI_DOUT,
	
	/// GPIO_1 ///
	
	inout				 [35:0]		GPIO_1
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire cout_i, clk_in;
reg cout_b, sclr_b = 0, aclr_i = 0, led_out = 0;


// передача измеряемой частоты на выход LVDS и приём её на вход LVDS

assign lvds_out = clk_0_5;
assign clk_in = lvds_in;

//отладочные линии для подключения к PLL

wire clk_0_0, clk_0_1, clk_0_2, clk_0_3, clk_0_4, clk_0_5, clk_0_6, clk_0_7, clk_0_8;
wire clk_1_0, clk_1_1, clk_1_2, clk_1_3, clk_1_4, clk_1_5, clk_1_6, clk_1_7, clk_1_8;
wire clk_2_0, clk_2_1;

//Вариант переключения между входными частотами от PLL посредством свитчей (SW)

//assign clk_base = SW[0] ? clk_1_0 : clk_0_0;
//assign clk_out = SW[0] ? (SW[1] ? (SW[2] ? (SW[3] ? clk_1_8 : clk_1_7) : (SW[3] ? clk_1_6 : clk_1_5)) : (SW[2] ? (SW[3] ? clk_1_4 : clk_1_3) : (SW[3] ? clk_1_2 : clk_1_1))) : 
								//(SW[1] ? (SW[2] ? (SW[3] ? clk_0_8 : clk_0_7) : (SW[3] ? clk_0_6 : clk_0_5)) : (SW[2] ? (SW[3] ? clk_0_4 : clk_0_3) : (SW[3] ? clk_0_2 : clk_0_1)));

//Регистр, содержащий значение опорной частоты
								
reg [31:0] freq_base;//MHz

logic [31:0] time_del;

//=======================================================
//  Structural coding
//=======================================================

// переключения между двумя вариантами опорной частоты (только значений, переключение сигналов не реализовано)
assign freq_base = SW[0] ? 31'd50_000_000 : 31'd200_000_000;

assign time_del = SW[3:1];// + 1'b1;

// возможный вариант реализации переключения значений

/*always @(posedge CLOCK_50)
begin
	
	if (SW[0] == 0) freq_base = 31'd200_000_000;
	else freq_base = 31'd50_000_000;
	
end*/

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
	.clk_in(clk_in),
	.freq_base(freq_base),
	.time_del(time_del),
	.freq_mem(freq_mem), //определение перед модулем SPI
	.cout_i(cout_i),
	.cout_b(cout_b)
	
);

// мигание светодиода по сигналу cout_b

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
assign LEDR[1] = ~SPI_SS;
assign LEDR[2] = SPI_SCK;

//Подключение модуля SPI (модуль разработан не мной, там комментариев нет)
 spi_slave spi
(
	
	.rstb(rstb),	//Сброс SPI
	.ten(1'b1),		//Разрешение передачи
	.tdata(tdata),	//Регистр для передачи данных
	.mlb(1'b1),		//С какого бита начинается передача по SPI
	.ss(SPI_SS),			//slave select
	.sck(SPI_SCK),		//SPI clk
	.sdin(SPI_DIN),	//data in
	.sdout(SPI_DOUT),	//data out
	.done(done),	//сигнал завершения передачи одного байта
	
);

// несколько перепробованных вариантов подключения LVDS, которые не заработали или не понадобились

/*LVDS_BUF_IN lvds_in
(
	
	.datain(lvds_in_p),
	.datain_b(lvds_in_n),
	.dataout(clk_in)
	
);

LVDS_BUF_OUT lvds_out
(
	
	.datain(clk_0_2),
	.dataout_b(lvds_out_n),
	.dataout(lvds_out_p)
	
);*/

/*wire clk_in_temp;

LVDS_RX lvdsrx
(
	
	.rx_in(clk_in_temp),
	.rx_out(clk_in)
	
);*/

/*OCT oct1
(
	
	rzqin(GPIO[15])
	
);*/
endmodule
