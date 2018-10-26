# Microcontroladores

Autor: Tapia Guerrero Esteban

Supervisor: Ramirez Raul

Programacion de PIC16F887 con Assembler en MPLAB IDE

Instituto Tecnologico de Queretaro


 MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm:-.....-+mMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNs.`    `./.+dMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmd:.`   `.:.  -sNMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMms/`/.`   `.-:     :yNMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNh+.    /.`   `.--      `.NMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMds:        :.`   `.:-      ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNy/`  .--:::::-:.`   `.:.      ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMho:-  -:-..///+++//.`   `.:.      ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMms:.--//.:.`.+o/++/////.`   `./`      ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNy+.  `/`-:+:` :so+o//+++/:.`   `./`      ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMdo- .---.o:-o /-`-ysoo+++/:::/.`   `./       `.MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMmhs+ -::+/++/+.`/ /-`-hso+o//++++/.`   `./       ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMNh+::./+/`:s+oo+/+``/`/-.:hsoo+++///::.`   `./       ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMds:``././:+-:yso+++/+``/`/-.:dso+o/+++++/.`   `./       ..MMMMMMMMMMM
MMMMMMMMMMMMMMMMMNhh`-:+sss/`--+/sdyooo+/+``/`/-`:hsososso+/:/-`   `./      ``.MMMMMMMMMMM
MMMMMMMMMMMMMMho-+:o+-sosyhyyhysooooshdmyo.`/`/--sNmhsooooshdho:.  ../      `..MMMMMMMMMMM
MMMMMMMMMMNh/--/s:s+ohmdhs/-           ./hh//.sdy/`          `-/syysoo`     `..MMMMMMMMMMM
MMMMMMMMhssyoyhhhyyo/-`                   `smmo`                   `-+ssssoo+++MMMMMMMMMMM
MMMMMhsN/:--.`             `o:.dNd.dy :+.   yy   `++sddy.hmy-/`            `..-::/NyhMMMMM
Md+.dd mo           `-/o-N+.Msym.s/Nd hMM-  yy /dMd:dd  ym-hsMd m+::             om`hd-+mM
Nm  -M//M.    :+:`hoyMo::MMoMshh ..Nd NNM+  yy //Ms dNh:dy `/MMoNshM`hNd-`--`   .N/:M-  mN
NMo  sm dy   oMyN+MsyM+::MdMMsoN/myNd:MdMy  yy  .Ms md--ym:mmMmMMshMsN-s+/MMo   yd my  +MN
NNN` `N+-M-  dy .-MsyM/.:M+sMy ohs`sooM+mm  yy  .Ms yhy+`ymy/MoyMshMhd ..yNNh  -M-+N` `NNN
NNNy  +N`sd  dh soMsyMhm:y- `           :d` yy  `+.          ..`y+hMoN/mhNmmN  dy`N+  sNNN
NNNM-  ms`N+ :MmM/d+:/.                    `ss`                   .: ohy+M++M./N`sm  -MNNN
NNNNd  :M.+N` `-`                   `.     ///-    -`                      `-.No.M:  hNNNN
NNNNM/  hh ms                      ://:``..///:.``:///`                      om hh  /MNNNN
NNNNNm` .M::M.                      :////////////////`                      .M/:M.  mNNNNN
NNNNNMo  om hh                `:.``-/////:--/:--:////:. .--                 yd ds  oMNNNNN
NNNNNNN. `m+-M:              `////////-`   `/.   `.:///////:               -M-/N` `NNNNNNN
NNNNNNNy  /N`sm                ./////.     `/.     ./////-.                dy`N/  yNNNNNNN
NNNNNNNM-  do`N+               `///:.-::.`.-/:.`-::-`-///-                /N`od  -MNNNNNNN
NNNNNNNNd  -N.+N`           :::////.   `.//.`.:/-     ////:::.           `No.N-  dNNNNNNNN
NNNNNNNNM/  sy ms           ///////.     /:`  :/.     ///////.           om yy  /MNNNNNNNN
NNNNNNNNNN` `N-:M.             .///: `.::--:/:-.::-. .///:              .M:-N` `mNNNNNNNNN
NNNNNNNNNMo  +d hh             `/////:.`   `/.    `-/////.              yh d+  oMNNNNNNNNN
NNNNNNNNNNM.  m/.M:          `://////:.    `/.    `:///////.           :M-/m  .NNNNNNNNNNN
NNNNNNNNNNNy  :m`sm           -/-../////:-../-..-/////:.-/:            ds m:  yMNNNNNNNNNN
NNNNNNNNNNNM-  ho`N+                /////////////////.                +N`+h  -MNNNNNNNNNNN
NNNNNNNNNNNNd  .N`+N`              :///.--:////:-.////.              `N+`N.  dNNNNNNNNNNNN
NNNNNNNNNNNNM+  oy ms               .-`    ///-   `:-.               sm ss  /MNNNNNNNNNNNN
NNNNNNNNNNNNNN` `m-:M.                     .so`                     .M:.m` `NNNNNNNNNNNNNN
NNNNNNNNNNNNNMs  /h hh                      hy                      hh h/  oMNNNNNNNNNNNNN
NNNNNNNNNNNNNNNhhhMddNhhhhhhhhhhhhhhhhhhhhhhmmhhhhhhhhhhhhhhhhhhhhhhNdhMyyyNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNM::+-ssso                                           .MNNNMNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNmmmM:od  N/  +/o:://s/.y+:y/:s+`h.o+s:o+:   `d-d:s/.+o .MmmmNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNM:od  N/  y:h:os/h+.hh-d+.+-oohy+d/+:o :``hmh:y/`ho`-MNNNMMNNNNNNNNNNNNN
NNNNNNNNNNNNNNNmmmM:/o  s-  `--`..`--`. .--```. .. ``.-     .-.`--``.`-MmmNMMMMNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNMdyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyhMNNMMMMMNNNNNNNNNNN
