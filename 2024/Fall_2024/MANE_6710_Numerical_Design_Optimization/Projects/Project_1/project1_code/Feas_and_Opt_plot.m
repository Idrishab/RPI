% Feasibility and optimality plot

%Feas = [1.403e-04; 0.000e+00; 5.204e-18; 3.469e-18; 5.204e-18;
%    5.204e-18; 6.939e-18; 5.204e-18; 5.204e-18];
Feas = [0.000e+00; 1.388e-17; 5.204e-18; 3.469e-18; 5.204e-18;
     5.204e-18; 6.939e-18; 5.204e-18; 5.204e-18];
Optimality = [1.074e-02; 3.913e-03; 1.550e-03; 9.588e-04; 1.427e-03;
    7.888e-04; 5.322e-04; 2.232e-04; 4.337e-19];
Iter = transpose(0:1:8);

semilogy(Iter, Optimality) % plotting Optimality on log scal and iter on linear
hold on
semilogy(Iter,Feas)
hold off

xlabel('Iteration')
ylabel('Feasibility and optimality (log scale)')
legend('1st Order Optimality', 'Feasibility')
grid on
saveas(gcf, 'feasibility_and_optimality.png')