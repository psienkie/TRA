function wk = get_wk_sequence(N)
    % funkcja generuje sekwencję pseudolosową wykorzystywaną w standardzie
    % DVB-T
    % wk - wk_sequence
    % N - długość generowanej sekwencji
    
    wk = zeros(1,N);
    
    x(1:11) = 1;
    
    for i = 1: N
        xor_ = xor(x(1),x(3));
        wk(i) = x(1);
        x(1:10) = x(2:11);
        x(11) = xor_;
    end
end