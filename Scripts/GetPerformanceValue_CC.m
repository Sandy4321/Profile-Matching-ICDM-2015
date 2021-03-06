function [ers erp] = GetPerformanceValue_CC(tile_name,lake_id,isSubset)
output_dir = './../Results';
data_dir = './../Data';


input_name = ['Stack_'  tile_name '_' lake_id];
result_name = ['CC_'  tile_name '_' lake_id];

inp = load([data_dir '/' input_name '.mat']);
res = load([output_dir '/' result_name '_data.mat']);

[N,T] = size(inp.GT);
ers = sum(sum(inp.GT~=res.mapStack));
if isSubset==1
    dyn_inds = find(sum(inp.GT==1,2)>0 & sum(inp.GT==2,2)>0);
else
    dyn_inds = (1:size(inp.GT,1))';
end
N = length(dyn_inds);
erp = ers/(N*T);
