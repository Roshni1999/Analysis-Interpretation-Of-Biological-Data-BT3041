function [correct, incorrect] = validate(weights_hidden, weights_out, Images, Labels)
  
    testSize = size(Images, 2);
    incorrect = 0;
    correct = 0;
    
    for n = 1: testSize
        inVector = Images(:, n);
        outputVector = Sigmoid(weights_out*Sigmoid(weights_hidden*inVector));
               
        class = decideClass(outputVector);
        if class == Labels(n) + 1   
            correct = correct + 1;
        else
            incorrect = incorrect + 1;
        end
    end
end

