program fab_refr;        {Jose Wesdernio S.Oliveira 32}
uses graph,crt;                         {A2A-ELETRO_ELETRONICA}
const esc=(#27);
      velocidade=10;
var fab_refrprt   :pointer;
    cor           :word;
    coluna,linha  :integer;
    ch            :char;
    x,y,Raio      :integer;
    frase         :string;
{******************INICIA GRAFICO***********************************}
procedure inicia_grafico;

VAR
  DRIVEGRAFICO   :integer;
  MODOGRAFICO    :integer;
  CODIGOERRO     :integer;

begin
 drivegrafico:=detect;
 initgraph(drivegrafico,modografico,'c:\bp\bgi');
 codigoerro:=graphresult;
 if codigoerro<>grok
   then begin
        writeln('Erro Grafico:',graphErrormsg(codigoerro));
        halt(1);
        end;
end;
{***************************SOM1***********************************************}
Procedure Som1;
          Begin
               Sound(1000);  {Sound(820); }
               Delay(8);   {2}
               NoSound;
          end;

{*********************************ABERTURA*************************************}
PROCEDURE ABERTURA;
BEGIN
 SETBKCOLOR(0);
 cor:=4;
 SETCOLOR(15);
 SETTEXTSTYLE(0,0,2);
 OUTTEXTXY(130,220,'TRABALHO DE INFORMATICA ');
 delay(350);
FOR Raio:=50 TO 150 DO
     BEGIN     {Essa procedure desenha as elipses alterando o Raio }
      SOM1;
      SETCOLOR(cor);
      ELLIPSE(320,240,180,90,Raio*4,Raio*3);
      SETCOLOR(cor);
      ELLIPSE(320,240,90,180,Raio*4,Raio*3);
      SETCOLOR(cor);
      ELLIPSE(320,240,180,270,Raio*4,Raio*3);
      SETCOLOR(cor);
      ELLIPSE(320,240,270,360,Raio*4,Raio*3);
      SETCOLOR(cor);

     END;

 READKEY;
 CLEARDEVICE;

END;
{**********************************SOM2***********************************}
PROCEDURE SOM2;
 Begin
               Sound(300);
               Delay(2);
               NoSound;
          end;

{*********************LATA DE LADO 1******************************************************}
procedure lado1;
var frase:string;
begin
  ellipse(300,150,0,360,80,10);
  ellipse(220,250,270,90,78,35);
  ellipse(300,350,180,360,80,20);
  line(220,150,220,350);
  line(380,150,380,350);
  setfillstyle(solidfill,red);
  floodfill(221,351,red);
  settextstyle(0,0,4);
  frase:='LA';
  outtextxy(229,238,frase);

end;
{*****************LATA DE COSTA**********************************************************}
procedure costa;

begin
  ellipse(300,150,0,360,80,10);
  ellipse(300,350,180,360,80,20);
  line(220,150,220,350);
  line(380,150,380,350);
  setfillstyle(solidfill,red);
  floodfill(221,351,red);

end;
{****************LATA DE LADO 2***********************************************************}
procedure lado2;
var frase:string;
begin
  ellipse(300,150,0,360,80,10);
  ellipse(380,250,90,270,78,35);
  ellipse(300,350,180,360,80,20);
  line(220,150,220,350);
  line(380,150,380,350);
  setfillstyle(solidfill,red);
  floodfill(221,351,red);
  settextstyle(0,0,4);
  frase:='CO';
  outtextxy(320,238,frase);
end;
{********************FRENTE*******************************************************}
procedure frente;
var frase:string;
begin
  ellipse(300,150,0,360,80,10);
  ellipse(300,250,0,360,78,35);
  ellipse(300,350,180,360,80,20);
  line(220,150,220,350);
  line(380,150,380,350);
  setfillstyle(solidfill,red);
  floodfill(221,351,red);
  settextstyle(0,0,4);
  frase:='COLA';
  outtextxy(238,238,frase);
end;

{***********************lata apaga*************************************}
procedure lata_branca;
begin
  setfillstyle(solidfill,15);
  bar(210,153,390,370);
  end;

{*************************************************************************}
procedure nome;
begin
 setcolor(red);
 settextstyle(0,0,4);
 frase:='CEFET';
 outtextxy(230,10,frase);
end;
{**************************APRESENTACAO***********************************}
PROCEDURE APRESENTACAO;
var frase:string;
    k:integer;
BEGIN
  SOM2;
  SETCOLOR(15+BLINK);
  SETTEXTSTYLE(0,0,2);
  OUTTEXTXY(100,10,'DE: Jose Wesdernio S.Oliveira ');
  OUTTEXTXY(180,40,'A2A-Eletro-eletronica');
  OUTTEXTXY(150,80,'ORGULHOSAMENTE APRESENTA:');
  delay(3000);
  cleardevice;
{*****************LATINHA DE APRESENTACAO*******************************}
 setbkcolor(15);
 setcolor(red);
 k:=630;
 lata_branca;
 nome;
 frente;
 delay(k);
 lata_branca;
 nome;
 lado1;
 delay(k);
 lata_branca;
 nome;
 costa;
 delay(k);
 lata_branca;
 nome;
 lado2;
 delay(k);
 lata_branca;
 frente;

   READKEY;


 END;



{**************************RODA 0*************************************}
procedure roda0;
begin
 setfillstyle(solidfill,white);
 fillellipse(140,362,10,10);
 fillellipse(490,362,10,10);
 fillellipse(280,362,10,10);

end;
{**************************SETOR1*************************************}
procedure desenha_setor (a: integer);
begin

 setcolor (6);
 setfillstyle (1, 6);
 sector(140,362,-a + 70,-a + 25,10,10);
 sector(280,362,-a + 70,-a + 25,10,10);
 sector(490,362,-a + 70,-a + 25,10,10);
end;
{**************************RODAS1*************************************}
procedure roda1;
begin
                               {setor do primeiro circulo}
circle(140,362,10);
 setfillstyle(solidfill,6);
 sector(140,362,135,90,10,10);

circle(490,362,10);            {setor do segundo circulo}
 setfillstyle(solidfill,6);
 sector(490,362,135,90,10,10);

circle(280,362,10);           {setor do terceiro circulo}
 setfillstyle(solidfill,6);
 sector(280,362,135,90,10,10);
end;
{**************************RODAS2*************************************}
procedure roda2;
begin
                               {setor do primeiro circulo}
circle(140,362,10);
 setfillstyle(solidfill,6);
 sector(140,362,45,0,10,10);

circle(490,362,10);            {setor do segundo circulo}
 setfillstyle(solidfill,6);
 sector(490,362,45,0,10,10);

circle(280,362,10);           {setor do terceiro circulo}
 setfillstyle(solidfill,6);
 sector(280,362,45,0,10,10);
end;
{**************************RODAS3*************************************}
procedure roda3;
begin
                               {setor do primeiro circulo}
circle(140,362,10);
 setfillstyle(solidfill,6);
 sector(140,362,315,270,10,10);

circle(490,362,10);            {setor do segundo circulo}
 setfillstyle(solidfill,6);
 sector(490,362,315,270,10,10);

circle(280,362,10);           {setor do terceiro circulo}
 setfillstyle(solidfill,6);
 sector(280,362,315,270,10,10);
end;
{**************************RODAS4*************************************}
procedure roda4;
begin
                               {setor do primeiro circulo}
circle(140,362,10);
 setfillstyle(solidfill,6);
 sector(140,362,225,180,10,10);

circle(490,362,10);            {setor do segundo circulo}
 setfillstyle(solidfill,6);
 sector(490,362,225,180,10,10);

circle(280,362,10);           {setor do terceiro circulo}
 setfillstyle(solidfill,6);
 sector(280,362,225,180,10,10);
end;
{*************************RODAS****************************************}
procedure roda;
begin
 roda1;
 roda2;
 roda3;
 roda4;
end;
{**************************Cano*****************************************}
procedure cano;
begin
setcolor(8);
setfillstyle(solidfill,8);
bar(580,350,610,420);

end;

{***********desenha esteira***********************************************}

procedure esteira;
begin
  setcolor(red);
  rectangle(0,350,640,420);
  setfillstyle(solidfill,7);
  floodfill(2,451,red);
  ellipse(333,350,180,0,330,30);
  floodfill(3,360,red);
  setfillstyle(5,14);
  floodfill(332,351,red);
  setcolor(8);
  circle(42,400,8);
  setfillstyle(solidfill,15);
  floodfill(3,421,red);
  {circle(140,362,10);
  circle(490,362,10);
  circle(280,362,10);}
  cano;
  roda;
  line(42,400,42,364);
  setcolor(red);
  line(50,350,50,0);
  setfillstyle(solidfill,7);floodfill(31,340,red);
  sector(50,350,180,90,50,110);
  setfillstyle(solidfill,8);floodfill(49,341,4);
 end;


{*********************desenha a parte de cima**********************************}
procedure balao;
var frase:string;
begin
  setcolor(red);
  settextstyle(0,0,4);
  frase:='CEFET_COLA';
  outtextxy(150,127,frase);
  setcolor(7);
  ellipse(300,150,0,360,300,50);

end;

{**********desenha a lata***************************************************}
procedure lata(x,y:integer);
var frase:string;
begin
  setcolor(red);
  ellipse(x,y,0,360,13,2);
  ellipse(x,y+16,0,360,12,8);
  line(x-13,y,x-13,y+30);
  line(x+14,y,x+14,y+30);
  ellipse(x,y+30,180,360,13,3);
  {setfillstyle(solidfill,red);
  floodfill(x+1,y+5,red); }
  settextstyle(2,0,0);
  frase:='COLA';
  outtextxy(x-11,y+10,frase);
end;
{********************ESCREVE MENU*****************************}
procedure menu;
var frase:string;
begin
  settextstyle(0,0,0);
  frase:='L-LIGA';
  outtextxy(260,210,frase);
  frase:='D-desliga';
  outtextxy(260,230,frase);
  frase:='D+<Enter>';
  outtextxy(260,250,frase);
  settextstyle(2,0,0);
  setcolor(blue);
  frase:='SAI PROGRAMA ';
  outtextxy(260,260,frase);
end;
{**************desenha o funil parado****************************}
procedure funil_parado;
VAR frase:string;
begin
  setcolor(6);
  line(257,200,343,200);
  line(257,200,257,280); (*lado esquerdo*)
  line(343,200,343,280); (*direito*)
  line(257,280,343,280);  (*baixo*)
  line(270,280,290,300);  (*baixo esquerdo*);
  line(330,280,310,300);
  line(290,300,310,300);
  menu;
  delay(1000);

end;
{****************desenha o funil de saida de refrigerante********}
procedure funil;
var frase:string;
begin

  setcolor(6);
  line(257,200,343,200);
  line(257,200,257,280); (*lado esquerdo*)
  line(343,200,343,280); (*direito*)
  line(257,280,343,280);  (*baixo*)
  line(270,280,290,300);  (*baixo esquerdo*);
  line(330,280,310,300);
  line(290,300,310,300);
  delay(1000);

  setfillstyle(solidfill,red); {preenche a latinha}
  floodfill(x+1,y+5,red);
  Setfillstyle(1,15);
  bar(257,200,340,310);
  setcolor(6);
  line(257,200,343,200);
  line(257,200,257,280);
  line(343,200,343,280);
  line(257,280,343,280);
  line(270,280,301,320);
  line(330,280,301,320);
  menu;
  floodfill(300,300,6);
  delay(2000);
  Setfillstyle(1,15);
  bar(257,200,330,325);

  setcolor(6);
  menu;
  setcolor(6);
  line(257,200,343,200);
  line(257,200,257,280);
  line(343,200,343,280);
  line(257,280,343,280);
  line(270,280,290,300);
  line(330,280,310,300);
  line(290,300,310,300);
  floodfill(310,267,15);
  lata(x,y);

end;

{**************** apaga lata**************************************************}
procedure barra(x,y:integer);

begin
 setfillstyle(solidfill,white);
 bar(x-14,y-14,x+15,y+33);

end;
{******************movimenta o estoque da lata*************************}
procedure estoque;
var frase:string;
begin
  x:=594;
  y:=370;
  lata(x,y);
  setfillstyle(solidfill,red);
 floodfill(x+1,y+5,red);
  delay(30);
  cano;
   y:=450;
   for x:=600 downto 0 do

       begin

         barra(x,y);
         lata(x,y);
         setfillstyle(solidfill,red);
         floodfill(x+1,y+5,red);
         delay(velocidade);
         roda0;
         desenha_setor(-x);
         barra(x,y);
       end;
  roda0;
  roda;
 settextstyle(0,0,2);
  setcolor(2);
  frase:='TECLE l ou L para CONTINUAR ';
  outtextxy(100,430,frase);
  setcolor(11);
  frase:='TECLE d ou D +<ENTER> para SAIR ';
  outtextxy(100,455,frase);

end;
{****************************movimento do lata********************************************}
procedure mov_lata;

begin

y:=315;
for x:=65 to 300 do
    begin

   roda0;
   barra(x,315);
   lata(x,y);

   if x mod 5 = 0
     then  begin
     roda0;
     desenha_setor(x);
         end;
   delay (velocidade);
   roda0;
   lata(x,y);
   if x mod 5 = 0
     then lata(x,y);
 end;

 roda;
 sound(300);
 delay(100*velocidade);
 nosound;
 funil; {desenha o funil movimentando-se}
setfillstyle(solidfill,red);
 floodfill(x+1,y+5,red);
 roda;
 sound(300);
 delay(100*velocidade);
 nosound;
  roda0;

  for x:=300 to 594 do
    begin
    barra(x,315);
    lata(x,y);
    setfillstyle(solidfill,red);
    floodfill(x+1,y+5,red);
    if x mod 2 = 0
     then desenha_setor(x);
   delay (velocidade);
   roda0;
   lata(x,y);
   barra(x,315);
   roda0;
   end;
   estoque;

end;

{***********************movimento cenario*****************************}
procedure movimento_cenario;
begin
 setbkcolor(white);
 setcolor(red);
 balao;
 esteira;
 funil_parado;
 mov_lata;
end;
{******************************cenario_parado***************************}
procedure cenario_parado;
begin
setbkcolor(white);
setcolor(red);
balao;
esteira;
roda;
funil_parado;
{lata(x,y);  }
end;

{***********************Programa pricipal****************************}
begin

inicia_grafico;
ABERTURA;
APRESENTACAO;
cleardevice;
setbkcolor(white);
setcolor(red);
cenario_parado;
ch:=(readkey);

 repeat

    if(ch='l') or (ch='L')
     then movimento_cenario;
          ch:=readkey;
   if keypressed
     then if(ch='d') or (ch='D')
     then   cenario_parado;

 until (ch='d') or (ch='D');
 readln;
closegraph;
end.





