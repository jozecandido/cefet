{fabiana n§16, }

program fazer_de_conta;
uses crt, graph;

var maxX,maxY,MODO,x,y,cont:integer;
    frase,s:string;
    tamanho:word;
    tecla:char;
{_______procedure inicia grafico____________________}
procedure inicia_grafico;
var  drivegrafico,modografico,codigoerro:integer;

begin
    drivegrafico:=detect;
    initgraph(drivegrafico,modografico,'c:\BP\BGI');
    codigoerro:=graphResult;
    if codigoerro<>grOK
      then begin
           writeln('Erro Grafico:',grapherrorMsg(codigoerro));
           halt(1);
           end;
   maxX:=getmaxx;
   maxY:=getmaxy;
   setBkcolor(white);
   setcolor(white);
   cleardevice;
end;

{__CONSTROI O ELEMENTO(televisao)___________________}
procedure constroi_tv(x1,y1,x2,y2:integer);

begin
    setcolor(red);

    rectangle(x1,y1,x2,y2);  {corpo da tv}
    setfillstyle(1,13);
    floodfill(x1+1,y1+1,4);

   rectangle(x1+5,y1+5,x2-15,y2-5); {tela da tv}
   setfillstyle(1,8);
   floodfill(x1+5+1,y1+5+1,4);

  rectangle(x1+35,y1+5,x2-5,y2-30);  {botao da tv} {de cima}
   setfillstyle(1,8);
   floodfill(x1+35+1,y1+5+1,4);

  rectangle(x1+35,y1+15,x2-5,y2-20);  {botao da tv} {do meio}
  setfillstyle(1,8);
  floodfill(x1+35+1,y1+15+1,4);

  rectangle(x1+35,y1+25,x2-5,y2-10);  {botao da tv} {de baixo}
  setfillstyle(1,8);
  floodfill(x1+35+1,y1+25+1,4);
end;
{___________constroi a caixa de empacotamento______________________}
procedure empacote(x1,y1,x2,y2,PROFUNDIDADE:INTEGER);
var  frase:string;

begin
setcolor(red);
rectangle(x1,y1,x2,y2);
setfillstyle(1,7);
floodfill(x1+1,y1+1,4);
bar3D(x1,y1,x2,y2,PROFUNDIDADE,TOPON);
frase:='FRAGIL';
outtextxy(x1+2,y1+5,frase);
frase:='P/SAIR TECLE (ESC)';
outtextxy(380,2,frase);

end;

{_____PROCEDURE APAGA_______________________}
procedure apaga(x,y:integer);

begin
 if (x<165) or (x > 390+10)
   then begin
        setfillstyle(1,white);
        bar(x-10,y-20,x+45,y+40);

        end;
end;
{________desenha a esteira_______________}

procedure esteira(x1,y1,x2,y2:integer);

begin
   setcolor(red);
   rectangle(x1,y1,x2,y2);
   setfillstyle(1,6);
   floodfill(x1+1,y1+1,4);
end;
{______RETANGULO CENTRAL__________________}
  procedure retangulo_central;
  begin
  setcolor(red);
  rectangle(210,270,390,470);  {controi um retangulo no meio da tela}
  setfillstyle(1,14);
  floodfill(211,291,4);
end;
{_____constroi AS DOBRADINHAS ENCIMA DO RETANGULO___}
procedure elipise(x,y,angin,angfi:integer);
begin
setcolor(red);
arc(x,y,angin,angfi,15);

line(x,y-15,x+180,y-15);
line(x,y+15,x+180,y+15);

arc(x+180,y,angfi,angin,15);
setfillstyle(1,BLUE);
floodfill(x+180+1,y-1,4);
end;
{________rodanas da esteira______________}
procedure rodana(x0, y0 : integer);

begin
setcolor(red);
circle(x0,y0,5);
setfillstyle(7,2);
floodfill(x0+1,y0+1,4);
end;


{++++++++BOTOES DO QUADRADO(RETOS)++++++++++++++}
procedure botoes_do_retangulo(nx,ny,x:integer);

begin
   setcolor(red);
   circle(nx,ny,3);
   setfillstyle(1,x);
   floodfill(nx+1,ny+1,4);

end;
{________________________________}
procedure botao;
var frase:string;
begin
setcolor(red);
circle(230,350,7);          {CONSTROI UM CIRCULO DENTRO DO OUTRO}
circle(230,350,4);
setfillstyle(1,14);
floodfill(231,351,4);
frase:='l/d';
settextstyle(0,0,1);
outtextxy(215,330,frase);
end;

{______________________________}
procedure som;
begin
sound(800);
delay(1000);
nosound;
end;

{***************************************************************************}
procedure desenha_fabrica;
begin
  setcolor(4);
  frase:=' FABIAN`S FABRICA';
  settextstyle(0,0,2);
  outtextxy(20,0,frase);
{____instrumento de empacotamento___}

 retangulo_central; {desenha um retangulo (CENTRAL)}

 elipise(210,255,90,270);
 elipise(210,225,90,270);        {formam as dobradinhas}
 elipise(210,195,90,270);
 elipise(210,165,90,270);

 line(0,0,210,150);    {linha que resulta um finil.Um dos instr. de empact.}
 line(390,150,maxx,0);     {de cima}
 setfillstyle(1,7);
 floodfill(220,140,4);

  line(0,maxx,210,470); {linha que resulta um finil.Um dos instr. de empact.}
  line(500,maxx,390,470);  {de baixo}
  line(0,maxx,500,maxx);
  setfillstyle(1,red);
  floodfill(240,475,4);

  botao;
  {______botoes_do_quadrado____}
  botoes_do_retangulo(235,410,4);
  botoes_do_retangulo(250,410,4);
  botoes_do_retangulo(265,410,4);
  botoes_do_retangulo(280,410,4);   {controi os botoes retos no retangulo}
  botoes_do_retangulo(295,410,4);
  botoes_do_retangulo(310,410,4);
  botoes_do_retangulo(325,410,4);
  botoes_do_retangulo(340,410,4);
  botoes_do_retangulo(355,410,4);
  botoes_do_retangulo(370,410,4);
  {____________________________}
   esteira(0,380,210,390);         {esteira do lado esquerdo}
   esteira(390,380,maxx,390);      {esteira do lado direito}

   {___________________________}
   rodana(15,385);
   rodana(35,385);
   rodana(055,385);
   rodana(75,385);                  {rodas da esteiras}
   rodana(95,385);
   rodana(115,385);
   rodana(135,385);
   rodana(155,385);
   rodana(175,385);
   rodana(195,385);
   rodana(400,385);
   rodana(420,385);
   rodana(440,385);
   rodana(460,385);
   rodana(480,385);
   rodana(500,385);
   rodana(520,385);
   rodana(540,385);
   rodana(560,385);
   rodana(580,385);
   rodana(600,385);
   rodana(620,385);

end;
  {*****************************************************}
  PROCEDURE APRESENTACAO;
  VAR RAIO:INTEGER;
  BEGIN
  cleardevice;
  SETCOLOR(5);
  settextstyle(7,0,5);
  outtextxy(30,200,'   FIM DO PROGRAMA');
  RAIO:=2;
  SETCOLOR(4);
  REPEAT
  DELAY(5);
  inc(RAIO,2);
  CIRCLE(MAXX DIV 2, MAXY DIV 2,RAIO);
  UNTIL RAIO=400;
  READKEY;
  END;
  {*****************************************************}
  PROCEDURE APRESENTACAO1;
  VAR RAIO:INTEGER;
  BEGIN
  SETCOLOR(12);
  RAIO:=2;
  REPEAT
  DELAY(1);
  RAIO:=RAIO+3;
  CIRCLE(MAXX DIV 2, MAXY DIV 2,RAIO);
  UNTIL RAIO=350;
  SETCOLOR(1);
  delay(100);

  settextstyle(7,0,4); rectangle(1,1,maxx,maxy);
  setfillstyle(4,LIGHTGREEN);
  floodfill(240,475,4);
  delay(50);
  outtextxy(30,200,'FABIANA APRESENTA:');
  outtextxy(30,240,'FABRICA DE EMPACOTAMENTO');
  readkey;
  cleardevice;

  END;
{***************************************************************************}
procedure objeto( x0, y0 :integer);
begin

 if (x0 > 0) and (x0 < 165)
   then
   constroi_tv(x0,y0,x0+45,y0+40) {desenha a televisao}

   else
   if (x0 >= 210) and (x0 <= 390)
      then begin
           end
         else if (x0>390) and (x0 < 630)
              then empacote(x0, y0, x0+45, y0+40,3);
 if (x0 >= 210) and (x0 < 212)
    then begin
        {som;}
        setfillstyle(1,7);
        bar(300,300,350,310);
        s:='';
        str(cont,s);
        outtextxy(300,300,s);
        sound(700);
        delay(400);
        sound(800);
        delay(400);
        sound(700);
        delay(400);
        sound(1000);
        delay(400);
        sound(900);
        delay(400);
        nosound;
        end;
end;
{***************************************************************************}
{__procedure movimento__________}
 procedure movimento;
 var  x,t,y:integer;

 begin
 cont:=0;
 x:=1;
 setfillstyle(1,9);
 bar(300,300,350,310);   {desenha um retangulo p/ fazer contas}
 tecla:=upcase(readkey);
 if (tecla='L')then

                 repeat
                 x:=1;
                 INC(CONT);


                          repeat
                          if keypressed
                           then BEGIN
                                 TECLA:=upcase(READKEY);
                                 if tecla='D'
                                  then begin
                                       objeto(X,340);
                                       tecla := upcase(readkey);
                                       end;
                                 END;
                          objeto(x,340); {desenha a televisao}
                          delay(10);
                          apaga(x,340);
                          inc(x,3);

                          until (x>=636)or(TECLA = chr(27));


                until   (TECLA = chr(27));

end;
{****************procedure liga*******************************************}
   procedure liga;
   begin
   repeat
   if (tecla='L') then
      movimento;
   until (tecla<>'L')or(TECLA = chr(27));
   end;
{_+_+_+_+_+_PROGRAMA PRINCIPAL_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+++++}

BEGIN
  inicia_grafico;
  APRESENTACAO1;
  desenha_fabrica;
  movimento;
  liga;
  APRESENTACAO;
  closegraph;
end.









