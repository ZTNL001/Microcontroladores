# Microcontroladores

Autor: Tapia Guerrero Esteban

Supervisor: Ramirez Raul

Programacion de PIC16F887 con Assembler en MPLAB IDE

Instituto Tecnologico de Queretaro


MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs/:--------::oNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMh:``        .-+/yNMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMhh-..       `.`+ `/hNMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMhd+```      `.-o    .omMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMhos-.`      .``+.     `:sNMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNho-` /`-.      ...o-        `/hNMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMms/`     +`..      `.`+.         ``-hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNh+.`        /`..      `..s.         `.`sMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMds:`            +.-.      ..`s`         ...yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmy+.`    ..---:::/::+`..      `.`o`         ..`yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNdo-`   `--//----:---:-.+...      .-.s          ...yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmy/.-.   .:/:.``-///++//++/+`..      ..`o          `.`yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNho--.-/o+ ./:.` .:/o++/++//++/o...      ...s          ...yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMds:.  /-`-/:+::-  `-oo+o++/++//++/o...      `.`o          .``yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmh+-`    //``-+ y/-` `:oso+o++/++//++/+`..      .-.o          ...yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNds:.       -+-./o. s-. `-ssso+o++/++//++/o...      .``o          `.`yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmy/.` ..::////:y/-.:+` o-.`-oysso+o++/++//++/+`..      .-.o          ...hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNdy+o  .//::++o+++/o-``-+` o-..-sysso+o++/++//++/o.-.      `.`o          ..`yMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmyo/::os`//`.+oooo+++/s:``:+` o....sysso+o++/++//++/+`..      .-.o          ...hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmho-`.+.`:+++:`-ssoooo+++/o-``-+` s-..-yysso++++/++//++/o...      ..`o          ..`hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNds:.   `o-`:o`o:.-yysoooo+++/o-``:+` o-..-yysso++++/++//++/+`.`      ..`o          ..`hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMmh+-..-:+++s+::/+ o:-:dysoooo+++/o-``-+` o-..-yysso+o++/++//++/o.-.     ``.`o          ..`hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMNmyoy..///osyssy:`.-o.so+smdhhssso++/o-``-+` o-..-yysyssyyyyhyo+o+/+`.`     ``.`+          `.`hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMNmy/-o.+s/+-/oosysss++ydmdddhhhhhdmmmdhhoo-``-+. o...:dmmNmmddhhhddmmmddo-.`    `...+          ...hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMNdo:.``o/:s-y./hsshmmmmds+:.`        `.-/ymmmo.`-/. o:ohmds/-.`       `.-:+yddhyo:.`..`+          ..`hMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMNNms..-:/+oy:+s/hsmNmmho/-`                    -odms//..dmd+-                    .-/shmdhhos.``       ...dMMMMMMMMMMMMMMMM
MMMMMMMMMMMMdsoooo/:osoyddhdmdyo/-.                            `:hNdhmy:                            `.:+shddhyo+:-..--.dMMMMMMMMMMMMMMMM
MMMMMMMMMNMNdhdmdmhhhyso/:-.`                  ./+-` -:.          :MM:       ` `...-` `.-.                 `.:/+osyyhhhmmNNNMMMMMMMMMMMM
MMMMMMMM+-NN-```                      `   sy+ /NMNMy NMs  ss:`     MM     `:sd.NNNNN-.dMMMy.o+`                         ```-NN:oMMMMMMMM
MMNdo:dMo oMy                    ``-`+hs  NMy`NMs:dN.NMs `NMMN-    MM  `:ymMNy-MM+.. hMd+dMoMMy -hs```                     yMo oMd/smNMM
NM+   -MN.`mM:             ``.`oydNN-yMM+ MMy-MN  .-`NMs :MMMM+    MM  +MNMM/ .MM/..`MM- .//MMM/-MM`dms  .:-`             -Mm``NM:   oMN
NMm`   yMy /Md       .+o+` mMs-MMs:. yMMM/MMh:MN  .-`NMs sMNNMy    MM  -:-MM/ .MMNNy.MM`  `:MMMN/MM`dMh yMMMm. `---`      dM/ sMh   `mMN
NNMo   .NM- dM/     :NMNMm`NMs-MM:`. yMMNMMMh`MM-`hM+NMs mMhhMm    MM    -MM/ .MM:`  NM: oNdMMMMNMM`dMh+MN+oMs sMMMo     /Md .MN.   oMNN
NNNN.   oMh -MN`    mMs.yN:NMs-MMmNs yMM:MMMh sMNmMN.NMs-MMMNMM`   MM    .MM/ .MMhyh-sMNyNMsMMsmMMM`dMhhMo  :- mMMMh    `mM: hMs   `NMNN
NNNMy   `mM: yMo   `MM.  ` NMs-MM+.  yMM sMMd  +hdy- yh/+MM:/MM:   MM    .MM/ .Ndhso. smNm+-MM+:MMM`dMhdM+  ``-MMhMN    oMy :MN`   sMNNN
NNNNM-   /Mm .NN.  `MM` .:-NMs-MMo+s/yMN  +:-            `:` mMo   MM    .Nh-              `+o: oMM`dMhyMy -MNsMm:MM.  `NM. dM/   -MNNNN
NNNNMd    dM+ oMy   mM+ yMsNMs-MMMNd:..                      `/+   MM                            -/`dMh-MMdNMymMNNMM/  yMs /Md    hMNNNN
NNNNNM/   -MN``mM-  /MMMMN.Nm+.+:`                               ``NN`                               `. :hmms-MM/ yMs -MN``NM-   :MNNNNN
NNNNNMm`   yMs /Md   -sys.                                      `/////.                                      `:-` /y+ hM+ oMy    mMNNNNN
NNNNNNMo   `NN. dM/                                   .-/-      `/////.     `//-`                                    :Mm `NN.   +MNNNNNN
NNNNNNMN`   oMy -Mm`                                `/////:   ``./////-``  ./////:                                   mM: yMo   `NMNNNNNN
NNNNNNNMy    mM- yMo                                 `:////:://///////////://///:`                                  +Mh -Mm`   sMNNNNNNN
NNNNNNNNM-   :Md .NN.                                 `/////////////////////////`                                  `NM. hM/   .MMNNNNNNN
NNNNNNNNMh    hM/ sMy                         .:-`  `-/////////::-//:-:://///////-`  `.:-                          sMs :Md    hMNNNNNNNN
NNNNNNNNNM/   -Mm `NM-                       -////:-///////:.`    :/.    `.:///////-:////:                        .MN` dM-   :MNNNNNNNNN
NNNNNNNNNMm    sM+ +Mh                      `:///////////-`       :/.       `-////////////-                       hM+ +My    mMNNNNNNNNN
NNNNNNNNNNM+   `NN` dM/                       `.:///////.         :/.         -////////-.`                       :Mm `mN.   +MNNNNNNNNNN
NNNNNNNNNNMN`   +Ms :Mm`                        -////////:.`      :/-     `.://:://///:                          dM: oMo   `NMNNNNNNNNNN
NNNNNNNNNNNMs   `mN. hM+                       `//////```-:/:-.`-:///:-.-:/:-.` `://///.                        +Mh .Nm`   sMNNNNNNNNNNN
NNNNNNNNNNNNM-   :My .MN`                 -::::://///-     `.-///-...:///.`      ./////:::::-                  `NM- yM/   .NMNNNNNNNNNNN
NNNNNNNNNNNNMh    hM- sMs                 ://////////.        //-     ://`       `//////////:                  sMy -Mh    yMNNNNNNNNNNNN
NNNNNNNNNNNNNM:   .Nd `NM-                -//////////.       `:/:`   .///`       .//////////:                 .NN. hM-   :MMNNNNNNNNNNNN
NNNNNNNNNNNNNMd    sM/ +Mh                 ````./////:    `.://::/:::/:::/:-``   ://///-`````                 yMo :Ms    dMNNNNNNNNNNNNN
NNNNNNNNNNNNNNM+   `Nm``mM:                     ://///-.-:/:-.`  `:/-``  `-:/::.-//////`                     :Mm` dN`   /MNNNNNNNNNNNNNN
NNNNNNNNNNNNNNMN`   +M+ :Md                    `-///////:.`       :/.       `.:///////:`                     dM/ +M+   `mMNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNMs    dN` hM+                `.://///////:.        :/.        .://///////:.                  /Md `mm`   oMNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNMN.   :Ms -MN`               `:////////////:.`     :/.     `.:////////////:                 `mM- oM:   .NMNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNMh    yN. yMs                 :/:-``-////////::-..:/:..--:////////-`.-:/:                  oMy .Nh    yMNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNMM:   .Ny .NN.                 `     `-/////////////////////////:`     `                  .NN. yN-   -MMNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNMd    oM- oMy                        ://///////////////////////:`                        yMo -Ms    dMNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNM+   `md `mM:                      ://///..--:://////::-.-//////`                      -Mm` hN`   /MNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNMm`   /M/ /Md                      `-://`     `/////.     .///:-`                      hM/ :M+   `mMNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNMo    dm` dM/                        ``      `/////.      ..`                        /Md  dd    oMNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNMN.   :M+ -Mm`                                .-dh.`                                `mM: +M:   .NMNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNMy    yN` yMo                                 `MN                                  +My `Nh    yMNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNMM:```-Ms`-MN.`````````````````````````````````MN`````````````````````````````````.NM-`oM-```-MMNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNMmdddhNMddNMdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhMMhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdMNhhNNhhhhmMNNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM+://:///////::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::NMmmmNNNNNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM.`md hdmmddo   `   `         ``  ```          ```   `         `  `  ``        NMmmmNNNNNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM.`MN   yM/   `sos/`h -y:yoo`ssoy`doo:oys/ ys :hoyo`sos/      /d./d.sso:.y.y`  NMmmmNNNNNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM.`MN   yM/   oo `N`N -h/doo hysd`Nss- h: /yd:/moysoo `N  .-  odsdd-hys- oN:   NMmmmNNNMNNNNNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM.`MN   yM/   :h+yd`m/os/h--`h/+h`N:-. h:`mosd+y.ho/h-+d  -/  oomyh-h/-..doh : NMmmmNMMMMNMMNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM.`Nm   sm:    .:-+``:- .///`-` -.:::- -`.-  :-. `:`./:       ..-.-`-::-.. -`- NMmmmMMMMMMMMNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNM-`````````````````````````````````````````````````````````````````````````````NMmmmMMMMMMMMNNNNNNNNNNNNNNNN
NNNNNNNNNNNNNNNNNNNNNNNNmmmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmmmMMMMMMMMNNNNNNNNNNNNNNNN
