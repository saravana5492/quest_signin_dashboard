import 'dart:ui';

class PathCreator {
  static Path createDashedPath(
    Path originalPath,
    double dashLength,
    double dashSpace,
  ) {
    Path dashedPath = Path();
    double distance = 0.0;

    for (PathMetric pathMetric in originalPath.computeMetrics()) {
      while (distance < pathMetric.length) {
        final Tangent? tangent = pathMetric.getTangentForOffset(distance);
        if (tangent != null) {
          dashedPath.moveTo(tangent.position.dx, tangent.position.dy);
          distance += dashLength;
          if (distance < pathMetric.length) {
            final Tangent? nextTangent =
                pathMetric.getTangentForOffset(distance);
            if (nextTangent != null) {
              dashedPath.lineTo(
                nextTangent.position.dx,
                nextTangent.position.dy,
              );
              distance += dashSpace;
            }
          }
        }
      }
    }
    return dashedPath;
  }
}
