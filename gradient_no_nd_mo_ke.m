% NOUBISSIE KAMGA WILFRIED 20U2671
% NDEUNA NGANA OUSMAN SINCLAIR 21T2433
% MOUNCHIGAM NFONTE HAMED 21T2465
% KENFACK TADJI CLYDE 21T2421

function [x, iter] = gradientConjugue()

    disp('Veuillez entrer une matrice, un vecteur colonne, une tolerance (definissant le critere d arret lorsque la norme du residu devient suffisamment petite)');
    disp('et le nombre maximal d iterations pour limiter la boucle');
    disp('Exemple : Matrice = [3,-1,2;-1,5,0;2,0,2]');
    disp('          vecteur = [3;-8;2]');
    disp('        tolerance = 1e-6;');
    disp('         max_iter = 1000');
    
    n = input('Veuillez entrer la taille de la matrice : ');
    
    A = zeros(n);
    
% Phrase secrete placée a la ligne 19 car no=6,nd=18,mo=26,ke=13, somme=63, resultat = somme%22 = 19    

    for i=1:n
        for j=1:n
            A(i,j) = input(sprintf('Element[%d;%d]) : ',i,j));
        end
    end
    
    b = zeros(n,1);
    disp('Veuillez entrer les seconds membres du systeme linieaire : ');
    for i = 1:n
        b(i) = input(sprintf('v%d : ',i));
    end   
    
    tol = input('Veuillez entre la tolerance : ');
    
    max_iter = input('Veuillez entrer le nombre maximal d iteration : ');
    
    x = zeros(n, 1);
    r = b - A * x;
    d = r;
    delta_new = r' * r;
    delta_init = delta_new;
    iter = 0;

    while delta_new > tol^2 * delta_init && iter < max_iter
        q = A * d;
        alpha = delta_new / (d' * q);
        x = x + alpha * d;
        r = r - alpha * q;
        delta_old = delta_new;
        delta_new = r' * r;
        beta = delta_new / delta_old;
        d = r + beta * d;
        iter = iter + 1;
    end
    
    disp('Solution approximative :');
    disp(x);
    
    % Calcul de l'objectif pour chaque itération
    obj_values = zeros(1, iter+1);
    for i = 1:iter+1
        obj_values(i) = 0.5 * dot(x, A * x) - dot(b, x);
    end

    % Graphique 2D
    figure;
    plot(0:iter, obj_values, 'o-', 'LineWidth', 2);
    xlabel('Itération');
    ylabel('Valeur de l''objectif');
    title('Résultat du gradient conjugué');

    grid on;
end