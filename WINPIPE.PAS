{Jos‚ Candido de Queiroz Lima Filho no. 31}
Program winpipe;
uses crt, dos, graph;

const corfundo = 1;
      corbloco = 4;
      corsombra = 1;
      cano_padrao = 15;
      cano_sombra = 7;
var x, y, no, nomax, tipo, cor_b, cor_c: integer;
    nome, chance: string[10];
    tecla, nivel: char;
    sai: boolean;

{***************************************************************************}

procedure inicia_grafico;                 {inicia o modo grafico}
var driver_grafico, modo_grafico, codigo_erro: integer;
begin
driver_grafico:=detect;
initgraph(driver_grafico, modo_grafico, 'C:\BP\BGI');
codigo_erro:=graphresult;
if codigo_erro<>grOK
   then begin                 {retorna mensagen de erro grafico, se houver}
        writeln('Erro Grafico: ', grapherrormsg(codigo_erro));
        halt (1);
        end;
end;

{***************************************************************************}
procedure apresentacao;               {tela de apresentacao do jogo}

var k, l, sai:integer;
begin
cleardevice;
k:=40;
l:=10;
sai:=0;
repeat
      setfillstyle(solidfill, 1);               {desenha os blocos vermelhos}
      bar(k,l,k+48,l+48);
      delay(30);
      k:=k+50;
      setfillstyle(interleavefill, 4);
      bar(k-50,l,k-2,l+48);
      if k=590
         then begin
              k:=40;
              l:=l+50;
              sai:=sai+1;
              end;
until sai=9;
k:=290;                      {desenha os blocos brancos}
l:=160;
sai:=0;
repeat
      setfillstyle(solidfill, 1);
      bar(k,l,k+48,l+48);
      delay(30);
      k:=k+50;
      setfillstyle(solidfill, 15);
      bar(k-50,l,k-2,l+48);
      if k=590
         then begin
              k:=290;
              l:=l+50;
              sai:=sai+1;
              end;
until sai=3;
setcolor(4);
rectangle(39,9,589,459);                  {nome do jogo}
setcolor(15);
settextstyle(triplexfont, horizdir, 8);
outtextxy(55, 15, 'DosPipe');
settextstyle(defaultfont, horizdir, 1);
outtextxy(55, 165, 'NOME: ');
window(13,11,23,11);                            {pergunta o nome do jogador}
clrscr;
read(nome);
outtextxy(55, 200, 'NIVEL:');
outtextxy(55, 210, '1 - Facil');
outtextxy(55, 220, '2 - Normal');
outtextxy(55, 230, '3 - Dificil');
nivel:=readkey;                               {verifica o nivel}
k:=290;
l:=160;
sai:=0;
repeat
      delay(30);
      k:=k+50;
      setfillstyle(solidfill, 11);
      bar(k-50,l,k-2,l+48);
      if k=590         then begin               {desenha o vazamento}
              k:=290;
              l:=l+50;
              sai:=sai+1;
              end;
until sai=3;
floodfill(594,200, 4);
delay(100);
repeat
      setcolor(0);
      outtextxy(278,470,'PRESSIONE QUALQUER TECLA PARA CONTINUAR');
      delay(500);
      setcolor(11);
      outtextxy(278,470,'PRESSIONE QUALQUER TECLA PARA CONTINUAR');
      delay(500);
until keypressed;
end;

{***************************************************************************}

procedure menus;
var niv:string;
begin                                   {menu do jogo - incompleto}
setcolor(15);
settextstyle(Defaultfont,horizdir,1);
outtextxy(18,32,'Jogo');
outtextxy(78,32,'Ajuda');
outtextxy(4,8,'DosPipe - v. 10.0.1 beta 32 - Trial Version');
outtextxy(500,90,'Nome: ');
outtextxy(550,90,nome);
outtextxy(500,100,'Nivel: ');
if nivel='1'
   then niv:='Facil'
   else if nivel='2'
        then niv:='Normal'            {olha qual foi o nivel escolhido}
        else if nivel='3'
             then niv:='Dificil'
             else niv:='Normal';
outtextxy(555,100,niv);
outtextxy(500,200,'Comandos:');
outtextxy(500,210,'<TAB>: Muda cano');
outtextxy(500,220,'<ENTER>: Fix cano');
outtextxy(500,230,'>seta cim.: Sobe');
outtextxy(500,240,'>seta bai.: Desce');
outtextxy(500,250,'>seta esq.: Esquerda');
outtextxy(500,260,'>seta dir.: Direita');
outtextxy(500,280,'<ESC>: Sai');
end;

{**************************************************************************}

procedure segundo_plano;
var k, l, maxx, maxy: integer;

begin
maxx:=getmaxx;
maxy:=getmaxy;
apresentacao;             {apresentacao e desenha os graficos do jogo}
cleardevice;
setbkcolor(8);
setcolor(7);
setlinestyle(solidln, 0, thickwidth);
rectangle(0,0,maxx,maxy);
setfillstyle(solidfill, 1);
bar(2,2,maxx-2,20);
line(0,21,maxx,21);
line(0,50,maxx,50);
line(490,50,490,maxy);
setfillstyle(solidfill, 1);
bar(40,90,438,438);
setlinestyle(solidln, 0, normwidth);
setcolor(4);
rectangle(39,89,439,439);
rectangle(37,87,441,441);
setlinestyle(solidln, 0, thickwidth);
rectangle(33,83,445,445);
setlinestyle(solidln, 0, normwidth);
k:=40;
l:=90;
repeat
      line(k-1,l,k-1,l+348);
      k:=k+50;
until k=440;
k:=40;                            {parte onde se desenrrolara o jogo}
l:=90;
repeat
      line(k,l-1,k+398,l-1);
      l:=l+50;
until l=440;
menus;
end;

{**************************************************************************}
procedure cano(k,l: integer; tipo: byte; cor_bloco, cor_cano: byte);

begin                         {desenha, quando solicitado, os tipos de canos}
case tipo of
     1: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k-1,l+16,k+49,l+32);
        end;
     2: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k+16,l-1,k+32,l+49);
        end;
     3: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k-1,l+16,k+32,l+32);
        bar(k+16,l+16,k+32,l+49);
        end;
     4: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k-1,l+16,k+32,l+32);
        bar(k+16,l-1,k+32,l+32);
        end;
     5: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k+16,l+16,k+49,l+32);
        bar(k+16,l-1,k+32,l+32);
        end;
     6: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        setfillstyle(solidfill, cor_cano);
        bar(k+16,l+16,k+49,l+32);
        bar(k+16,l+16,k+32,l+49);
        end;
     7: begin
        setcolor(4);
        rectangle(k-1, l-1, k+49, l+49);
        setfillstyle(interleavefill, cor_bloco);
        bar(k,l,k+48,l+48);
        end;
     end;
end;

{***************************************************************************}

procedure canos_fixos;
var k, l: integer;
    tipo: byte;

begin                 {desenha os canos fixos: comeco e fim}
k:=40;
l:=90;
setcolor(4);
rectangle(k-1, l-1, k+49, l+49);
setfillstyle(interleavefill, corbloco);
bar(k,l,k+48,l+48);
setfillstyle(solidfill, cano_padrao);
bar(k+24,l+16,k+49,l+32);
k:=390;
l:=390;
setcolor(4);
rectangle(k-1, l-1, k+49, l+49);
setfillstyle(interleavefill, corbloco);
bar(k,l,k+48,l+48);
setfillstyle(solidfill, cano_padrao);
bar(k-1,l+16,k+24,l+32);
end;


{***************************************************************************}

function muda_tipo(x, y, cont: integer; tipo, cor_b, cor_c: byte): integer;
var tecla: char;

begin
if tipo=7                   {efetua a mudanca de um tipo de cano para outro}
   then tipo:=1;
repeat
   muda_tipo:=tipo;
   tecla:=readkey;
   if ord(tecla)=9
      then begin
           tipo:=tipo+1;
           cont:=cont+1;
           cano(x, y, tipo, cor_b, cor_c);
           if tipo>6
              {then muda_tipo:=6;
              else tipo>=6}
              then {if tipo=6
                      then muda_tipo:=6
                      else} tipo:=0;
           end;
until ord(tecla)=13;
no:=cont;
end;

{***************************************************************************}

function desenha_cano(x, y, cont: integer):integer;
begin
cor_b:=corsombra;
cor_c:=cano_sombra;            {desenha os canos}
tipo:=7;
cano(x, y, tipo, cor_b, cor_c);
tipo:=muda_tipo(x, y, cont, tipo, cor_b, cor_c);
desenha_cano:=cont;
cano(x, y, tipo, corbloco, cano_padrao);
cor_b:=corbloco;
cor_c:=cano_padrao;
end;
{***************************************************************************}
procedure tela_final(result: byte);
var k, v, t:integer;
    texto: string;
begin
  v:=0;
  if result=1
     then begin
            texto:='"Voce Venceu! Ja pode ser encanador profissional"';
            k:=30;
            t:=3;
          end
     else begin
            texto:='"Voce e um pessimo encanador!!"';
            k:=70;
            t:=4
          end;
  cleardevice;
  settextstyle(triplexfont, horizdir, t);
  repeat                           {tela final}
    setcolor(15);
    outtextxy(k,200,texto);
    delay(500);
    setcolor(8);
    outtextxy(k,200,texto);
    delay(500);
    v:=v+1;
  until v=6;
end;

{*****************************Programa Principal****************************}
begin
inicia_grafico;
segundo_plano;
if nivel='1'
   then nomax:=75
   else if nivel='2'
        then nomax:=60              {olha qual foi o nivel escolhido}
        else if nivel='3'
             then nomax:=45
             else nomax:=60;
canos_fixos;
x:=40;
y:=90;
x:=x+50;
tipo:=7;
cor_b:=corsombra;
cor_c:=cano_sombra;
no:=0;
repeat
   repeat
      outtextxy(500,110,'Chances Usadas: ');
      str(no,chance);
      setfillstyle(solidfill, 8);
      bar(620,110,633,118);
      outtextxy(620,110,chance);
      cano(x, y, tipo, cor_b, cor_c);
      delay(50);
   until keypressed;
   tecla:=readkey;
   case ord(tecla) of
        72: begin
            if getpixel(x+24, y-2)=1
               then y:=y-50;                  {cima}
            desenha_cano(x, y,no);
            end;
        80: begin
            if getpixel(x+24, y+52)=1
               then y:=y+50;                {baixo}
            desenha_cano(x, y,no);
            end;
        75: begin
            if getpixel(x-2, y+24)=1
               then x:=x-50;                {esquerda}
            desenha_cano(x, y,no);
            end;
        77: begin
            if getpixel(x+52, y+24)=1
               then x:=x+50;                {direita}
            desenha_cano(x, y,no);
            end;
         9: begin
            desenha_cano(x, y,no);      {muda o tipo}
            end;
        27: sai:=true;    {sair}
        end;
until (no>nomax) or (sai=true);
setfillstyle(solidfill, 11);
floodfill(88,113, 4);               {vazamento}
delay(2000);
if getpixel(392,415)=11
   then if getpixel(388,392)=4
           then tela_final(1)
           else tela_final(2)
   else tela_final(2);
closegraph;
end.