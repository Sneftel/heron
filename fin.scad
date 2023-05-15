function radialToCartesian(rp) = 
    [cos(rp[0])*rp[1], sin(rp[0])*rp[1]];
    
function offsetToRadial(r0, p) =
    [p[0]*180/(PI*r0), p[1]+r0];
        
module wedgeProfile(r0, cps)
{
    points = [for(cp=cps) radialToCartesian(offsetToRadial(r0, cp))];
    echo(points);
    polygon(points=points);
}

function accumX(ps) = [for(i=0,s=0;i<len(ps); s=s+ps[i][0],i=i+1) [ps[i][0]+s, ps[i][1]]];

echo(accumX([[0,2],[2,3],[3,4],[0,5],[1,6]]));

testProfilePoints = [[0,0],[5,0],[1,3],[7,3],[1,0],[10,0],[1,3],[7,3],[1,0],[5,0],[1,3],[7,3],[1,0],[10,0],[1,3],[7,3],[1,0],[6,0],[0,50],[-72,50]];

wedgeProfile(70, accumX(testProfilePoints));

