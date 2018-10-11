%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Script projection.m                                                %%
%% Écrit par H.B. | 2018                                              %%
%% Chapitre 3 | Application : Infographie                             %%
%% Ce script montre la projection en perspective d'un parallélépipède %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, clc

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Données du problème %%
%%%%%%%%%%%%%%%%%%%%%%%%%
% Sommets de la boîte
P1=[3 1 5]';
P2=[5 1 5]';
P3=[5 0 5]';
P4=[3 0 5]';

P5=[3 1 4]';
P6=[5 1 4]';
P7=[5 0 4]';
P8=[3 0 4]';

% Dessin 3D du premier contour
C1=[P1 P2 P3 P4 P1]
x1=C1(1,:);
y1=C1(2,:);
z1=C1(3,:);
plot3(x1,y1,z1,'o-b')
hold on
axis('equal')
hold on

%%

% Desin 3D du deuxième contour
C2=[P5 P6 P7 P8 P5];
x2=C2(1,:);
y2=C2(2,:);
z2=C2(3,:);
plot3(x2,y2,z2,'o-g')
grid, grid minor

% Dessin des 4 arêtes
a1=[P1 P5];
x=a1(1,:);
y=a1(2,:);
z=a1(3,:);
plot3(x,y,z,'r')

a2=[P4 P8];
x=a2(1,:);
y=a2(2,:);
z=a2(3,:);
plot3(x,y,z,'r')

a3=[P2 P6];
x1=a3(1,:);
y1=a3(2,:);
z1=a3(3,:);
plot3(x1,y1,z1,'r')

a4=[P3 P7];
x1=a4(1,:);
y1=a4(2,:);
z1=a4(3,:);
plot3(x1,y1,z1,'r')

axis([3 7 0 3 2 5])
title('Cube en 3D')
xlabel('x')
ylabel('y')
zlabel('z')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calcul de la projection %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrice des sommets
B=[P1 P2 P3 P4 P5 P6 P7 P8]

% Matrice des sommets en coordonnées homogènes
Bhomog=[B ; ones(1,8)]

% Matrice de projection
J=[1 0 0 0 ; 0 1 0 0 ; 0 0 0 0 ; 0 0 -1/10 1]

% Calcul de la prohection
Betoile=J*Bhomog
ligne4=Betoile(4,:);

% Extraction des points (x*,y*)
xetoile=Betoile(1,:)./ligne4
yetoile=Betoile(2,:)./ligne4

% Affichage des points projetés (x*, y*)
P1etoile=[xetoile(1) ; yetoile(1)]
P2etoile=[xetoile(2) ; yetoile(2)]
P3etoile=[xetoile(3) ; yetoile(3)]
P4etoile=[xetoile(4) ; yetoile(4)]

P5etoile=[xetoile(5) ; yetoile(5)]
P6etoile=[xetoile(6) ; yetoile(6)]
P7etoile=[xetoile(7) ; yetoile(7)]
P8etoile=[xetoile(8) ; yetoile(8)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dessin de la projection %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)

% Dessin du premier contour
plot([xetoile(1:4) xetoile(1)],[yetoile(1:4) yetoile(1)],'b')
hold on

% Dessin du deuxième contour
plot([xetoile(5:8) xetoile(5)],[yetoile(5:8) yetoile(5)],'g')

% Desin des 4 arêtes
plot([xetoile(1) xetoile(5)],[yetoile(1) yetoile(5)],'r')
plot([xetoile(4) xetoile(8)],[yetoile(4) yetoile(8)],'r')
plot([xetoile(2) xetoile(6)],[yetoile(2) yetoile(6)],'r')
plot([xetoile(3) xetoile(7)],[yetoile(3) yetoile(7)],'r')

title('Projection sur le plan Oxy')
xlabel('x*'), ylabel('y*')
axis([4 11 -1 3])
axis('equal')
grid, grid minor


cd
