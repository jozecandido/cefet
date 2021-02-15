program apolo_15;
uses crt,graph;
var b,b2,v,pontos,vidas,cornav,cor,cor1,cor2,cor3,cor4,cont2,w,v_adv,x_adv:integer;
    y_adv,x_nav,cont,A,maxx,maxy,x,y:integer;
    frase,texto:string;
    tecla:char;
    fim:boolean;
{*************************************************************************}
procedure inicia_grafico;
          var drivegrafico,modografico, codigoerro:integer;
          begin
          drivegrafico:=detect;
          initgraph(drivegrafico,modografico,'C:\BP\BGI');
          codigoerro:=graphresult;
          if codigoerro<>grOK
             then begin
                  writeln('Erro gr fico: ', grapherrormsg(codigoerro));
                  halt(1);
                  end;
          end;
{*************************************************************************}
Procedure nave(x,y,cor:integer);                {desenha uma nave}
          begin
          setcolor(6);                    { >>>> cor do texto laranja }
          arc(x,y+3,40,139,20);           { Faz a parte laranja do  }
          arc(x,y-22,221,320,20);         {    fogo da turbina      }
          setfillstyle(solidfill,6);      {                         }
          floodfill(x,y-5,6);             {                         }
          setcolor(14);                   { >>>> cor do texto amarelo }
          arc(x,y+1,40,137,15);           { Faz a parte amarela do  }
          arc(x,y-19,221,320,15);         {    fogo da turbina      }
          setfillstyle(solidfill,14);     {                         }
          floodfill(x,y-7,14);            {                         }
          setcolor(cor);                  { >>>> cor da nave  }
          arc(x,y,40,140,20);             { >>>> detalhes da nave   }
          arc(x,y-65,40,140,14);          {                         }
          arc(x,y-75,55,125,13);          {                         }
          line(x+15,y-15,x+11,y-35);      { >>>> curva inferior direita}
          line(x-15,y-15,x-11,y-35);      { >>>> curva inferior esquerda}
          line(x-11,y-35,x-11,y-75);      { >>>> linha esquerda}
          line(x+11,y-35,x+11,y-75);      { >>>> linha direita}
          line(x+11,y-75,x+3,y-98);       { >>>> curva superior direita}
          line(x-11,y-75,x-3,y-98);       { >>>> curva superior esquerda}
          line(x-3,y-98,x+3,y-98);        { >>>> reta + superior ainda}
          line(x+11,y-55,x+40,y-35);      { >>>> asa superior direita}
          line(x+11,y-36,x+40,y-16);      {                    }
          line(x-11,y-55,x-40,y-35);      { >>>> asa superior esquerda}
          line(x-11,y-36,x-40,y-16);      {                     }
          setlinestyle(solidln,0,thickwidth);
          line(x+40,y+20,x+40,y-85);      { >>>> reta grossa superior direita}
          line(x-40,y+20,x-40,y-85);      { >>>> reta grossa superior esquerda}
          line(x+29,y-105,x+29,y-43);     { >>>> reta gr_sup superior direita}
          line(x+29,y-23,x+29,y);         { >>>> reta gr_inf superior direita}
          line(x-29,y-105,x-29,y-43);     { >>>> reta gr_sup superior esquerda}
          line(x-29,y-23,x-29,y);         { >>>> reta gr_inf superior direita}
          line(x+29,y,x+40,y+20);         {  complemento da asa }
          line(x+29,y-105,x+40,y-85);     {       direita       }
          line(x-29,y,x-40,y+20);         {  complemento da asa }
          line(x-29,y-105,x-40,y-85);     {       esquerda      }
          setlinestyle(solidln,0,normwidth); { >>>> Estilo da linha - normal }
          setfillstyle(solidfill,8);      {  preenchimanto das partes }
          floodfill(x-3,y-85,cor);        {    pintadas da nave       }
          setfillstyle(solidfill,cor);    {                           }
          floodfill(x+15,y-47,cor);       {                           }
          floodfill(x-15,y-47,cor);       {                           }
          end;
{************************************************************************}
Procedure snave(x, y: word);                   { Apaga a nave }
          begin                                    { desenha um retangulo}
               setfillstyle (1, 0);                { com cor dr fundo no }
               bar (x - 45, y - 145, x + 43, y-5); { lugar da nave       }
          end;
{************************************************************************}
procedure barras(y:word);                          { desenha barrras ao }
          begin                                    {   lado da pista    }
          setfillstyle(1,1);           { >>>> cor das barras - azul }
          bar(142,y-100,147,y);        { >>>> barras … esquerda da pista}
          bar(502,y-100,507,y);        { >>>> barras … direita da pista }
          end;
{************************************************************************}
procedure sbarras(y:word);                   { Apaga as barras que }
          begin                             { estÆo ao lado da pista }
          setfillstyle(1,0);           { >>>> cor das barras - preto }
          bar(142,y-100,147,y);        { >>>> barras … esquerda da pista}
          bar(502,y-100,507,y);        { >>>> barras … direita da pista }
          end;
{************************************************************************}
{procedure barra(cornew:word);
          begin
          setcolor(4);
          rectangle(20,20,50,50);
          setfillstyle(solidfill,cornew);
          floodfill(22,22,4)
          end;}
{************************************************************************}
procedure colisao(x,y:integer);         {Faz o dezenho de uma explosao}
          begin                         {que ser  usada para quando as}
          setcolor(6);                           {  naves colidirem   }
          setlinestyle(solidln,0,thickwidth);
          line(x-20,y,x-40,y-50);
          line(x-40,y-50,x-15,y-30);
          line(x-15,y-30,x-5,y-60);
          line(x-5,y-60,x+5,y-25);
          line(x+5,y-25,x+15,y-70);
          line(x+15,y-70,x+20,y-20);
          line(x+20,y-20,x+40,y-25);
          line(x+40,y-25,x+20,y);
          line(x-20,y,x-45,y);
          line(x-45,y,x-8,y+10);
          line(x-8,y+10,x-15,y+35);
          line(x-15,y+35,x+5,y+5);
          line(x+5,y+5,x+30,y+30);
          line(x+30,y+30,x+20,y);
          {line(x-20,y,x+30,y-5);}
          setfillstyle(solidfill,yellow);
          floodfill(x-10,y-15,6);
          setlinestyle(solidln,0,normwidth);
          end;
{************************************************************************}
{procedure tiro(x,y,cor:integer);
          begin
          setcolor(cor);
          setfillstyle(1,1);
          bar(x-1,y-20,x+1,y+1);
          repeat
                {setfillstyle(solidfill,4);
                bar(x-1,y-10,x+1,y+1);}
                {y:=y-30;
                setfillstyle(1,1);
                bar(x-1,y-20,x+1,y+1);
          until (getpixel(x,y)<>1) and (getpixel(x,y)<>0);
          end;
{************************************************************************}
procedure tiro(x,y:integer);
          begin
          setcolor(4);
          setlinestyle(solidln,1,thickwidth);
          line(x,y,x,y-20);
          repeat
                y:=y-30;
                line(x,y,x,y-20);
          until y<10;
          end;
{**************************************************************************}
procedure inicializacoes;                 { Faz as inicializa‡äes das }
          var texto: string;
          begin                           {        vari veis          }
          b:=0;                           { >>>>>> var. para barras }
          b2:=30;                         { >>>>>> var. para barras }
          v:=30;                          { >>>>>> var. do delay }
          pontos:=0;                      { >>>>>> inicializa os pontos}
          vidas:=3;                       { >>>>>> inicaliza as vidas}
          {x:=1;}
          w:=0;
          y:=340;
          cornav := random (15) + 2;      { >>>>>> var para cor da nave}
          x_nav := 313;                   { >>>>>> coord. x da nave apolo_15}
          x_adv := random(250)+205;       { >>>>>> coord. x da nave advers.}
          y_adv :=0;                      { >>>>>> coord. y da nave advers.}
          v_adv :=3;                      { >>>>>> velocid. da nave advers.}
          for cont2:=1 to 1300 do                 {   fundo estrelado  }
          putpixel(random(639),random(476),3);    {                    }
          setcolor(1);
          rectangle(10,138,130,265);
          rectangle(10,38,130,120);
          Setfillstyle(solidfill,0);
          floodfill(11,142,1);
          floodfill(11,40,1);
          {line(10,162,130,162);
          line(10,62,130,62);}
          setcolor(15);
          outtextxy(17,148,'COMANDOS :');
          outtextxy(17,170,chr(24));
          outtextxy(57,170,'Acerela');
          outtextxy(17,185,chr(25));
          outtextxy(57,185,'Freia');
          outtextxy(17,200,chr(26));
          outtextxy(57,200,'Direita');
          outtextxy(17,215,chr(27));
          outtextxy(57,215,'Esquerda');
          outtextxy(17,230,'Esp  Atira');
          outtextxy(17,245,'P    Pausa');
          {str(cont,texto);}
          outtextxy(17,48,'PONTUA€AO :');
          outtextxy(67,97,'Pontos');
          settextstyle(8,0,2);
          setcolor(7);
          outtextxy(17,60,'50');
          end;
{*************************************************************************}
procedure fundo;                               { Faz o fundo do programa}
          {var texto:string;}
          begin
          setcolor(0);                        { >>>> cor do texto azul}
          setlinestyle(solidln,0,normwidth);  { >>>> estilo da linha normal}
          rectangle(0,0,maxx,maxy);           { >>>> retang tamanho da tela}
          setcolor(1);
          line(150,1,150,479);                { >>>> lado esquedo da pista}
          line(499,1,499,479);                { >>>> lado direito da pista}
          Setfillstyle(solidfill,0);
          floodfill(300,402,1);               { >>>> pinta a pista de preto}
          end;
{*************************************************************************}
function jogo(pontos: integer): boolean;              {  o jogo em si }
          begin
          for b2:=0 to 5 do                   { >>>> faz as barras ao }
              barras(150*b2+b);               {      lado da pista    }
          nave(x_nav,445,1);                  { >>>> nave do jogador  }
          cor:=getpixel(x_adv + 40, y_adv + 23);
          cor1:=getpixel(x_adv - 40, y_adv + 23);
          cor2:=getpixel(x_adv - 40, y_adv - 50);
          cor3:=getpixel(x_adv + 40, y_adv - 50);
          cor4:=getpixel(x_adv, y_adv +15);
          if (cor=1) or (cor1=1) or (cor2=1) or (cor3=1) or (cor4=1)
             then begin
                  colisao(x_adv,y_adv);
                  colisao(x_nav,400);
                  delay(100);
                  y_adv:=600;
                  snave(x_nav,480);
                  x_nav:=313;
                  vidas:=vidas-1;
                  if vidas = 0
                     then begin
                          fim:=true;
                          {cleardevice;
                          setcolor(1);
                          settextstyle(7,0,9);
                          outtextxy(200,170,'FIM');}
                          end;
                  {w:=1;
                  if (pontos>5) and (w=1)
                     then begin
                          jogo:=false;
                          pontos:=pontos-5;
                          str(pontos,texto);
                          setfillstyle(1,0);
                          bar(16,60,100,90);
                          setcolor(8);
                          outtextxy(17,60,texto);
                          end;
                  end;
          {barra(cor);}
                  end;
          nave( x_adv , y_adv , cornav);      { >>>> nave do advers rio}
          delay(v);                           { >>>> intervalo para anima‡Æo}
          {if w=1
             then begin
                  tiro(x,y,1);
                  tiro(x,y-20,0);
                  y:=y-10;
                  end;}
          for b2:=0 to 5 do                   { >>>> apaga barras ao  }
              sbarras(150*b2+b);              {      lado da pista    }
          snave (x_adv , y_adv + 25);         { >>>> apaga a nave do advers.}
          y_adv := y_adv + v_adv;             { >>>> desce a nave do adv de }
                                              {      acordo com a velocidade}
          b := b + 7;                         { >>>> desce as barras  }
          if b > 150                          { >>>> verif. se as barras   }
             then b := 0;                     {      chegaram no limite da }
                                              {      tela e faz recome‡ar  }
          if y_adv > 530                      { >>>> verif. se a nave adv. }
             then begin                       {      chegou no fim da tela }
                  y_adv := 0;                 { >>>> faz outra nave advers.}
                  cornav := random(8);        { >>>> cor aleat¢ria da nave }
                  if cornav=0                 { >>>> verif. se nave ‚ preta}
                     then cornav:=7;          {      substitui por cinza   }
                  if cornav=6                 { >>>> verif. se nave ‚ laranja}
                     then cornav:=8;          {      substitui por grafite }
                  if cornav=1                 { >>>> verif. se nave ‚ azul }
                     then cornav:=12;         {      substitui por vermelha}
                  x_adv := random (250)+205;  { >>>> pozi‡Æo x aleat¢ria da }
                                              {      nave advers ria        }
                  v_adv := random (4) + 3;    { >>>> veloc. aleat. nave adv }
                  {w:=2;}
                  {if w=0
                     then begin
                          pontos:=pontos+10;
                          jogo:=true;
                          str(pontos,texto);
                          setfillstyle(1,0);
                          bar(16,60,99,90);
                          setcolor(7);
                          outtextxy(17,60,texto);
                  {        end;
                  w:=0;}
                  end;
          end;
{**************************************************************************}
procedure teclas;                       { Indica a fun‡Æo de cada tecla }
          begin
          tecla:=readkey;               { Lˆ tecla }
            case ord(tecla) of
                 77: begin                  { >>>>>> move nave para direita }
                     snave(x_nav, 480);     {  apaga posi‡Æo anter. da nave }
                     x_nav := x_nav + 5;    {      move para direita        }
                     if x_nav > 455         {verif. se nave chegou no limite}
                        then x_nav := 455;  {       fixa o limite           }
                     nave(x_nav,445,1);     {  coloca nave na prox. posi‡Æo }
                     end;
                 75: begin                  { >>>>> move nave para esquerda }
                     snave (x_nav, 480);    {  apaga posi‡Æo anter. da nave }
                     x_nav := x_nav - 5;    {      move para esquerda       }
                     if x_nav < 193         {verif. se nave chegou no limite}
                        then x_nav :=193;   {       fixa o limite           }
                     nave (x_nav,445,1);    {  coloca nave na prox. posi‡Æo }
                     end;
                 72: begin                  { >>>> aumenta a veloc. da nave }
                     v := v - 2;            {       diminui o delay         }
                     if v < 5               {  verif. se delay menor que 7  }
                        then v:=5;          {  fixa 7 como limite de veloc. }
                     end;
                 80: begin                  { >>>> diminui velocidade da nave}          {baixo = + lento}
                     v := v + 2;            {       aumenta o delay          }
                     if v > 1000            { verif. se delay maior que 1000 }
                        then v := 1000;     {   fixa 1000 como menor veloc.  }
                     end;
                 32: begin
                      tiro(x_nav,y);
                      w:=1;
                      x:=x_nav;
                      {colisao(x_adv,y_adv);}
                      end;
                 112: begin
                      snave(x_nav,480);
                      settextstyle(8, 0, 2);
                      setcolor(15);
                      outtextxy(250,250,'JOGO PAUSADO');
                      readkey;
                      end;
                 27: fim:=true;
            end;
          end;
{***************************************************************************}
{*************************** PROGRAMA PRINCIPAL ****************************}
{***************************************************************************}

begin
inicia_grafico;
maxx:=getmaxx;
maxy:=getmaxy;
setbkcolor(black);
cleardevice;
inicializacoes;
cont:=50;
repeat
   repeat
      fundo;
      {jogo;
      if w=1
         then cont:= cont+10
         else if w=2
              then cont:= cont-5;
      str(cont,texto);
      setfillstyle(1,0);
      bar(16,65,40,80);
      outtextxy(17,60,texto);}
      if jogo(cont)=true
         then cont:=cont+10;
      if jogo(cont)=false
         then cont:=cont-5;
   until keypressed;
   teclas;
until fim;{tecla=chr(27);}
cleardevice;
setcolor(1);
settextstyle(7,0,9);
outtextxy(200,170,'FIM');
settextstyle(7,0,1);
outtextxy(250,280,'DO JOGO');
readkey;
closegraph;
end.
