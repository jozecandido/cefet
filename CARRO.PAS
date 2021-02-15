{¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ JOGO DO CARRINHO ®®®®®®®®®®®®®®®®®®®®®®®®®®®®®®
 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ Designer Producer: Gustavo ®®®®®®®®®®®®®®®®®®®®®®®®®
 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ Concluido em 30 de Janeiro de 2001 ®®®®®®®®®®®®®®®®®®®®}

program carro;
uses graph, crt;

var ycar, xcar, vcar, xarv, yarv, x0car, nivel, corcaradv, corcarro, v: word;
    i, j, ja, cpix1, cpix2, cpix3, vidas: word;
    pontos: integer;
    nome: string;
    t: char;
    sai: boolean;

                  {Variaveis globais: corcarro, nivel, nome}

{*************************************************************************}

Procedure Inicia_grafico;                         {Iniciando o modo grafico}

var drivegrafico, modografico, codigoerro: integer;

begin
  drivegrafico := detect;
  initgraph (drivegrafico, modografico, 'C:\pascal\bgi');
  codigoerro := graphresult;
  if codigoerro <> grOK
    then begin
           writeln ('Erro Grafico: ', grapherrormsg(codigoerro));
           halt (1);
         end;
end;

{*************************************************************************}

Procedure carrinho (x, y, cor: word);                   {Desenha um carro}

begin
  setfillstyle (1, 8);
  bar (x - 5, y - 50, x + 3, y - 40);                   {Roda superior esq}
  bar (x - 5, y - 21, x + 3, y - 11);                   {Roda inferior esq}
  bar (x + 22, y - 50, x + 31, y - 40);                 {Roda superior dir}
  bar (x + 22, y - 21, x + 31, y - 11);                 {Roda inferior dir}
  setfillstyle (1, cor + 8);
  setcolor (cor + 8);
  bar (x, y - 51, x + 26, y - 8);                       {corpo}
  pieslice (x + 13, y - 67, 233, 307, 20);
  setfillstyle (1, cor);
  setcolor (8);
  bar (x, y - 68, x + 25, y - 63);                      {bico}
  bar (x - 5, y - 9, x + 30, y);                        {aerof¢lio}
  fillellipse (x + 13, y - 33, 6, 8);                   {capacete}
  setcolor (7);
  setfillstyle (1, 7);
  fillellipse (x - 2, y - 31, 3, 6);                    {Elipses respons veis}
  fillellipse (x + 27, y - 31, 3, 6);                   {pela curvas do carro}
end;

{*************************************************************************}

Procedure scarrinho (x, y: word);                       {Apagar um carro}

begin
  setfillstyle (1, 7);
  bar (x - 5, y - 68, x + 31, y);
end;

{*************************************************************************}

Procedure seta (x: word);          {Desnha a seta da escolha do carro}

begin
  setcolor (14);
  setfillstyle (1, 14);
  moveto (x + 10, 400);
  lineto (x + 20, 412);
  lineto (x, 412);
  lineto (x + 10, 400);
  floodfill (x + 10, 405, 14);
end;

{*************************************************************************}

Procedure semseta (x: word);             {Apaga a seta}

begin
  setfillstyle (1, 0);
  bar (x, 400, x + 20, 415);
end;

{*************************************************************************}

Procedure coracao (x, y, vida: word);
                          {Desenha um coracao p/ representar as vidas}
var aux: word;

begin
  setcolor (4);
  setfillstyle (1, 4);
  for aux := 1 to vida do
    begin
      ellipse (x + 6, y + 5, 0, 230, 6, 5);
      ellipse (x + 18, y + 5, 310, 180, 6, 5);
      moveto (x + 3, y + 10);
      lineto (x + 12, y + 20);
      lineto (x + 21, y + 10);
      floodfill (x + 6, y + 10, 4);
      x := x + 30;
    end;
end;

{*************************************************************************}

Procedure abertura;
                           {Respons vel pelas telas de apresentacao do jogo}
var xcar, xseta: word;
    tecla: char;
    ok: boolean;

begin

  setfillstyle (1, 0);
  bar (0, 0, 639, 479);
  setcolor (1);
  settextstyle (10, horizdir, 5);
  outtextxy (65, 120, 'FORMULA 2001');                {Nome do jogo}
  settextstyle (6, horizdir, 1);
  setcolor (15);
  outtextxy (237, 440, 'BY JOAO GUSTAVO');
  repeat                                     {Faz Piscar: 'PRESSIONE ...'}
    setcolor (14);
    outtextxy (200, 300, 'PRESSIONE QUALQUER TECLA');
    delay (700);
    setcolor (0);
    outtextxy (200, 300, 'PRESSIONE QUALQUER TECLA');
    delay (600);
  until keypressed;
                                           {Outra tela, a de opcoes}
  cleardevice;
  setcolor (2);
  outtextxy (53, 70, 'Digite o nome do jogador => ');
  readkey;
  gotoxy (37, 6);
  readln (nome);                           {Recebe o nome do jogador}
  outtextxy (53, 134, 'Escolha o nivel de dificuldade:');
  setcolor (7);
  outtextxy (150, 160, '1 - Facil');
  outtextxy (150, 180, '2 - Medio');
  outtextxy (150, 200, '3 - Dificil');

   {Quanto maior o nivel maior sera a velocidade dos carros adversarios}

  repeat                                   {So aceita os numeros 1, 2 ou 3}
    gotoxy (37, 10);
    readln (nivel);                        {Recebe o nivel}
    gotoxy (37, 10);
  until  (nivel = 1) or (nivel = 2) or (nivel = 3);
  setcolor (2);
  outtextxy (53, 253, 'Escolha seu carro: ');
  xcar := 100;
  corcarro := 1;
  repeat                             {Desenha os carrinhos de varias cores}
    carrinho (xcar, 380, corcarro);
    setcolor (0);
    setfillstyle (1, 0);
    fillellipse (xcar - 2, 349, 3, 6);
    fillellipse (xcar + 27, 349, 3, 6);
    xcar := xcar + 80;
    corcarro := corcarro + 1;

  until (corcarro = 7);

  xseta := 102;
  seta (xseta);
  ok := false;
  repeat
    tecla := readkey;
    case ord(tecla) of
       77: begin                               {Move a seta p/ direita}
             semseta (xseta);
             xseta := xseta + 80;
             if xseta > 510
               then xseta := 502;
             seta (xseta);
           end;
       75: begin                               {Move a seta p/ esquerda}
             semseta (xseta);
             xseta := xseta - 80;
             if xseta < 100
               then xseta := 102;
             seta (xseta);
           end;
       13: ok := true;                      {[ENTER] para selecionar o carro}
     end;
  until ok;
                 {-----   Corcarro = variavel global -----}
  corcarro := ((xseta - 102) div 80) + 1;

end;

{*************************************************************************}

procedure largada;           {Desenha as luzes que acendem p/ largar}

begin
  setfillstyle (1, 0);
  setcolor (0);
  bar3d (230, 210, 390, 250, 8, topon);
  setcolor (8);
  circle (270, 230, 15);
  circle (310, 230, 15);
  circle (350, 230, 15);
  setfillstyle (1, 4);
  delay (1200);
  fillellipse (270, 230, 15, 15);
  delay (1200);
  fillellipse (310, 230, 15, 15);
  delay (1200);
  fillellipse (350, 230, 15, 15);
  delay (1200);
  setfillstyle (1, 0);
  setcolor (0);
  bar3d (230, 210, 390, 250, 8, topon);
  setcolor (8);
  circle (270, 230, 15);
  circle (310, 230, 15);
  circle (350, 230, 15);
  delay (400);
  setfillstyle (1, 7);
  bar (230, 200, 400, 260);
end;

{*************************************************************************}

Procedure escreve_pontos (x: integer);
                              {Escreve os pontos conseguidos pelo jog}
var pont_str: string;

begin
  setfillstyle (1, 10);
  bar (480, 35, 639, 60);
  str (x, pont_str);    {Transforma um numero inteiro em uma string}
  setcolor (0);
  settextstyle (0, 0, 1);
        {Centraliza e escreve na tela o total de pontos do jogador}
  outtextxy ((550 - (textwidth ('Pontos: ' +pont_str ) div 2)), 40, 'Pontos: ' +pont_str );
end;

{*************************************************************************}

Procedure ajuda;                       {Mostra os comandos}

begin
  setcolor (0);
  settextstyle (0, 0, 1);
  outtextxy (520, 200, 'COMANDOS');
  outtextxy (500, 250, chr (24));
  outtextxy (506, 250, ': Acelera');
  outtextxy (500, 270, chr (25));
  outtextxy (506, 270, ': Freia');
  outtextxy (500, 290, chr (26));
  outtextxy (506, 290, ': Direita');
  outtextxy (500, 310, chr (27));
  outtextxy (506, 310, ': Esquerda');
  outtextxy (500, 330, 'P');
  outtextxy (506, 330, ': Pausa');
  outtextxy (500, 350, 'ESC: Sair');
end;

{*************************************************************************}

Procedure pista;                        {Desenha todo o cenario}

begin
  setfillstyle (1, 10);
  bar (0, 0, 639, 479);                                 {Grama}
  setfillstyle (1, 7);
  bar (180, 0, 460, 479);                               {Pista}
  setfillstyle (1, 15);
  bar (180, 0, 190, 479);                               {Meio-fio}
  bar (450, 0, 460, 479);                               {Meio-fio}
  setcolor (0);
  settextstyle (0, 0, 1);
         {Centraliza e escreve o nome do jogador no canto da tela}
  outtextxy ((550 - (textwidth (nome) div 2)), 20, nome);
  escreve_pontos (0);
        {Centraliza e escreve o nome 'Vidas: ' no canto da tela}
  outtextxy ((550 - (textwidth ('Vidas:') div 2)), 80, 'Vidas:');
  ajuda;
end;

{*************************************************************************}

Procedure barra (y: word);                              {Desenhar barras na
                                                               pista}
begin
  setfillstyle (1, 15);
  bar (275, y - 50, 278, y);                     {Barra da esquerda}
  bar (365, y - 50, 368, y);                     {Barra da direita}
end;

{*************************************************************************}

Procedure sbarra (y:word);                              {Apagar barras na
                                                              pista}
begin
  setfillstyle (1, 7);
  bar (275, y - 50, 278, y);
  bar (365, y - 50, 368, y);
end;

{*************************************************************************}

procedure matinho (x, y: word);             {      Desenha matinhos para dar}
                                            { a impressao de profundidade na}
begin                                       {                         arvore}
  moveto (x, y);
  setcolor (2);
  lineto (x - 3, y - 4);
  lineto (x + 5, y - 2);
  lineto (x + 8, y - 7);
  lineto (x + 11, y - 2);
  lineto (x + 18, y - 4);
  lineto (x + 15 , y);
  lineto (x, y);
  setfillstyle (1, 2);
  floodfill (x + 10, y - 1, 2);
end;

{*************************************************************************}

procedure arvore (x, y: word);                  {Desenha uma arvore}

begin
  setfillstyle (1, 6);
  bar (x, y - 30, x + 32, y);
  setfillstyle (1, 10);
  setcolor (10);
  pieslice (x - 10, y - 15, 0, 55, 20);
  pieslice (x - 10, y - 15, 305, 360, 20);
  pieslice (x + 43, y - 15, 125, 235, 20);
  setfillstyle (1, 2);
  setcolor (2);
  fillellipse (x + 3, y - 38, 7, 7);
  fillellipse (x + 3, y - 31, 7, 7);
  fillellipse (x + 21, y - 41, 7, 7);
  fillellipse (x + 12, y - 43, 7, 7);
  fillellipse (x + 15, y - 32, 9, 8);
  fillellipse (x + 27, y - 32, 7, 7);
  matinho (x + 26, y - 4);
  matinho (x - 4, y + 2);
end;

{*************************************************************************}

procedure sarvore (x, y: word);                  {Apaga uma arvore}

begin
  setfillstyle (1, 10);
  bar (x - 7, y - 50, x + 45, y + 2);
end;

{*************************************************************************}

procedure som_explosao;              {Tenta reproduzir o som de uma explosao}

  begin
    sound (70);
    delay (600);
    nosound;
  end;

{*************************************************************************}

procedure explosao (x, y: word);     {Desenha uma explosao}

begin
  moveto (x, y);
  setcolor (4);
  lineto (x + 10, y + 15);       {Desenha a estrela maior, amarela}
  lineto (x + 35, y);
  lineto (x + 20, y + 25);
  lineto (x + 45, y + 40);
  lineto (x + 15, y + 48);
  lineto (x - 4, y + 72);
  lineto (x - 2, y + 40);
  lineto (x - 28, y + 28);
  lineto (x - 8, y + 20);
  lineto (x, y);
  setfillstyle (1, 4);
  floodfill (x, y + 10, 4);
  som_explosao;

  delay (500);                   {Intervalo}

  moveto (x - 6, y - 25);
  setcolor (14);
  lineto (x + 15, y - 5);        {Desenha a estrela menor, vermelha}
  lineto (x + 50, y - 15);
  lineto (x + 40, y + 20);
  lineto (x + 62, y + 45);
  lineto (x + 25, y + 58);
  lineto (x - 10, y + 90);
  lineto (x - 20, y + 45);
  lineto (x - 48, y + 28);
  lineto (x - 20, y + 10);
  lineto (x - 6, y - 25);
  setfillstyle (1, 14);
  floodfill (x, y + 10, 14);

  delay (150);                   {Intervalo}

  moveto (x, y);
  setcolor (4);
  lineto (x + 10, y + 15);       {Desenha a estrela maior, amarela, novamente}
  lineto (x + 35, y);
  lineto (x + 20, y + 25);
  lineto (x + 45, y + 40);
  lineto (x + 15, y + 48);
  lineto (x - 4, y + 72);
  lineto (x - 2, y + 40);
  lineto (x - 28, y + 28);
  lineto (x - 8, y + 20);
  lineto (x, y);
  setfillstyle (1, 4);
  floodfill (x, y + 10, 4);
  readkey;
end;

{*************************************************************************}

Procedure fim_de_jogo;

begin
  setfillstyle (1, 0);
  bar (0, 0, 639, 479);
  setcolor (10);
  settextstyle (1, 0, 2);
  outtextxy (260, 220, 'FIM DE JOGO');
  readkey;
end;

{*************************************************************************}
{************************   PROGRAMA PRINCIPAL   *************************}
{*************************************************************************}



BEGIN

  inicia_grafico;                   {Rotina para inicializar o modo grafico}
  abertura;                                 {Chama as telas de abertura}
  pontos := 0;                              {Pontos iniciais}
  vidas := 3;                               {Quantidade de vidas iniciais}
  cleardevice;                              {Limpa a tela}
  pista;                                    {Desenha o cenario}
  coracao (510, 100, vidas);
  largada;                                  {Luzes acendendo}
  x0car := 310;                             {Var p/ a posicao x do carro}
  carrinho (x0car, 468, corcarro);          {Desenha carro do jogador}
  j := 0;                                   {Var auxiliar}
  v := 30;                                  {Velocidade dos carros adv}
  corcaradv := random (6) + 1;              {Cor aleatoria p/ o carro advers}
  vcar := 1;                                {Velocidade do carro}
  ycar := 0;                                {Posicao y do carro adversario}
  xcar := random (210) + 200;               {Posicao aleatoria x do carro adv}
  xarv := random (140);                     {Posicao aleatoria x da arvore}
  yarv := 0;                                {Posicao y da arvore}
  repeat
    repeat
      for ja := 0 to 5 do
        barra (86 * ja + j);                {Desenha as barras na pista}
      carrinho (xcar, ycar, corcaradv);     {Desenha carrinho adversario}
      carrinho (x0car, 468, corcarro);      {Desenha carro do jogador}
      arvore (xarv, yarv);                  {Desenha arvore}

 {Esta condicao abaixo verifica se ha um pixel de uma cor diferente de branco
   (cor da faixa) ou cinza (cor da pista) abaixo do carro adversario, se
     houver, quer dizer que o nosso carro bateu nele provocando uma
       explosao}

      if ycar < 450     {Faz-se esta verificacao antes do carro sair da pista}
        then
          begin
            cpix1 := getpixel ((xcar - 5), (ycar + 1));   {Cor do pixel esq}
            cpix2 := getpixel ((xcar + 31), (ycar + 1));  {Cor do pixel dir}
            cpix3 := getpixel ((xcar + 13), (ycar + 1));  {Cor do pixel centr}

            if ((cpix1 <> 7) and (cpix1 <> 15)) or ((cpix2 <> 7) and (cpix2 <> 15))
              or ((cpix3 <> 7) and (cpix3 <> 15))
                 then
                   begin
                     scarrinho (xcar, ycar);       {Apaga carrinho adversario}
                     scarrinho (x0car, 468);       {Apaga carrinho do jogador}
                     explosao (x0car + 10, 380);   {Explode}
                     setfillstyle (1, 10);
                     bar (510, 100, 600, 120);     {Apaga os antigos coracoes}
                     vidas := vidas - 1;           {Perde uma vida}
                     if vidas = 0                  {Se as vidas acabarem...}
                       then sai := true
                       else begin
                              pontos := pontos - 10;
                              pista;               {Redesenha a pista}
                              coracao (510, 100, vidas); {Desenha novos corac}
                              ycar := 550;
                              v := 20;
                            end;
                   end;
          end;

      delay (v);                            {Intervalo / Velocidade}

      for ja := 0 to 5 do
        sbarra (86 * ja + j);               {Apaga barras na pista}

      scarrinho (xcar, ycar);               {Apaga carro adv p/ desenha-lo
                                                  mais em baixo}
      sarvore (xarv, yarv);                 {Apaga arvore p/ desenha-la mais
                                                  em baixo}
      j := j + 5;
      if j > 86
        then j := 0;
      yarv := yarv + 5;
      if yarv > 530                      {Quando a arvore sair da tela...}
        then begin
               yarv := 0;
               xarv := random (140);     {Posicao aleatoria da arvore}
             end;
      ycar := ycar + vcar;               {O carro desce de acordo com a veloc}
      if ycar > 530
        then begin
               pontos := pontos + 10;      {Passando de um carro ganha pontos}
               escreve_pontos (pontos);
               ycar := 0;
               corcaradv := random (6) + 1; {Cor aleatoria do carro advers}
               xcar := random (210) + 200;  {Posicao aleatoria x do carro adv}
               vcar := random (4) + 2 * nivel; {Vel aleatoria do carro adv}
             end;                           {  dependendo do nivel escolhido}

    until keypressed or sai;

    if not sai
      then t := readkey;
    case ord(t) of
        77: begin                        {Move p direita}
              scarrinho (x0car, 468);    {Apaga o carrinho de onde ele estava}
              x0car := x0car + 5;
              if x0car > 418
                then x0car := 418;       {Limita o espaco do carro na pista}
            end;
        75: begin                        {Move p erquerda}
              scarrinho (x0car, 468);    {Apaga o carrinho de onde ele estava}
              x0car := x0car - 5;        {Diminue a cord x do carro}
              if x0car < 196
                then x0car := 196;       {Limita o espaco do carro na pista}
            end;
        72: begin                        {P/ cima: Acelera}
              v := v - 2;            {Diminui o delay / aumenta a velocidade}
              if v < 2
                then v := 2;
            end;
        80: begin                        {P/ baixo: Freia}
              v := v + 2;            {Aumenta o delay / diminue a velocidade}
              if v > 1000            {Intervalo maximo}
                then v := 1000;
            end;
        27: sai := true;                    {[ESC] p sair}
        112: begin                          {'P' => PAUSA}
               scarrinho (x0car, 468);
               settextstyle (7, 0, 2);
               setcolor (0);
               outtextxy (288, 230, 'PAUSA');        {Escreve 'PAUSA'}
               readkey;
               setcolor (7);
               outtextxy (288, 230, 'PAUSA');        {Apaga 'PAUSA'}
             end;
     end;

  until sai;
  fim_de_jogo;

  closegraph;                               {Finaliza o modo grafico}

END.