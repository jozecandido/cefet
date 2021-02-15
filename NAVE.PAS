{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! }
{ >>>>>> ALUNA: RAQUEL DE SOUSA ___ No: 43 ___ A2A-ELETROELETRONICA <<<<<<< }
{ >>>>>> PROFESSOR: ROGêRIO _____ TRABALHO DE LOGICA DE PROGRAMACAO <<<<<<< }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! }
{ >>>>>>>>>>>>>>>>>>>>>>>>>> NAVE - APOLO11 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! }
program apolo_11;
uses crt,graph;
var b,b2,w,v,cor,cor1,cor2,cor3,cor4,cor5,cornav,cores,vidas,pontos:integer;
    x,y,cont,v_adv,x_adv,y_adv,x_nav,pont1,pont2,y_seta,y_setinha:integer;
    frase,nome,vida,ponto:string;
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
                  writeln('Erro gr†fico: ', grapherrormsg(codigoerro));
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
          setcolor(cor);                  { >>>> cor da nave        }
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
          setlinestyle(solidln,0,thickwidth); {  >>>> linha grossa    }
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
procedure nave2(x,y,cor:integer);         { Faz o outro modelo de nave }
          begin
          setcolor(7);                    { >>>> cor de texto branca   }
          arc(x,y,130,230,45);            { >>>> corpo da nave         }
          arc(x,y,310,50,45);             {                            }
          line(x-29,y-35,x-25,y-20);      {                            }
          line(x+29,y-35,x+25,y-20);      {                            }
          line(x-25,y-20,x-10,y-20);      {                            }
          line(x+25,y-20,x+10,y-20);      {                            }
          line(x-10,y-20,x-10,y-45);      {                            }
          line(x+10,y-20,x+10,y-45);      {                            }
          line(x-10,y-45,x-1,y-60);       {                            }
          line(x+10,y-45,x+1,y-60);       {                            }
          line(x-1,y-60,x+1,y-60);        {                            }
          line(x-30,y+35,x,y+10);         {                            }
          line(x+30,y+35,x,y+10);         {                            }
          setlinestyle(0,1,thickwidth);   { >>>> estilo de linha grossa}
          setcolor(6);                    {    parte das turbinas      }
          line(x-17,y+29,x-6,y+20);       {                            }
          line(x+6,y+20,x+10,y+45);       {                            }
          line(x+18,y+30,x+10,y+45);      {                            }
          line(x+17,y+29,x+6,y+20);       {                            }
          line(x-6,y+20,x-10,y+45);       {                            }
          line(x-18,y+30,x-10,y+45);      {                            }
          setfillstyle(1,cor);            { >> determina a cor da nave }
          floodfill(x,y-5,7);             { >>> pinta a nave coma cor  }
          setcolor(7);                    { >>> cor do texto cinza     }
          setfillstyle(1,yellow);         {  cor amarela das turbinas  }
          floodfill(x+10,y+25,6);         {                            }
          floodfill(x-10,y+25,6);         {                            }
          setlinestyle(0,1,normwidth);    { >>> linha normal           }
          ellipse(x,y-35,0,360,5,10);     {   Desenha a cabinezinha    }
          setfillstyle(1,8);              {         da nave            }
          floodfill(x,y-30,7);            {                            }
          end;
{***************************************************************************}
Procedure apgnave(x, y: word);              { Apaga a nave }
          begin                                    { desenha um retangulo}
          setfillstyle(1, 0);                     { com cor de fundo no }
          bar (x - 43, y - 145, x + 43, y-5);      {    lugar da nave    }
          end;
{***************************************************************************}
Procedure apgnave2(x,y: word);              { Apaga a nave2}
          begin
          setfillstyle(1,0);             { >>>> prep p/ preencher de preto}
          bar(x-45,y+50,x+45,y-85);      { >>>> barra preta               }
          end;
{***************************************************************************}
Procedure seta (x,y: word);          {Desenha a seta da escolha da nave}
          begin
          setlinestyle(0,0,thickwidth);  { >>>> linha grossa             }
          setcolor (1);                  { >>>> cor da linha azul        }
          setfillstyle (1, 7);           { >>> prep p/ preencher de cinza}
          moveto (x,y-10);               {       corpo da seta           }
          lineto (x+20,y);               {                               }
          lineto (x,y+10);               {                               }
          lineto (x,y-10);               {                               }
          floodfill (x+5,y,1);           { >>>> pinta a seta de cinza    }
          end;
{***************************************************************************}
Procedure apgseta (x,y: word);             {Apaga a seta}
          begin
          setfillstyle (1, 0);           { >>>> prep p/ preencher de preto}
          bar (x-11,y-11,x+21,y+11);     { >>>> barra preta               }
          end;
{***************************************************************************}
Procedure setinha (x,y:word);
          begin
          setlinestyle(0,0,thickwidth);  { >>>> linha grossa             }
          setcolor(1);                   { >>>> cor da linha azul        }
          setfillstyle(1,7);             { >>> prep p/ preencher de cinza}
          moveto(x,y-7);                 {       corpo da seta           }
          lineto(x+14,y);                {                               }
          lineto(x,y+7);                 {                               }
          lineto(x,y-7);                 {                               }
          floodfill(x+2,y,1);            { >>>> pinta a seta de cinza    }
          end;
{***************************************************************************}
procedure apgsetinha(x,y:word);
          begin
          setfillstyle(1,0);             { >>>> prep p/ preencher de preto}
          bar(x-8,y-8,x+15,y+8);         { >>>> barra preta               }
          end;
{***************************************************************************}
procedure entrada;
          begin
          setcolor(1);                         { >>>> cor do texto azul    }
          rectangle(1,1,629,479);              { >>> retangulo na tela toda}
          setcolor(7);                         { >>> cor do texto cinza    }
          settextstyle(7,0,8);                 { >>>> letra bem grande     }
          outtextxy(130,120,'APOLO 11');       { >>>> escreve texto        }
          settextstyle(7,0,2);                 { >>>> letra pequena        }
          outtextxy(220,70,'Corrida de naves');{ >>>> escreve texto        }
          settextstyle(7,0,3);                 { >>>> letra maior um poquim}
          outtextxy(30,350,'Tente conquistar o maior n£mero de pontos!!!');
          outtextxy(200,390,'e DIVIRTA-SE');   { >>>> escreve texto        }
          repeat                    {  repete....                          }
                setcolor(15);                  { >>>> cor do texto cinza    }
                settextstyle(3,0,3);           { >>>> letra media           }
                outtextxy(120,250,'Tecle qualquer tecla para comeáar');
                delay(600);                    { >>>> atrazo                }
                setcolor(1);                   { >>>> cor do texo azul      }
                outtextxy(120,250,'Tecle qualquer tecla para comeáar');
                delay(500);                    { >>>> atrazo                }
          until keypressed;              { ... atÇ ser precionada uma tecla }
          cleardevice;                         { >>>> limpa a tela          }
          rectangle(1,1,629,479);              { >>>> retangulo na tela toda}
          outtextxy (53, 53, 'Digite seu nome: '); { >>>> texto             }
          readkey;                         { espera uma tecla ser precionada}
          gotoxy (33,5);                   { >>>> vai para as coordenadas   }
          readln (nome);                   { >>>> là nome                   }
          outtextxy (53, 134, 'Escolha o modelo da nave:');{ >>>> texto     }
          nave2(190,250,1);                {        desenha os modelos      }
          nave(190,435,1);                 {            das naves           }
          y_seta:=250;                     { >>>> coord y da seta           }
          seta(100,y_seta);                { >>>> desenha a primeira seta   }
          repeat
                tecla:=readkey;
                  case ord(tecla) of
                    80: begin                { >>>> move seta pra baixo     }
                        apgseta(100,y_seta); {      apaga seta anterior     }
                        y_seta:=y_seta+150;  {      incrementa a coord y    }
                        if y_seta > 400      { verif se coord y ta no limite}
                           then y_seta:=400; {        fixa limite           }
                        seta(100,y_seta);    {desenha outra seta mais abaixo}
                        end;
                    72: begin                { >>>> move seta pra cima      }
                        apgseta(100,y_seta); {      apaga seta anterior     }
                        y_seta:=y_seta-150;  {      incrementa a coord y    }
                        if y_seta < 250      { verif se coord y ta no limite}
                           then y_seta:=250; {        fixa limite           }
                        seta(100,y_seta);    {desenha outra seta mais a cima}
                        end;
                  end;
          until ord(tecla)=13;       { ate tecla enter                      }
          setcolor(1);                        { >>>> cor do texto azul      }
          outtextxy(320,300,'Escolha a cor:');{ >>>> escreve texto          }
          setlinestyle(0,0,normwidth);        { >>>> linha normal           }
          setcolor(15);                       { >>>> cor cinza              }
          rectangle(485,305,505,325);         { >>>> retangulo nas coord    }
          cores:=1;                           { >>>> primeira cor Ç azul    }
          x:=550;                             { >>>> fixa a coord x         }
          y:=150;                             { >>>> inicializa a coord y   }
          repeat
                setfillstyle(1,cores);   { >>>> prep p/ preencher com a cor }
                bar(x,y,x+15,y+15);      { >>>> barra preenchida com a cor  }
                cores:=cores+1;          { >>>> mudara cor                  }
                y:=y+20;                 { >>>> incrementa a coord y        }
          until y>440;              { ... atÇ o limite                      }
          y_setinha:=157;                { >>>> coord y da setinha          }
          setinha(520,y_setinha);        { >>>> desenha a primeira setinha  }
          cor:=1;                        { >>>> a primeira cor Ç azul       }
          repeat
                tecla:=readkey;
                  case ord(tecla) of
                    80: begin                { >>>> move setinha pra baixo  }
                        apgsetinha(520,y_setinha);{   apaga seta anterior   }
                        y_setinha:=y_setinha+20;  {  incrementa a coord y   }
                        if y_setinha > 437    {verif se coord y ta no limite}
                           then begin
                                y_setinha:=437;{       fixa limite          }
                                cor:=cor-1;    {       volta uma cor        }
                                end;
                        setinha(520,y_setinha);{    desenha outra setinha   }
                        cor:=cor+1;            {       almenta uma cor      }
                        end;
                    72: begin                { >>>> move setinha pra cima   }
                        apgsetinha(520,y_setinha);{   apaga seta anterior   }
                        y_setinha:=y_setinha-20;  {  incrementa a coord y   }
                        if y_setinha < 157    {verif se coord y ta no limite}
                           then begin
                                y_setinha:=157;{       fixa limite          }
                                cor:=cor+1;    {      almenta uma cor       }
                                end;
                        setinha(520,y_setinha);{    desenha outra setinha   }
                        cor:=cor-1;            {       volta uma cor        }
                        end;
                  end;
          until ord(tecla)=13;      { ate tecla enter                       }
          setfillstyle(1,cor);             { >>>> prep p/ preencher com cor }
          floodfill(487,310,15);           { >>>> pinta o retangulo         }
          readkey;                         { >>>> espera uma tecla ser prec.}
          settextstyle(0,0,1);             { >>>> texto normal              }
          setlinestyle(0,0,normwidth);     { >>>> letra normal              }
          end;
{***************************************************************************}
procedure barras(y,cor:word);                      { desenha barrras ao }
          begin                                    {   lado da pista    }
          setfillstyle(1,cor);         { >>>> cor das barras - escolha  }
          bar(142,y-100,147,y);        { >>>> barras Ö esquerda da pista}
          bar(502,y-100,507,y);        { >>>> barras Ö direita da pista }
          end;
{***************************************************************************}
procedure colisao(x,y:integer);        {  Faz o dezenho de uma explosao   }
          begin                         { para quando as naves colidirem }
          setcolor(6);                        { >>>> cor do texto laranja }
          setlinestyle(solidln,0,thickwidth); { >>>> linha grossa         }
          line(x-20,y,x-40,y-50);             {     corpo da explosao     }
          line(x-40,y-50,x-15,y-30);          {                           }
          line(x-15,y-30,x-5,y-60);           {                           }
          line(x-5,y-60,x+5,y-25);            {                           }
          line(x+5,y-25,x+15,y-70);           {                           }
          line(x+15,y-70,x+20,y-20);          {                           }
          line(x+20,y-20,x+40,y-25);          {                           }
          line(x+40,y-25,x+20,y);             {                           }
          line(x-20,y,x-45,y);                {                           }
          line(x-45,y,x-8,y+10);              {                           }
          line(x-8,y+10,x-15,y+35);           {                           }
          line(x-15,y+35,x+5,y+5);            {                           }
          line(x+5,y+5,x+30,y+30);            {                           }
          line(x+30,y+30,x+20,y);             {                           }
          setfillstyle(solidfill,yellow);     { >> prep p/ pintar de amarelo}
          floodfill(x-10,y-15,6);             { >>>> coord. p/ pintar de    }
                                              { de amarelo ate cor laranja  }
          setlinestyle(solidln,0,normwidth);  { >>>> linha normal           }
          end;
{***************************************************************************}
procedure tiro(x,y,cor:integer);             { Faz o tiro da nave       }
          begin
          setcolor(cor);                     { >>> a cor do texto Ç uma var }
          setlinestyle(solidln,0,thickwidth);{ >>> estilo da linha - grossa }
          line(x,y,x,y-20);                  { >>> coodenadas para a linha  }
          setlinestyle(solidln,0,normwidth); { >>> estilo da linha normal   }
          end;
{***************************************************************************}
function conta_pontos(pontos,p1,p2:integer):boolean;  {   Faz a contagem  }
         begin                                        {     dos pontos    }
         if p1=1                        { > verf se a var um Ç igual a um }
            then begin                  { >> se for...                    }
                 conta_pontos:=true;    { >>> a funá∆o recebe verdadeiro  }
                 end;
         if p2=1                       { > verf se a var dois Ç igual a um }
            then begin                 { >> se for...                      }
                 conta_pontos:=false;  { >>> a funá∆o recebe falso         }
                 end;
         end;
{**************************************************************************}
procedure inicializacoes;                 { Faz as inicializaá‰es das }
          var texto: string;
          begin                           {        vari†veis              }
          cleardevice;
          b:=0;                           { >>>> var. para barras         }
          b2:=30;                         { >>>> var. para barras         }
          v:=30;                          { >>>> var. do delay            }
          pontos:=50;                     { >>>> inicializa os pontos     }
          vidas:=5;                       { >>>> inicaliza as vidas       }
          w:=0;
          y:=340;                { >>>> var p/ a coord y do tiro }
          cornav := random (15) + 2;      { >>>> var para cor da nave     }
          x_nav := 313;                   { >>>> coord. x da nave apolo_15}
          x_adv := random(250)+205;       { >>>> coord. x da nave advers. }
          y_adv :=0;                      { >>>> coord. y da nave advers. }
          v_adv :=3;                      { >>>> velocid. da nave advers. }
          for cont:=1 to 1300 do          { >>>> fundo estrelado          }
          if cor=3                        { >>>> se a cor for ciano       }
             then putpixel(random(650),random(490),9){estrelas azuis claro}
             else putpixel(random(650),random(490),3);{estrelas ciano     }
          setcolor(cor);                  { >>>> cor escolhidado do texto }
          rectangle(10,138,130,280);      { >>>> retangulo p/ os comandos }
          rectangle(10,38,130,120);       { >>>> retangulo p/ os pontos   }
          rectangle(520,38,620,150);      { >>>> retangulo para as vidas  }
          Setfillstyle(solidfill,0);      { >>>> prep p/ pintar de preto  }
          floodfill(11,142,cor);          { >>> pinta nessas cood atÇ cor }
          floodfill(11,40,cor);           { >>> pinta nessas cood ate cor }
          floodfill(522,49,cor);          { >>> pinta nessas cood ate cor }
          setcolor(7);                   { >>>> cor do texto cinza        }
          outtextxy(57,170,'Acerela');   { >>>> escreve a palav 'Acerela' }
          outtextxy(57,185,'Freia');     { >>>> escreve a palav 'Freia'   }
          outtextxy(57,200,'Direita');   { >>>> escreve a palav 'Direita' }
          outtextxy(57,215,'Esquerda');  { >>>> escreve a palav 'Esquerda'}
          outtextxy(57,230,'Atira');     { >>>> escreve a palav 'Atira'   }
          outtextxy(57,245,'Pausa');     { >>>> escreve a palav 'Pausa'   }
          outtextxy(57,260,'Sair' );
          setcolor(15);                  { >>>> cordo texto branco        }
          outtextxy(17,170,chr(24));    { >> dezenha uma setinha p/ cima    }
          outtextxy(17,185,chr(25));    { >> dezenha uma setinha p/ baixo   }
          outtextxy(17,200,chr(26));    { >> dezenha uma setinha p/ direita }
          outtextxy(17,215,chr(27));    { >> dezenha uma setinha p/ esquerda}
          outtextxy(17,230,'Esp');         { >>>> escreve a palav 'Esp'     }
          outtextxy(17,245,'P  ');         { >>>> escreve a letra 'P'       }
          outtextxy(17,148,'COMANDOS :');  { >>>> escreve a palav 'COMANDOS'}
          outtextxy(530,48,'VIDAS');       { >>>> escreve a palav 'VIDAS'   }
          outtextxy(17,48,'PONTUAÄAO :');  { >>>> escreve a palav 'PONTUAÄAO'}
          outtextxy(17,260,'Esc');
          outtextxy(67,97,'Pontos');       { >>>> escreve a palav 'Pontos'  }
          settextstyle(8,0,2);         { >>>> especifica o estilo de texto  }
          str(vidas,vida);             { >>>>  transf o inteiro vidas       }
                                       {          na string vida            }
          setcolor(7);                 { >>>> cor do texto cinza            }
          settextstyle(7,0,9);         { >>>> especifica o estilo de texto  }
          outtextxy(550,40,vida);      { >>>> escrev a string vida nas cood.}
          settextstyle(7,0,1);         { >>>> especifica o estilo de texto  }
          setcolor(15);                { >>>> cor do texto branco           }
          outtextxy(520,10,nome);      { >>>> escreve o nome do jogador     }
          end;
{*************************************************************************}
procedure fundo;                               { Faz o fundo do programa}
          begin
          setlinestyle(solidln,0,normwidth);  { >>>> estilo da linha normal}
          setcolor(cor);                      { >>>> cor do texto - escolha}
          line(150,1,150,479);                { >>>> lado esquedo da pista }
          line(499,1,499,479);                { >>>> lado direito da pista }
          Setfillstyle(solidfill,0);          { >>>> estilo de preenximento}
          floodfill(300,402,cor);             { >>>> pinta a pista de preto}
          end;
{*************************************************************************}
procedure jogo;                               { Faz o jogo em si  }
          begin
          if w=1                      { và se a tecla do tiro foi precionada}
             then begin
                  tiro(x,y,0);            { >>>> apaga o primeiro tiro      }
                  y:=y-30;                { >>>> faz a coord y "subir"      }
                  delay(10);              { >>>> atrazo                     }
                  tiro(x,y,cor);          { >>>> dezenha outro tiro         }
                  if (y < y_adv+20)       { > verif se tiro ta na alt d nave}
                     then if (x_adv-46 < x) and (x_adv+43 > x){> verif se o }
                          then begin                 { tiro na nas coord    }
                               colisao(x_adv,y_adv); { >>>> esplosao        }
                               delay(200);           { >>>> atrazo          }
                               setfillstyle(1,0);    { barra preta          }
                               bar(x_adv-45,y_adv-70,x_adv+45,y_adv+35);{   }
                               y_adv:=610; { >>>> coord y do adv            }
                               w:=0;       { >>>> possibilita um novo tiro  }
                               pont2:=1;   { >>>> codigo p/ marcar pontos   }
                               end;
                  end;
          for b2:=0 to 5 do                       { >>>> faz as barras ao }
              barras(150*b2+b,cor);               {      lado da pista    }
          if y_seta=400                     { verif qual nave foi escolhida }
             then nave(x_nav,445,cor)             { >>>> nave do jogador  }
             else nave2(x_nav,420,cor);           {                       }
          cor5:=getpixel(x_adv + 40, y_adv + 23); { >>> pega cor das cood }
          cor1:=getpixel(x_adv - 40, y_adv + 23); { >>> pega cor das cood }
          cor2:=getpixel(x_adv - 40, y_adv - 50); { >>> pega cor das cood }
          cor3:=getpixel(x_adv + 40, y_adv - 50); { >>> pega cor das cood }
          cor4:=getpixel(x_adv, y_adv +15);       { >>> pega cor das cood }
          if (cor5=cor) or (cor1=cor) or (cor2=cor) or (cor3=cor) or (cor4=cor)
             then begin             { Se uma dessas cores for igual Ö cor...}
                  colisao(x_adv,y_adv); { >> dezenha colisao na nave advers }
                  colisao(x_nav,400);   { >> desenha colisao na nave do jog }
                  delay(200);           { >>>> intervalo para proseguir     }
                  setfillstyle(1,0);    { >>>> prep pra preencher de preto  }
                  bar(x_adv-45,y_adv-70,x_adv+45,y_adv+35);{ apaga colis_adv}
                  bar(x_nav-45,330,x_nav+45,435);   { apaga colisao do jogad}
                  y_adv:=610;           { >>>> cood y do adv recebe 610     }
                  if y_seta=400             { verif qual nave foi escolhida }
                     then apgnave(x_nav,480)  { >>>> apaga nave do jogador..}
                     else apgnave2(x_nav,420);{                             }
                  x_nav:=313;           { >>>> ... e coloca no centro       }
                  vidas:=vidas-1;       { >>>> incrementa o valor de vidas  }
                  str(vidas,vida);      { >>>> transf o inteiro vidas na    }
                                        {           string  vida            }
                  setfillstyle(solidfill,0); { >>>> estilo de preenchimento }
                  bar(530,55,610,140);  { >>>> dezenha uma barra preta      }
                  setcolor(7);          { >>>> cor do texto branco          }
                  settextstyle(7,0,9);  { >>>> estilo do texto - maior      }
                  outtextxy(550,40,vida); { >>>> escreve a string vida      }
                  settextstyle(7,0,1);  { >>>> estilo de texto - normal     }
                  if vidas = 0          { >>>> se vidas iguala zero...      }
                     then fim:=true;    { >>>> fim recebe condicao de saida }
                  end;
          if fim = false                { >>>> se fim igual a falso    }
             then begin                 { entao...                     }
          if y_seta=400                     { verif qual nave foi escolhida }
             then nave(x_adv,y_adv,cornav)    { >>>> nave do advers†rio     }
             else nave2(x_adv,y_adv,cornav);  {                             }

          delay(v);                           { >>>> intervalo para animaá∆o}

          for b2:=0 to 5 do                   { >>>> apaga barras ao        }
              barras(150*b2+b,0);             {         lado da pista       }
          if y_seta=400                       {verif qual nave foi escolhida}
             then apgnave (x_adv , y_adv + 25)  { >>>> apaga a nave do advers.}
             else apgnave2(x_adv , y_adv + 25); {                             }
          y_adv := y_adv + v_adv;             { >>>> desce a nave do adv de }
                                              {      acordo com a velocidade}
          b := b + 7;                         { >>>> desce as barras        }
          if b > 150                          { >>>> verif. se as barras    }
             then b := 0;                     {      chegaram no limite da  }
                                              {      tela e faz recomeáar   }
          if y_adv > 530                      { >>>> verif. se a nave adv.  }
             then begin                       {      chegou no fim da tela  }
                if y_adv=610 + v_adv          { >>>> verif se adv levou tiro}
                   then pont1:=0              { >>>> incapaz d alment pontos}
                   else pont1:=1;             { >>>> prep p/ almentar pontos}
                  y_adv := 0;                 { >>>> faz outra nave advers.}
                  cornav := random(8);        { >>>> cor aleat¢ria da nave }
                  if cornav=0                 { >>>> verif. se nave Ç preta}
                     then cornav:=7;          {      substitui por cinza   }
                  if cornav=6                 { >>>> verif. se nave Ç laranja}
                     then cornav:=8;          {      substitui por grafite }
                  if cornav=cor               { >>>> verif. se nave Ç cor  }
                     then cornav:=cor+1;      {      substitui por vermelha}
                  x_adv := random (250)+205;  { >>>> poziá∆o x aleat¢ria da }
                                              {      nave advers†ria        }
                  v_adv := random (4) + 3;    { >>>> veloc. aleat. nave adv }
                  end;
          if conta_pontos(pontos,pont1,pont2)=true { và se a funcao Ç verdad}
             then pontos:=pontos+10;        { se for os pontos almentam dez }
          if conta_pontos(pontos,pont1,pont2)=false{ và se a funcao Ç falsa }
             then pontos:=pontos+15;         { se for os pontos dimin. cinco }
          setcolor (7);                      { >>>> cor do texto cinza      }
          setfillstyle(1,0);                 { >>>> estilo de preenchimento }
          bar(16,60,99,90);                  { >>>> coord da barra preta    }
          str (pontos, ponto);      { >>>> transf o inteiro na string ponto }
          outtextxy (17, 60, ponto);  { >>>> coord p/ escrev a string pomto }
          pont1:=0;                   { >>>> reinicializa ponto1            }
          pont2:=0;                   { >>>> reinicializa ponto2            }
          end;
          end;
{***************************************************************************}
procedure teclas;                       { Indica a funá∆o de cada tecla }
          begin
          tecla:=readkey;               { Là tecla }
            case ord(tecla) of
                 77: begin                  { >>>>>> move nave para direita }
                     if y_seta=400          { verif qual nave foi escolhida }
                        then apgnave (x_nav, 480){apaga posiá∆o anter da nave}
                        else apgnave2(x_nav,420);{                           }
                     x_nav := x_nav + 5;    {      move para direita        }
                     if x_nav > 455         {verif. se nave chegou no limite}
                        then x_nav := 455;  {       fixa o limite           }
                     if y_seta=400          { verif qual nave foi escolhida }
                        then nave(x_nav,445,cor)  {coloca nave na prox posicao}
                        else nave2(x_nav,420,cor);{                           }
                     end;
                 75: begin                  { >>>>> move nave para esquerda }
                     if y_seta=400          { verif qual nave foi escolhida }
                        then apgnave (x_nav, 480){apaga posiá∆o anter. da nave}
                        else apgnave2(x_nav,420);{                            }
                     apgnave(x_nav, 480);     {  apaga posiá∆o anter. da nave }
                     x_nav := x_nav - 5;    {      move para esquerda       }
                     if x_nav < 193         {verif. se nave chegou no limite}
                        then x_nav :=193;   {       fixa o limite           }
                     if y_seta=400          { verif qual nave foi escolhida }
                        then nave(x_nav,445,cor)  {coloca nave na prox posicao}
                        else nave2(x_nav,420,cor);{                           }
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
                 32: begin                  { >>>> Tiro da nave              }
                      tiro(x_nav,y,1);      {      faz o tiro inicial        }
                      y:=340;               {  inicializa a coord y do tiro  }
                      w:=1;                 { condicao p/ que a coord y mude }
                      x:=x_nav;             { fax com que a coord x nao mude }
                      end;
                 112: begin                    { >>>> Pausa o jogo          }
                      if y_seta=260          { verif qual nave foi escolhida }
                         then apgnave (x_nav,480) {        apaga a nave      }
                         else apgnave2(x_nav,420);{                          }
                      settextstyle(8, 0, 2);    {  indica o estilo do texto  }
                      setcolor(15);             {     cor do texto branca    }
                      outtextxy(260,250,' QUE FOI?');{ escreve mensagem      }
                      outtextxy(200,300,'Ja vai no banheiro Ç?');{           }
                      readkey;             { espera uma tecla ser precionada }
                      end;
                 27: fim:=true;              { >>>> condicao de saida       }
            end;
          end;
{***************************************************************************}
Procedure saida;
          begin
          cleardevice;                   { >>>> limpa a tela              }
          setcolor(1);                   { >>>> cor do texto azul         }
          rectangle(1,1,629,479);        { >>>> retangulo da tela toda    }
          settextstyle(7,0,9);           { >>>> letra grande              }
          outtextxy(220,120,'FIM');      { >>>> escreve 'fim'             }
          settextstyle(7,0,1);           { >>>> letra pequena             }
          outtextxy(270,230,'DO JOGO');  { >>>> escreve 'do jogo'         }
          setcolor(7);                   { >>>> cor cinza do texto        }
          settextstyle(7,0,2);           { >>>> letra um poquim maior     }
          outtextxy(180,300,'Voce conseguiu '+ponto+' pontos!!!');{ frase }
          delay(1000);                   { >>>> atrazo                    }
          readkey;                       { espera uma tecla ser precionada}
          end;
{***************************************************************************}
{*************************** PROGRAMA PRINCIPAL ****************************}
{***************************************************************************}
begin
inicia_grafico;
setbkcolor(black);
entrada;
inicializacoes;
repeat
   repeat
      fundo;
      jogo;
   until keypressed;
   teclas;
until fim;
saida;
closegraph;
end.
