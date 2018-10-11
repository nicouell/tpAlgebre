%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Script translation.m                           %%
%% Écrit par H.B. | 2018                          %%
%% Chapitre 3 | Application : Infographie         %%
%% Ce script montre la transaltion de la lettre N %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all, clear all, clc

% Sommets la lettre N
P1=[0 0]';
P2=[0 8]';
P3=[5.5 1.58]';
P4=[5.5 8]';
P5=[6 8]';
P6=[ 6 0]';
P7=[0.5 6.42]';
P8=[0.5 0]';

% Tracé de la lettre N
N=[P1 P2 P3 P4 P5 P6 P7 P8 P1]
plot(N(1,:),N(2,:),'r')
axis('equal')
axis([-4 12 -2 14])
grid, grid minor
hold on

% Tanslation de la lettre N de +2 selon Ox et +4 selon Oy
% Matrice de translation
A=[1 0 2 ; 0 1 4 ; 0 0 1];

% N en coordonnées homogènes
Nhom=[N; ones(1,9)]

% Calcul de la nouvelle position de N après translation
Nnew=A*Nhom;
Nnew=Nnew([1 2],:)

% Tracé de la lettre N dans sa nouvelle position
plot(Nnew(1,:),Nnew(2,:),'b')
legend('Position initiale de N', 'Position de N après translation','Location','NorthOutside')