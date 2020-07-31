C1 = [
    1.2 7.0 5.0;
    0.4 0.8 4.0;
    4.0 4.5 3.5;
    3.0 4.7 3.7;
    4.0 2.0 3.2
];


C2 = [
    1.8 1.0 2.0;
    3.2 0.5 2.5;
    3.2 0.4 2.7;
    0.9 1.3 1.8;
    3.9 0.4 1.5
];


scatter3(C1(:,1),C1(:,2),C1(:,3));
hold on
scatter3(C2(:,1),C2(:,2),C2(:,3));


%%%%%%%%%%%%%%%%%%%%
%Initialization
%%%%%%%%%%%%%%%%%%%%
w = [0 0 0 0];
printf("Initial weight vector: \n");
w

bias = 5;
learning_rate = 0.1;
loops = 1000;

%training data set
X1 = [C1; C2];
X2 = ones(1,10)*bias;
X = [X2',X1];

Y1 = ones(1,5);
Y2 = ones(1,5)*-1;
Y = [Y1,Y2]

W = w;

printf("Training data set \n");
X
Y'
W

%%signum function
function y = sign(value)
    if (value >= 0)
        y = 1;
    else
        y = -1;
    endif
endfunction

%%%%%%%%%%%%%%%%%%%
%Traning
%%%%%%%%%%%%%%%%%%%
converged = false;

for index=1:loops
  
  if converged
    break
  endif
  
  converged = true;
  
  for i=1:rows(X)
    v = sign(dot(W,X(i,:)));
    error = Y(i) -v;
    W = W + learning_rate*error*X(i,:);   
    if error !=0
      converged = false;
    endif
  endfor
    
    
endfor

%plot the boundary
x1 = 0:10;
x2 = 0:10;
x3 = (-W(3)*x2 - W(2)*x1 - bias*W(1))/W(4);
[a, b] = meshgrid(x2, x3);
mesh(b,a);
xlabel("X1");
ylabel("X2");
zlabel("X3")
hold off

printf("After the Convergence \n ====================\n");
printf("The perceptron converged after %d no of loops \n", index);
printf("The final weight vector \n");
W'

%check whether the classifier is producing correct output values for the training data set
printf("The output produced by the classifier \n");

for k=1:10
  sign(dot(W,X(k,:))) 
endfo
