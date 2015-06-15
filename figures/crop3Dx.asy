import three;

/**********************************************/
/* Code for splitting surfaces: */

struct possibleInt {
  int value;
  bool holds;
}

int operator cast(possibleInt i) { return i.value; }

surface[] divide(surface s, int region(triple), int numregions,
         bool keepregion(int) = null) {

  int defaultdepth = 17;

  if (keepregion == null) keepregion = new bool(int region) {
      return (0 <= region && region < numregions);
    };

  surface[] toreturn = new surface[numregions];
  for (int i = 0; i < numregions; ++i)
    toreturn[i] = new surface;

  possibleInt region(patch P) {
    triple[][] controlpoints = P.P;
    possibleInt theRegion;
    theRegion.value = region(controlpoints[0][0]);
    theRegion.holds = true;
    for (triple[] ta : controlpoints) {
      for (triple t : ta) {
    if (region(t) != theRegion.value) {
      theRegion.holds = false;
      break;
    }
      }
      if (!theRegion.holds) break;
    }
    return theRegion;
  }

  void addPatch(patch P, int region) {
    if (keepregion(region)) toreturn[region].push(P);
  }

  void divide(patch P, int depth) {
    if (depth == 0) {
      addPatch(P, region(P.point(1/2,1/2)));
      return;
    }

    possibleInt region = region(P);
    if (region.holds) {
      addPatch(P, region);
      return;
    }

    // Choose the splitting function based on the parity of the recursion depth.
    triple[][][] Split(triple[][] P) {
      if (depth % 2 == 0) return hsplit(P);
      else return vsplit(P);
    }

    patch[] Split(patch P) {
      triple[][][] patches = Split(P.P);
      return sequence(new patch(int i) {return patch(patches[i]);}, patches.length);
    }

    patch[] patches = Split(P);
    for (patch PP : patches)
      divide(PP, depth-1);
  }

  for (patch P : s.s)
    divide(P, defaultdepth);

  return toreturn;
}

/**************************************************/
/* Code for cropping surfaces */

// Return 0 iff the point lies in box(a,b).
int region(triple pt, triple a=O, triple b=(1,1,1)) {
  real x=pt.x, y=pt.y, z=pt.z;
  int toreturn=0;
  real xmin=a.x, xmax=b.x, ymin = a.y, ymax=b.y, zmin=a.z, zmax=b.z;
  if (xmin > xmax) { xmin = b.x; xmax = a.x; }
  if (ymin > ymax) { ymin = b.y; ymax = a.y; }
  if (zmin > zmax) { zmin = b.z; zmax = a.z; }
  if (x < xmin) --toreturn;
  else if (x > xmax) ++toreturn;
  toreturn *= 2;
  if (y < ymin) --toreturn;
  else if (y > ymax) ++toreturn;
  toreturn *= 2;
  if (z < zmin) --toreturn;
  else if (z > zmax) ++toreturn;
  return toreturn;
}

bool keepregion(int region) { return (region == 0); }

// Crop the surface to box(a,b).
surface crop(surface s, triple a, triple b) {
  int region(triple pt) {
    return region(pt, a, b);
  }
  return divide(s, region=region, numregions=1, keepregion=keepregion)[0];
}
