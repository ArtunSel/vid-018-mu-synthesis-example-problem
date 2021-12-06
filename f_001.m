clear all;close all;clc;
%%
m0=1
eta_m=0.1;
k0=1
eta_k=0.1;
c0=1
eta_c=0.1;
%%
aa1=tf([1],[1 0])
aa1.u='s2'
aa1.y='s1'
%
aa2=tf([1],[1 0])
aa2.u='s8'
aa2.y='s2'
%
Mm=[-eta_m,1/m0;-eta_m,1/m0];
Mm_sys=ss(Mm)
Mm_sys.u={'um','s7'};
Mm_sys.y={'ym','s8'};
Mk=[0,k0;eta_k,k0];
Mk_sys=ss(Mk)
Mk_sys.u={'uk','s1'};
Mk_sys.y={'yk','s3'};
Mc=[0,c0;eta_c,c0];
Mc_sys=ss(Mc)
Mc_sys.u={'uc','s2'};
Mc_sys.y={'yc','s4'};
neg1=ss(-1);
neg1.u='s3';
neg1.y='s5';
neg2=ss(-1);
neg2.u='s4';
neg2.y='s6';
summer1=sumblk('s7=s5+s6+u');
AP1=ss(1);
AP1.u='s1';
AP1.y='y';

P1=connect(aa1,aa2,Mm_sys,Mk_sys,Mc_sys,neg1,neg2,summer1,AP1,...
    {'um','uk','uc','u'},...% i/ps to   the augmented-block
    {'ym','yk','yc','y'})   % o/ps from the augmented-block
%% P1 to Paug(9 block rep.)

summer1=sumblk('e=r-y');
P2=connect(P1,summer1,...
    {'um','uk','uc','r','u'},...
    {'ym','yk','yc','e','u','e'});
%%
zpk(P2(1,1))
zpk(P2(1,2))
zpk(P2(1,3))
zpk(P2(1,4))
zpk(P2(1,5))

zpk(P2(2,1))
zpk(P2(2,2))
zpk(P2(2,3))
zpk(P2(2,4))
zpk(P2(2,5))

zpk(P2(3,1))
zpk(P2(3,2))
zpk(P2(3,3))
zpk(P2(3,4))
zpk(P2(3,5))

zpk(P2(4,1))
zpk(P2(4,2))
zpk(P2(4,3))
zpk(P2(4,4))
zpk(P2(4,5))

zpk(P2(5,1))
zpk(P2(5,2))
zpk(P2(5,3))
zpk(P2(5,4))
zpk(P2(5,5))

zpk(P2(6,1))
zpk(P2(6,2))
zpk(P2(6,3))
zpk(P2(6,4))
zpk(P2(6,5))




%%





























%