function [T]= TDMA(e,f,g,r,N)
tic
format long
%N is the number of equations

    ALFA=zeros(1,N);
    BETA=zeros(1,N);
    
    ALFA(1)=f(1);
    BETA(1)=r(1);
      
%     Forward Sweep
      
      for I=2:N
          ALFA(I)=f(I) - e(I-1)*g(I-1)/ALFA(I-1);
          BETA(I)=r(I)-e(I-1)*BETA(I-1)/ALFA(I-1) ;
      end
      
%     Backward Sweep

      T(N)=BETA(N)/ALFA(N);

      for I=N-1:-1:1
        T(I)=(BETA(I)-g(I)*T(I+1))/ALFA(I);
      end

toc
      
      