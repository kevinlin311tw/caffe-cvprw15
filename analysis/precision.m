function [map precision_at_k] = precision(trn_label, trn_binary, tst_label, tst_binary, top_k, mode)   
K = top_k;
QueryTimes = size(tst_binary,2);

correct = zeros(K,1);
total = zeros(K,1);
error = zeros(K,1);
AP = zeros(QueryTimes,1);

Ns = 1:1:K;
sum_tp = zeros(1, length(Ns));

for i = 1:QueryTimes
    
    query_label = tst_label(i);
    fprintf('query %d\n',i);
    query_binary = tst_binary(:,i);
    if mode==1
    tic
    similarity = pdist2(trn_binary',query_binary','hamming');
    toc
    fprintf('Complete Query [Hamming] %.2f seconds\n',toc);
    elseif mode ==2
    tic
    similarity = pdist2(trn_binary',query_binary','euclidean');
    toc
    fprintf('Complete Query [Euclidean] %.2f seconds\n',toc);
    end

    [x2,y2]=sort(similarity);
    
    buffer_yes = zeros(K,1);
    buffer_total = zeros(K,1);
    total_relevant = 0;
    
    for j = 1:K
        retrieval_label = trn_label(y2(j));
        
        if (query_label==retrieval_label)
            buffer_yes(j,1) = 1;
            total_relevant = total_relevant + 1;
        end
        buffer_total(j,1) = 1;
    end
    
    % compute precision
    P = cumsum(buffer_yes) ./ Ns';
    
   if (sum(buffer_yes) == 0)
       AP(i) = 0;
   else
       AP(i) = sum(P.*buffer_yes) / sum(buffer_yes);
   end
   
   sum_tp = sum_tp + cumsum(buffer_yes)';
    
end  

precision_at_k = sum_tp ./ (Ns * QueryTimes);
map = mean(AP);
end