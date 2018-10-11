clear all, close all, clc

% Création de la matrice de genre 

S = [-6.5, -2.5, -2;
     -6.5, 2.5, -2;
     -6.5, 2.5, 0.5;
     -6.5, -2.5, 0.5;
     -2.5, -2.5, 0.5;
     -2.5, 2.5, 0.5;
     -0.75, -2.5, 2;
     -0.75, 2.5, 2; 
     3.25, -2.5, 2; 
     3.25, 2.5, 2; 
     4.5, -2.5, 0.5; 
     4.5, 2.5, 0.5;
     6.5, -2.5, 0.5;
     6.5, 2.5, 0.5;
     6.5, 2.5, -2; 
     6.5, -2.5, -2]
 
A = [0	1	0	1	0	0	0	0	0	0	0	0	0	0	0	1
1	0	1	0	0	0	0	0	0	0	0	0	0	0	1	0
0	1	0	1	0	1	0	0	0	0	0	0	0	0	0	0
1	0	1	0	1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	1	0	1	1	0	0	0	0	0	0	0	0	0
0	0	1	0	1	0	0	1	0	0	0	0	0	0	0	0
0	0	0	0	1	0	0	1	1	0	0	0	0	0	0	0
0	0	0	0	0	1	1	0	0	1	0	0	0	0	0	0
0	0	0	0	0	0	1	0	0	1	1	0	0	0	0	0
0	0	0	0	0	0	0	1	1	0	0	1	0	0	0	0
0	0	0	0	0	0	0	0	1	0	0	1	1	0	0	0
0	0	0	0	0	0	0	0	0	1	1	0	0	1	0	0
0	0	0	0	0	0	0	0	0	0	1	0	0	1	0	1
0	0	0	0	0	0	0	0	0	0	0	1	1	0	1	0
0	1	0	0	0	0	0	0	0	0	0	0	0	1	0	1
1	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0];


[I,J] = find(A);

subplot(1,2,1), gplot3(A, S)
title('Voiture en 3D')
axis('equal')

%%
%%Calcul de projection

St = S';

Shomog=[St; ones(1,16)];

P=[1 0 0 0 ; 0 1 0 0 ; 0 0 0 0 ; 0 0 -1/10 1]

Setoile = P*Shomog
ligne4=Setoile(4,:);

xetoile=Setoile(1,:)./ligne4
yetoile=Setoile(2,:)./ligne4

Setoile1=[xetoile ; yetoile]

subplot(1,2,2), gplot(A, Setoile1', '-b')
title('Projection sur le plan Oxy')
axis([-10 10 -5 5])
axis('equal')



















