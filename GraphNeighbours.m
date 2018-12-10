function neighbours = GraphNeighbours(x, y)
%GraphNeighbours Returns positions of elements adjacent to [x
%y]'
     %   The four nodes neighbouring that at position [x, y] are
     %   returned as a 2x4 matrix, with each column being a neighouring
     %   element position. If an element has less than 4 elements,
     %   the remaining entries are left as zero vectors.
            
            neighbours = zeros(2,4);
            
            i = 1;                            % Set index to 1
            if x ~= 1
                neighbours(1,i) = x - 1;
                neighbours(2,i) = y;
                i = i + 1;                    % Increment index
            end
            if x ~= 64
                neighbours(1,i) = x + 1;
                neighbours(2,i) = y;
                i = i + 1;                    % Increment index
            end
            if y ~= 1
                neighbours(1,i) = x;
                neighbours(2,i) = y - 1;
                i = i + 1;                     % Increment index
            end
            if y ~= 64
                neighbours(1,i) = x;
                neighbours(2,i) = y + 1;
            end
end