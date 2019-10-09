function [ cm ] = Confusion_Matrix( prob,label )
%==========================================================================
%               Confusion Matrix
% input
% prob: scores
% label: label 
% output
% cm: confusion matrix
%==========================================================================
% inicialize
cm = zeros(2,2);
% satuated the score, if score<0.5 will get 0, if score<0.5 will get 1.
prob_s = ceil(prob-0.5); 

% construction the confusion matrix
for n = 1:length(prob)
    if (prob_s(n)==1) && ( label(n) == 1) % true positive
        cm(1,1)=cm(1,1)+1;
    else if (prob_s(n)==0) && ( label(n) == 1) % false positive
            cm(1,2)=cm(1,2)+1;
        else if (prob_s(n)==0) && ( label(n) == 0) % true negative
                 cm(2,2)=cm(2,2)+1;
            else if (prob_s(n)==1) && ( label(n) == 0) % false negative
                    cm(2,1)=cm(2,1)+1;
                end
            end
        end
    end
end

end

