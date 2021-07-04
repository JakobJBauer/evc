%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function linerasterization(mesh, framebuffer)
%LINERASTERIZATION iterates over all faces of mesh and draws lines between
%                  their vertices.
%     mesh                  ... mesh object to rasterize
%     framebuffer           ... framebuffer

for i = 1:numel(mesh.faces)
    for j = 1:mesh.faces(i)
        v1 = mesh.getFace(i).getVertex(j);
        v2 = mesh.getFace(i).getVertex(mod(j, mesh.faces(i))+1);
        drawLine(framebuffer, v1, v2);
    end
end
end

function drawLine(framebuffer, v1, v2)
%DRAWLINE draws a line between v1 and v2 into the framebuffer using the DDA
%         algorithm.
%         ATTENTION: Coordinates of the line have to be rounded with the
%         function 'round(...)'.
%     framebuffer           ... framebuffer
%     v1                    ... vertex 1
%     v2                    ... vertex 2

[x1, y1, depth1] = v1.getScreenCoordinates();
[x2, y2, depth2] = v2.getScreenCoordinates();

% TODO 1: Implement this function.
% BONUS:  Solve this task without using loops and without using loop
%         emulating functions (e.g. arrayfun).
deltaX = x2 - x1; % preserve sign
deltaY = y2 - y1;

if abs(deltaX) > abs(deltaY)
    steps = abs(deltaX)+1;
else
    steps = abs(deltaY)+1;
end

stepX = deltaX / steps;
stepY = deltaY / steps;

x = x1;
y = y1;
for i = 1:steps
    t = absVector(x1 - x, y1 - y) / absVector(x2 - x1, y2 - y1);
    framebuffer.setPixel(round(x), round(y), MeshVertex.mix(depth1, depth2, t), MeshVertex.mix(v1.getColor(), v2.getColor(), t));
    x = x + stepX;
    y = y + stepY;
end

end

function length = absVector(x, y)
length = sqrt(x*x + y*y);
end
