function new_x = recompute_reservior(u, w_in, x, w, y, w_fb, i)
    new_x = w_in*u(i);
    
    if (not(isempty(w_fb)))
        new_x = new_x + w_fb*y(i);
    end
    
    if (not(isempty(w)))
        new_x = new_x + w*x(:,i);
    end
 end