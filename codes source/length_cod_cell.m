function l=length_cod_cell(c)
l=0;
y=size(c);
for i=1:y(1)
    for j=1:y(2)
        l=l+length(c{i,j});
    end
end
