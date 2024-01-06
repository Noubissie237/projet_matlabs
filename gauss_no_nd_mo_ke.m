% NOUBISSIE KAMGA WILFRIED 20U2671
% NDEUNA NGANA OUSMAN SINCLAIR 21T2433
% MOUNCHIGAM NFONTE HAMED 21T2465
% KENFACK TADJI CLYDE 21T2421

function resultat = pivotDeGauss()

    disp('Soit a resourdre une equation a plusieurs inconnus en passant par le pivot de Gauss');
    disp('Dans un premier temps, vous allez remplir les elements de la matrice, et ensuite, vous allez donner le resultat de chaque ligne de la matrice ');
    n = input('Entrez la taille de la matrice : ');
    
    A = zeros(n);
    
    for i=1:n
        for j=1:n
            A(i,j) = input(sprintf('Element[%d;%d]) : ',i,j));
        end
    end
% Phrase secrete placée a la ligne 19 car no=6,nd=18,mo=26,ke=13, somme=63, resultat = somme%22 = 19    
    b = zeros(n,1);
    disp('Veuillez entrer le resultat de chaque ligne de votre matrice');
    for i = 1:n
        b(i) = input(sprintf('v%d : ',i));
    end        
        
    resultat = zeros(n, 1);

    for k = 1:n-1
        [~, pivot_row] = max(abs(A(k:n, k))); % Recherche de l'élément pivot
        pivot_row = pivot_row + k - 1;

        % Échange des lignes pour avoir le pivot en haut
        A([k, pivot_row], :) = A([pivot_row, k], :);
        b([k, pivot_row]) = b([pivot_row, k]);

        % Élimination de Gauss
        for i = k+1:n
            factor = A(i, k) / A(k, k);
            A(i, :) = A(i, :) - factor * A(k, :);
            b(i) = b(i) - factor * b(k);
        end
    end

    % Résolution du système d'équations triangulaire supérieur
    resultat(n) = b(n) / A(n, n);
    for i = n-1:-1:1
        resultat(i) = (b(i) - dot(A(i, i+1:n), resultat(i+1:n))) / A(i, i);
    end
    
    disp('Les solutions sont : ');
    disp(resultat);
    
    % Graphique 2D
    figure;
    plot(1:numel(resultat), resultat, 'o-', 'LineWidth', 2);
    xlabel('Indice');
    ylabel('Valeur de x');
    title('Résultat du pivot de Gauss');
    grid on;
end