%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [clipped_mesh] = clip(mesh, clipping_planes)
%CLIP clips all faces in the mesh M against every clipping plane defined in
%   clipplanes.
%     mesh              ... mesh object to clip
%     clipping_planes   ... array of clipping planes to clip against
%     clipped_mesh      ... clipped mesh

clipped_mesh = Mesh;

for f = 1:numel(mesh.faces)
    positions = mesh.getFace(f).getVertex(1:mesh.faces(f)).getPosition();
    colors = mesh.getFace(f).getVertex(1:mesh.faces(f)).getColor();
    vertex_count = 3;
    for i = 1:numel(clipping_planes)
        [vertex_count, positions, colors] = clipPlane(vertex_count, positions, colors, clipping_planes(i));
    end
    if vertex_count ~= 0
        clipped_mesh.addFace(vertex_count, positions, colors);
    end
end

end

function [vertex_count_clipped, pos_clipped, col_clipped] = clipPlane(vertex_count, positions, colors, clipping_plane)
%CLIPPLANE clips all vertices defined in positions against the clipping
%          plane clipping_plane. Clipping is done by using the Sutherland
%          Hodgman algorithm.
%     vertex_count          ... number of vertices of the face that is clipped
%     positions             ... n x 4 matrix with positions of n vertices
%                               one row corresponds to one vertex position
%     colors                ... n x 3 matrix with colors of n vertices
%                               one row corresponds to one vertex color
%     clipping_plane        ... plane to clip against
%     vertex_count_clipped  ... number of resulting vertices after clipping;
%                               this number depends on how the plane intersects
%                               with the face and therefore is not constant
%     pos_clipped           ... n x 4 matrix with positions of n clipped vertices
%                               one row corresponds to one vertex position
%     col_clipped           ... n x 3 matrix with colors of n clipped vertices
%                               one row corresponds to one vertex color

pos_clipped = zeros(vertex_count+1, 4);
col_clipped = zeros(vertex_count+1, 3);

% TODO 2:   Implement this function.
% HINT 1: 	Read the article about Sutherland Hodgman algorithm on Wikipedia.
%           https://en.wikipedia.org/wiki/Sutherland%E2%80%93Hodgman_algorithm
%           Read the tutorial.m for further explanations!
% HINT 2: 	There is an edge between every consecutive vertex in the positions
%       	matrix. Note: also between the last and first entry!

% NOTE:     The following lines can be removed. They prevent the framework
%           from crashing.

NVertices = 1;
for i = 1:vertex_count
    % last element compares with first element
    if i == 1
        prevPos = positions(vertex_count, :) / positions(vertex_count, 4);
        prevColor = colors(vertex_count, :);
    else
        prevPos = positions(i-1, :) / positions(i-1, 4);
        prevColor = colors(i-1, :);
    end
    currPos = positions(i, :) / positions(i, 4);
    currColor = colors(i, :);
    
    intersection = clipping_plane.intersect(prevPos, currPos);
    intersectionPos = MeshVertex.mix(prevPos, currPos, intersection);
    intersectionCol = MeshVertex.mix(prevColor, currColor, intersection);
    
    if clipping_plane.inside(currPos)
        if ~clipping_plane.inside(prevPos)
            pos_clipped(NVertices, :) = intersectionPos;
            col_clipped(NVertices, :) = intersectionCol;
            NVertices = NVertices + 1;
        end
        
        pos_clipped(NVertices, :) = currPos;
        col_clipped(NVertices, :) = currColor;
        NVertices = NVertices + 1;
        
    elseif clipping_plane.inside(prevPos)
        pos_clipped(NVertices, :) = intersectionPos;
        col_clipped(NVertices, :) = intersectionCol;
        NVertices = NVertices + 1;
    end
end

vertex_count_clipped = NVertices - 1;
end

