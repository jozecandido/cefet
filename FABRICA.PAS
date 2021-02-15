
{licia num 33 A2}
program fabrica;
uses graph,crt;
const esc=(#27);
var frase:string;
    pont:pointer;
    x,y,MAXX,MAXY,tecla:integer;
    opcao:char;
{*************************************************************************}
procedure inicia_grafico;
var
 drivegrafico:integer;
 modografico:integer;
 codigoerro:integer;
begin
 drivegrafico:=detect;
 initgraph(drivegrafico,modografico,'c:\bp\bgi');
 codigoerro:=graphresult;
  if codigoerro<>grok
  then begin
        writeln('Erro grafico:',grapherrormsg(codigoerro));
        halt(1);
        end;
end;
{***********************DESENHADO OS CILINDROS DA ESTEIRA*******************}
 procedure cilindros;
begin
 circle(150,345,5);
 setfillstyle(9,yellow);floodfill(151,346,white);
 circle(210,345,5);
 setfillstyle(9,yellow);floodfill(211,346,white);
 circle(270,345,5);
 setfillstyle(9,yellow);floodfill(271,346,white);
 circle(330,345,5);
 setfillstyle(9,yellow);floodfill(331,346,white);
 circle(390,345,5);
 setfillstyle(9,yellow);floodfill(391,346,white);
 circle(450,345,5);
 setfillstyle(9,yellow);floodfill(451,346,white);
 circle(495,345,5);
 setfillstyle(9,yellow);floodfill(496,346,white);
 circle(575,345,5);
 setfillstyle(9,yellow);floodfill(576,346,white);
 {****************************}
 rectangle(501,410,600,465);
 setfillstyle(1,8);floodfill(502,411,white);
end;


{********************DESENHANDO A MAQUINA******************************}
procedure maquina;
begin
 rectangle(130,350,500,430); {esteira}
 setfillstyle(solidfill,lightgray);floodfill(131,351,white);
  settextstyle(2,0,0);
  outtextxy(150,360,'L- PARA LIGAR');
  outtextxy(150,375,'D- PARA DESLIGAR');
  rectangle(130,340,500,350);
 setfillstyle(solidfill,brown);floodfill(131,341,white);
 line(500,350,500,400);
 line(580,350,580,400);
 line(500,400,580,400);
 line(500,350,580,350);
{ setfillstyle(solidfill,lightgray);floodfill(501,351,white);}
 line(500,340,580,340);
 line(500,350,580,350);
 line(580,340,580,350);
 line(500,340,500,350);
 {setfillstyle(solidfill,brown);floodfill(501,341,white);

 {**************************************************}
 rectangle(20,50,130,430); {cpu}
 setfillstyle(solidfill,lightgray);floodfill(21,51,white);
 line(20,300,130,300);
 line(55,300,55,430);
 {*******************************}
 rectangle(130,50,500,70); {la de cima}
 setfillstyle(solidfill,lightgray);floodfill(131,51,white);
end;

{**********************desenhando os botoes*****************************}
procedure botoes;
begin
 rectangle(100,310,110,320);
 setfillstyle(solidfill,4);floodfill(101,311,white);
 rectangle(80,310,90,320);
 setfillstyle(solidfill,blue);floodfill(81,311,white);
 rectangle(60,310,70,320);
 setfillstyle(solidfill,10);floodfill(61,311,white);
 rectangle(100,330,110,340);
 setfillstyle(solidfill,yellow);floodfill(101,331,white);
 rectangle(80,330,90,340);
 setfillstyle(solidfill,5);floodfill(81,331,white);
 rectangle(60,330,70,340);
 circle(40,310,4);
 setfillstyle(solidfill,12);floodfill(41,311,white);
 circle(40,325,4);
 setfillstyle(solidfill,2);floodfill(41,326,white);
 circle(40,340,4);
 setfillstyle(solidfill,16);floodfill(41,341,white);
 circle(40,355,4);
 setfillstyle(solidfill,red);floodfill(41,356,white);
 rectangle(30,200,115,270);{este e o grafico}
 setfillstyle(7,blue);floodfill(61,201,white);

 {*****************************************************************}
 rectangle(135,360,145,370);
 setfillstyle(1,green);floodfill(136,361,white);
 rectangle(135,375,145,385);
 setfillstyle(1,red);floodfill(136,376,white);
 {rectangle(135,390,145,400);
 setfillstyle(}

 end;

 {****************DESENHANDO AS RODAS DO CARRO**************************}
procedure rodas(x,y:integer);
begin
  x:=60;
  y:=240;
  setcolor(15);
  sector(x,y,0,360,7,7);
  sector(x+30,y,0,360,7,7);

end;

{*****************PROCEDIMENTO PARA MOVER AS RODAS**************************}
procedure move_rodas(x,y:integer);
begin
 setcolor(15);
 setfillstyle(1,magenta);
 sector(x,y,0,360,7,7);
 sector(x+30,y,0,360,7,7);
 delay(10);
 setfillstyle(1,cyan);
 bar(x-10,y-10,x+30,y+7);
 setcolor(15);
 setfillstyle(1,magenta);
 sector(x,y,0,360,7,7);
 sector(x+30,y,0,360,7,7);

end;
{******************DESENHANDO O CARRINHO**********************************}
procedure carrinho(x,y:integer);
 begin
  y:=330;
  setcolor(15);
  setfillstyle(1,magenta);
  sector(x,y,0,360,7,7);
  sector(x+30,y,0,360,7,7);
  line(x-8,y,x-18,y); {tras do carro de baixo}
  line(x+38,y,x+48,y);{frente do carro de baixo}
  line(x+8,y,x+22,y);{entre as rodas}               {y=330}
  line(x-18,y,x-18,y-10); {tras vertical}
  line(x+49,y,x+49,y-10); {frente vertical}
  line(x+49,y-10,x+39,y-10);{frente de cima}
  line(x-8,y-10,x-18,y-10);{tras de cima}
  line(x-8,y-10,x-1,y-20);{lateral da bunda}
  line(x+39,y-10,x+32,y-20);
  line(x-1,y-20,x+32,y-20);
  setfillstyle(1,blue);floodfill(x+40,y-9,white);

  {***********************MOVENDO-O************************************}
  delay(10);
  setfillstyle(1,cyan);
  bar(x-20,y-29,x+50,y+7);
  setcolor(15);
  setfillstyle(1,magenta);
  sector(x,y,0,360,7,7);
  sector(x+30,y,0,360,7,7);
  line(x-8,y,x-18,y);
  line(x+38,y,x+48,y);
  line(x+8,y,x+22,y);
  line(x-18,y,x-18,y-10);
  line(x+49,y,x+49,y-10);
  line(x+49,y-10,x+39,y-10);
  line(x-8,y-10,x-18,y-10);
  line(x-8,y-10,x-1,y-20);
  line(x+39,y-10,x+32,y-20);
  line(x-1,y-20,x+32,y-20);
  setfillstyle(1,blue);floodfill(x+40,y-9,white);

 end;

{***********procedimento para desenhar um carro no grafico****************}
procedure grafico_carro(x,y:integer);
begin
   x:=60;
   y:=240;
  setcolor(15);
  sector(x,y,0,360,7,7);
  sector(x+30,y,0,360,7,7);
  line(x-8,y,x-18,y); {tras do carro de baixo}
  line(x+38,y,x+48,y);{frente do carro de baixo}
  line(x+8,y,x+22,y);{entre as rodas}               {y=330}
  line(x-18,y,x-18,y-10); {tras vertical}
  line(x+49,y,x+49,y-10); {frente vertical}
  line(x+49,y-10,x+39,y-10);{frente de cima}
  line(x-8,y-10,x-18,y-10);{tras de cima}
  line(x-8,y-10,x-1,y-20);{lateral de tras}
  line(x+39,y-10,x+32,y-20);
  line(x-1,y-20,x+32,y-20);
  {setfillstyle(1,blue);floodfill(x+40,y-9,white); }
end;
{**************PROCEDIMENTO PARA DESENHAR A CAIXA**********************}
procedure caixa(x,y:integer);
 begin
    y:=330;
    rectangle(x-27,y-30,x+38,y+6);
     setfillstyle(1,12);floodfill(x-26,y-29,white);
{*******************move-la***************************************}
    DELAY(20);
    setfillstyle(1,cyan);
     bar(x-50,y-40,x+40,y+8);
   setcolor(15);
   rectangle(x-27,y-30,x+38,y+6);
    setfillstyle(1,12);floodfill(x-26,y-29,white);

 end;
{***********************************************************************}
procedure caixa1(x,y:integer);
 begin
   x:=530;

    rectangle(x-27,y-30,x+38,y+5);
     setfillstyle(1,12);floodfill(x-26,y-29,white);
     rectangle(500,350,580,400);
     rectangle(500,340,580,350);
{*******************move-la***************************************}
    DELAY(20);
    setfillstyle(1,cyan);
     bar(x-28,y-40,x+40,y+5);

 end;

 {*****************procedimento para desenhar a caixa no grafico************}
 procedure caixa_grafico;
 begin
 rectangle(45,220,100,250);
  end;
  {**********************************************}


{*******************DESENHANDO AS GARRAS*******************************}
procedure garra1;
 begin
 {garra 1}
 line(170,70,170,250);
 line(180,70,180,250);
 line(180,250,190,290);
 line(170,250,160,290);
 line(160,290,190,290);
 setfillstyle(solidfill,lightgray);floodfill(171,251,white);
{garra 2}
 line(300,70,300,250);
 line(310,70,310,250);
 line(310,250,340,300);
 line(300,250,270,300);
 line(270,300,340,300);
 setfillstyle(solidfill,lightgray);floodfill(301,251,white);
 {garra 3}
 line(440,70,440,220);
 line(450,70,450,220);
 line(410,220,440,220);
 line(450,220,500,220);
 line(410,220,410,270);
 line(500,220,500,270);
 line(410,270,500,270);
 setfillstyle(solidfill,lightgray);floodfill(441,221,white);

end;
{*******************MOVIMENTANDO AS GARRAS********************************}
procedure move_garra;
begin
  rectangle(135,360,145,370);
  setfillstyle(1,10);floodfill(136,361,white);
{************************movimentando o garra 1**************************}
 delay(2000);
  line(170,70,170,250);
 line(180,70,180,250);  {garra la em cima}
 line(180,250,190,290);
 line(170,250,160,290);
 line(160,290,190,290);
 setfillstyle(solidfill,lightgray);floodfill(171,251,white);
{***************************}
 setfillstyle(1,cyan);   {apaga a garra de cima}
 bar(160,71,190,290);
 {{************************}
 line(170,70,170,300);      {garra la em baixo}
 line(180,70,180,300);
 line(180,300,190,337);
 line(170,300,160,337);
 line(160,337,190,337);
 setfillstyle(solidfill,lightgray);floodfill(171,301,white);
 delay(2000);
 sound(900);
 delay(1000);
 nosound;

 {***********************************}
 setfillstyle(1,cyan);   {apaga a garra de baixo}
  bar(160,71,190,337);
  {**************************************}
  delay(20);
  line(170,70,170,250);
 line(180,70,180,250);
 line(180,250,190,290);
 line(170,250,160,290);     {garra la em cima}
 line(160,290,190,290);
 setfillstyle(solidfill,lightgray);floodfill(171,251,white);
  rodas(x,y);
  y:=330;
  for x:=170 to 290 do

 move_rodas(x,y);
 line(170,70,170,250);
 line(180,70,180,250);    {garra la em cima}
 line(180,250,190,290);
 line(170,250,160,290);
 line(160,290,190,290);
 setfillstyle(solidfill,lightgray);floodfill(171,251,white);
 move_rodas(x,y);

{*******************movimentando o garra 2*********************************}
 delay(2000);
 line(300,70,300,250);
 line(310,70,310,250);
 line(310,250,340,300);      {garra la em cima}
 line(300,250,270,300);
 line(270,300,340,300);
 setfillstyle(solidfill,lightgray);floodfill(301,251,white);

{***************************}
 setfillstyle(1,cyan);  {apaga a garra de cima}
 bar(270,71,340,300);
 {****************************************}
 setfillstyle(1,lightgray);  {estes retangulos apagarao as rodas}
 bar(282,327,290,337);
 setfillstyle(1,lightgray);
 bar(290,327,325,337);
 setfillstyle(1,lightgray);
 bar(287,320,323,327);
 {*********************************************}
 line(300,70,300,300); {garra la em baixo}
 line(310,70,310,300);
 line(310,300,330,337);
 line(300,300,280,337);
 line(280,337,330,337);
 setfillstyle(solidfill,lightgray);floodfill(301,301,white);
 setfillstyle(1,lightgray);
 bar(280,337,288,337);
 sound(600);
 delay(1000);
 nosound;
 {********************************}
 setfillstyle(1,cyan);   {apaga a garra de cima}
 bar(280,71,330,337);

 {*******************************}
 line(300,70,300,250);
 line(310,70,310,250);
 line(310,250,340,300);      {garra la em cima}
 line(300,250,270,300);
 line(270,300,340,300);
 setfillstyle(solidfill,lightgray);floodfill(301,251,white);
 grafico_carro(x,y);

 for x:=300 to 450 do

 carrinho(x,y);
 line(300,70,300,250);
 line(310,70,310,250);
 line(310,250,340,300);
 line(300,250,270,300);
 line(270,300,340,300);
 setfillstyle(solidfill,lightgray);floodfill(301,251,white);


 carrinho(x,y);
{ sound(700);
 delay(500);
 sound(800);
 delay(500);
 sound(700);
 delay(500);
 sound(1000);
 delay(500);
 sound(900);
 delay(500);
 nosound;
{este retangulo apagara o carro do grafico}
 {setfillstyle(7,blue);
 bar(30,200,115,270); }



 {*******************movimentando o garra 3****************************}
  delay(2000);
  line(440,70,440,220);    {garra la em cima}
  line(450,70,450,220);
  line(410,220,440,220);
  line(450,220,500,220);
  line(410,220,410,270);
  line(500,220,500,270);
  line(410,270,500,270);
  setfillstyle(solidfill,lightgray);floodfill(441,221,white);

 {****************************************************************}

 setfillstyle(1,cyan);  {este bar apaga a garra la de cima}
 bar(410,71,500,270);
{************************************************************}
 line(440,70,440,280);
 line(450,70,450,280);      {garra la em baixo}
 line(410,280,440,280);
 line(450,280,500,280);
 line(410,280,410,337);
 line(500,280,500,337);
 line(410,337,500,337);
 setfillstyle(1,lightgray);floodfill(441,281,white);
 setfillstyle(1,lightgray);
 bar(410,280,500,337);
 sound(1300);
 delay(1000);
 nosound;
  setfillstyle(7,blue);
  bar(30,200,115,270);
 {***************************************************}
 setfillstyle(1,cyan); {apaga a garra de baixo}
 bar(410,71,500,337);
 {****************************************************************}

  line(440,70,440,220);
  line(450,70,450,220);
  line(410,220,440,220);
  line(450,220,500,220);
  line(410,220,410,270);    {garra la em cima}
  line(500,220,500,270);
  line(410,270,500,270);
  setfillstyle(solidfill,lightgray);floodfill(441,221,white);
  setfillstyle(1,cyan);
  caixa_grafico;
    for x:=490 to 530 do
     caixa(x,y);
    for y:=330 to 450 do
     caixa1(x,y);
     setfillstyle(1,8);
     bar(500,410,600,465);
      {apaga a caixa do grafico}
        setfillstyle(7,blue);
        bar(30,200,115,270);

    {***************************}
     maquina;
    cilindros;
end;
{*************************************************************************}
procedure inicializacao;
  var raio:integer;
  begin
  maxx:=getmaxx;
  maxy:=getmaxy;
  cleardevice;
  setbkcolor(0);
  RAIO:=0;
  setcolor(12);
  repeat
  delay(2);
  raio:=raio+1;
  circle(maxx div 2,maxy div 2,raio);
  setcolor(12);
  until raio=400;
  setcolor(4);
  settextstyle(7,0,0);
  outtextxy(120,200,'FABRICA DE BRINQUEDO');
  DELAY(3000);
 END;
{**************************************************************}
procedure finalizacao;
  var raio:integer;
  begin
  maxx:=getmaxx;
  maxy:=getmaxy;
  cleardevice;
  setbkcolor(0);
  RAIO:=0;
  setcolor(9);
  repeat
  delay(2);
  raio:=raio+1;
  circle(maxx div 2,maxy div 2,raio);
  setcolor(9);
  until raio=400;
  setcolor(4);
  settextstyle(7,0,0);
  outtextxy(145,200,'FIM DO PROGRAMA');

{  sound(700);
    delay(300);
  sound(600);
    delay(200);
  sound(500);
    delay(200);
  sound(800);
    delay(300);
  sound(900);
    delay(300);
    {**********}
 { sound(700);
   delay(300);
  sound(600);
   delay(200);
  sound(500);
   delay(200);
  sound(700);
   delay(300);
  sound(600);
  delay(300);
  {***********}
  { sound(700);
    delay(500);
  sound(600);
    delay(300);
  sound(500);
    delay(300);
  sound(800);
    delay(500);
  sound(900);
    delay(500);
  sound(1000);
  delay(500);
  sound(900);
  delay(500);
  sound(1200);
  delay(500);
  sound(700);
  delay(300);
  sound(600);
  delay(300);
  sound(500);
  delay(300);
  sound(700);
  delay(300);
  sound(600);
  delay(300);

  nosound;}

  end;



{*********************PROGRAMA PRINCIPAL************************************}
begin
 inicia_grafico;
  inicializacao;
  CLEARDEVICE;
 {***************************}
  Setcolor(red);
  settextstyle(4,0,0);
  frase:='FABRICA DE CARRINHO ';
  outtextxy(145,15,frase);
  {*****************************}
  setcolor(white);
  setbkcolor(cyan);
  maquina;
  cilindros;
  botoes;
  garra1;
    opcao:=(readkey);
    repeat
      if(opcao='l') or (opcao='L')
        then move_garra;

      if(opcao='d') or(opcao='D')
        then break;


   until keypressed;


 readkey;
 cleardevice;
 finalizacao;
 readkey;
 closegraph;
end.
