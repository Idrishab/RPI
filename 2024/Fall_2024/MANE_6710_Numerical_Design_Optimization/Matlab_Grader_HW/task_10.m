% Vandermonde Matrix (create from input vector)

function V = vandermondeMatrix(x, n)
V = zeros(length(x), n);
    for i = 1:length(x)
        for j = 1:n
            V(i,j) = (x(i))^(j-1);
        end
    end
end

x = [1; 2; 5; 10];
n = 4;
V = vandermondeMatrix(x, n)