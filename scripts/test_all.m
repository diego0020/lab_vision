for i = 1:length(dir_names)
n=dir_names(i).name;
try
    s=test_net(n);
catch
    s=0;
end
course_scores{i}=struct('name',n,'score',s)
end