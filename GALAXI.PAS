(* ----------------------------------Andre luis
a2a-e.eletronica
N ß 04
                TRABALHO DE FINAL DE CURSO
                         R$ 1000,00

EM  20-01-01--------------------------------------------*)
program invasao;
uses crt,graph;
CONST nome_arq='C:\galax.dta';
       corfundo=black;
type
    galaxia=record
       nome:string[5];
       ponto:integer;
    end;
var
   cont,x,y,xnav,ynav,xatir,yatir,xbala,ybala:integer;
   tecla:char;
   atira,volta:boolean;
   pontos,vidas,velostr:string[4];
   ponto,vida,VELOCIDADE,tamanho,cor,km,dificuldade :word;
   p,p1:pointer;
   arq:file of galaxia;
   aux:galaxia;


begin
  clrscr;
  writeln;
  textbackground(corfundo);
  textcolor(red);
  writeln('Invasao da terra');
  TEXTCOLOr(yellow);
  writeln('AJUDA');
  textcolor(6);
  writeln;
  writeln('<Barra de espaáo> Atira');
  writeln('<P>Pausa');
  writeln('<-- e --> (teclas de Movimento)');
  writeln('OBS..Sua miss∆o Ç proteger a terra de alien°genas');
  writeln('<DICA> Procure ficar no meio da tela');
  writeln('BOA SORTE !');
  writeln('Andre luis a2a-ee');
  writeln;
  write('Digite a Dificultade 1..4 :');
  writeln;

  readln(dificuldade);
  x:=detect;
  initgraph(x,y,'c:\bp\bgi');      (*INICIA O MODO GRAFICO*)
  xatir:=300; yatir:=350;  VELOCIDADE:= 30;
  vida:=3;
  xnav:=100;
  ynav:=50;                (*INICIALIZACA0 DE VARIAVEIS*)
  cont:=0;
  cor:=0;
  km:=5;
  VOLTA:=false;


  PONTO:=0;
  (*DESENHA DA NAVE*)

  setcolor(white);
  ellipse(xnav,ynav,0,360,30,10);
  setfillstyle(1,red);
  floodfill(xnav+1,ynav+1,white);
  setfillstyle(1,corfundo);
  sector(xnav,ynav,0,180,5,10);
  settextstyle(2,0,3);
  setcolor(green);
  outteXTxy(xnav-18,ynav,'M A R T E');


 (*CAPTURA A IMAGEM DA NAVE*)

 tamanho:=imagesize(Xnav-30,ynav-10,xnav+30,ynav+10);
 getmem(p,tamanho);
 getimage(Xnav-30,ynav-10,xnav+30,ynav+10,p^);
 cleardevice;

 (* PINTA A TELA COM PIXELS (ESTRELAS)*)

 for x:=1 to 200 do
     begin
       x:=random(680);
       y:=random(400);
       putpixel(x,y,white);
     end;

 (*PEGA IMAGEM DO FUNDO*)

 getmem(p1,imagesize(Xnav-30,ynav-10,xnav+30,ynav+10));
 getimage(Xnav-30,ynav-10,xnav+30,ynav+10,p1^);

 repeat

      cleardevice;
      setcolor(4);
      settextstyle(1,1,1);                   (*ESCREVE O NOME DO JOGO*)
      outtextxy(590,100,'Invasao da terra');
      for x:=1 to 200 do
          begin
               cor:=cor+1;        (*DESENHA NOVAS ESTRLAS*)
               x:=random(680);
               y:=random(400);
               putpixel(x,y,cor);
          end;
         cor:=0;
      setfillstyle(1,8);
      baR(xatir,yatir,xatir+80,yatir+10);   (*DESENHA A NOVA NAVE*)
      setcolor(red);
      line(xatir+40,yatir,xatir+40,yatir-4);
      setcolor(green);
      settextstyle(2,0,4);
      outtextxy(xatir+15,yatir-1,'N A S A');
      sETFILLSTYLE(1,black); (*APAGA O VELHO PLACAR*)
      bar(10,450,580,480);
      str(ponto,pontos);     (*CONVERTE OS PONTOS PARA STRING*)
      str(vida,vidas);
      str(km,velostr);
      setcolor(green);
      settextstyle(1,0,2);
      outtextxy(100,450,'Pontos : '+pontos);

      outtextxy(250,450,'Vidas : '+vidas);      (*ESCREVE PONTOS E VIDAS*)
      outtextxy(400,450,'Velocidade : '+velosTR + ' KM \ S');
      repeat                (*CALCULA NOVA COORDENADA DA NAVE*)
            xnav:=random(500);
      until xnav>40;
      ynav:=40;
      atira:=false;

      setbkcolor(corfundo);
      repeat
            setcolor(blue);
            setfillstyle(1,9);
            sector(300,420,0,180,250,55);   (*DESENHA O PLANETA TERRA*)
            setcolor(8);
            setfillstyle(1,8);
            sector(600,400,0,360,20,17);
            settextstyle(2,0,5);
            setcolor(brown);
            outteXTxy(250,380,'T E R R A');
            repeat
                  volta:=false;
                  putimage(xnav-30,ynav-10,p^,normalput);(*DESENHA A NAVE*)
                  delay(velocidade);
                  putimage(xnav-30,ynav-10,p1^,normalput);(*DESENHA O FUNDO*)

                  freemem(p1,imagesize(Xnav-30,ynav-10,xnav+30,ynav+10));
                  ynav:=ynav+1;
                   (*INCREMENTA  A COORDENADA DE DESCIDA DA NAVE*)

                            (*CAPTURA A NOVA IMAGEM DO FUNDO*)
                  getmem(p1,imagesize(Xnav-30,ynav-10,xnav+30,ynav+10));
                  getimage(Xnav-30,ynav-10,xnav+30,ynav+10,p1^);

                  if atira=true then
                      begin
                           volta:=false;
                           ybala:=ybala-10;
                           setcolor(14);
(*<ATIRA>*)                line(xbala+40,ybala,xbala+40,ybala+10);
(*CADA VEZ QUE PASSA*)     delay(3);
(*DESENHA E APAGA A BALA*) Setcolor(corfundo);
                           line(xbala+40,ybala-10,xbala+40,ybala+10);
                       end;
                      if ynav>ybala then atira:=false;  (*DESABILITA A BALA*)


                      IF ((YBala>=ynav-5)and(ybala<=ynav+5))
                      and((xbala>=xnav-60) and(xbala<=xnav+30)) then
                        begin
                          sound(200);delay(100);nosound;
                          cont:=cont+1;     (*CONTA O TIRO E SOA UM BEEP*)
                          setfillstyle(1,corfundo);
                          if cont=dificuldade+1 then
                             begin
                             cont:=0; (*SE FOR O TIRO do nivel EXPLODE A NAVE*)
                             bar(Xnav-50,ynav-30,xnav+50,ynav+30);
                             for x:=1 to 40 do
                               begin
                                 setcolor(yellow);
                                 delay(2);               (*explode anave*)
                                 circle(xnav,ynav,x);
                               end;

                             setfillstyle(1,corfundo);
                             if velocidade<>2 then
                               BEGIN         (*AUMENTA A VELOCIDADE*)
                                 VELOCIDADE:=velocidade-2;
                                 km:=km+10;
                               end;
                               bar(Xnav-50,ynav-50,xnav+50,ynav+50);
                               volta:=true;
                               ponto:=ponto+10; (*APAGA A EXPLOSAO*)
                        end;
                      end;
                      if ynav=yatir-25 then
                        begin
                          for x:=1 to +40 do
                            begin  (*SE A NAVE ATINGIR A TERRA EXPLODE*)
                              setcolor(yellow);
                              delay(2);
                              circle(xnav,ynav,x);
                            end;
                          sound(200);delay(100);nosound;
                          sound(0);delay(100);nosound;  (*SOM DA EXPLOSAO*)
                          sound(156);delay(100);nosound;
                          setfillstyle(1,corfundo);
                          bar(Xnav-50,ynav-40,xnav+50,ynav+40);
                          volta:=true;
                          vida:=vida-1;   (*DIMINUI A VIDA E SOA UM BEEP*)
                          setcolor(blue);
                          setfillstyle(1,9);
                          sector(300,420,0,180,300,55);
                        end;

            if volta=true  then  begin
                      y:=random(100);
                      for x:=y to Y+100 do
                          begin
                              putpixel(x,x,white);
                              delay(3);    (*estrela cadente*)
                              putpixel(x,x,black);
                          end;
            end;
            until (keypressed) or (volta=true);
            if volta<>true then
               tecla:=upcase(readkey);(*PEGA A VARIAVEL TECLA*)
            setfillstyle(1,corfundo); (* APAGA O RASTRO DA NAVE DEFENSORA*)
            baR(xatir-1,yatir-5,xatir+81,yatir+11);
            case tecla of
                  #77:xatir:=xatir+10;
                  #75:xatir:=xatir-10;(* VERIFICA AS TECLAS E GERA OS EVENTOS*)
                  #32:begin
                           atira:=true;
                           xbala:=xatir;  (*INICIALIZA A BALA*)
                           ybala:=yatir-5;
                      end;
                  'P':repeat until keypressed;(*PAUSA*)


             end;
             if xatir=10 then xatir:=xatir+10;(*barramento da nave defensora*)
             if xatir=570 then xatir:=xatir-10;
             setcolor(red);
             line(xatir+40,yatir,xatir+40,yatir-4);
             setfillstyle(1,8);
             baR(xatir,yatir,xatir+80,yatir+10);   (*DESENHA A NOVA NAVE*)
             setcolor(green);
             settextstyle(2,0,4);
             outtextxy(xatir+15,yatir-1,' N A S A');
     until (tecla=#27) or  (volta=true) ;
  until (tecla=#27) or(vida=0);
freemem(p,imagesize(Xnav-50,ynav-30,xnav+50,ynav+30));(*LIBERA A MEMORIA*)

(*ENCERRAMENTO DO JOGO*)

if vida=0 then
	begin
		cleardevice;
		setcolor(blue);
		settextstyle(1,0,5);
		outtextxy(230,200,'Game over');
                settextstyle(1,0,1);
                outtextxy(70,300,'Este jogo foi feito por Andre Luis <A2a> E.eletronica');
		delay(1500);
                sound(200);delay(100);nosound;
                sound(0);delay(100);nosound;
                sound(156);delay(100);nosound;
                sound(300);delay(200);nosound;(*SOM DE ENCERRAMENTO*)
                sound(0);delay(100);nosound;
                sound(156);delay(100);nosound;
		delay(2000);
	end;
closegraph;

(*  verifica o recordE*)

assign(arq,nome_arq);
{$I-}
reset(arq);
{$I+}
if (ioresult<>0)  then
	begin
		rewrite(arq);
		aux.ponto:=0;
		aux.nome:='-----';
		write(arq,aux);
	end;
if filesize(arq) =0 then
begin
	aux.ponto:=0;
	aux.nome:='-----';
	write(arq,aux);
end;
seek(arq,0);
read(arq,aux);
if ponto >aux.ponto then
	begin
		writeln('< NOVO  RECORD > Digite seu nome : ');
		read(aux.nome);
		aux.ponto:=ponto;
		seek(arq,0);               (*Novo record*)
		write(arq,aux);

        end
else
                begin    (*MOSTRA O HALL DA FAMA*)

			SEEK(ARQ,0);
			read(arq,aux);
			writeln;
			textcolor(red);
			writeln('HALL DA FAMA');
			textcolor(yellow);
			WRITELN(aux.NOME,' com ',aux.ponto,' pontos');
			close(arq);
		end;
readkey;
(*T c h a u     !!!!!!!!!!!!!! ---------------------
Nota = 10,0 ---------------------------------------*)
end.
