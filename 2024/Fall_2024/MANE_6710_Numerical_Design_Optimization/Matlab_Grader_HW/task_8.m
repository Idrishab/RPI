% MacLaurin Series for Cosine (loop and vectors)

function [terms, seriesSums] = maclaurinCosine(x, N)
%Enter the commands for your function here.  

% column array of xeros
terms = zeros(N,1);

for i = 1:N
    
    if i == 1
        terms(i) = 1; % assigning value to the ith index of a colum matrix
    end
    if (i >= 2) && (i <= N)

        m = 2*(i-1); % m is the power

        if mod(i,2) == 0
            terms(i) = -(x^m)/factorial(m); % ith index of a colum matrix
        else
            terms(i) = (x^m)/factorial(m); % ith index of a colum matrix
        end
        
    end
end

seriesSums = zeros(N,1);
for i = 1:N
    seriesSums(i) = sum(terms(1:i)); % summing 1st to ith colum matrix index
end

end 


[terms, seriesSums] = maclaurinCosine(pi/3, 5)