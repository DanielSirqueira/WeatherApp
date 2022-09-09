String getUVIndex(int uvIndex) {
  if (uvIndex <= 2) {
    return 'Baixo';
  } else if (uvIndex >= 3 && uvIndex <= 5) {
    return 'Moderado';
  } else if (uvIndex >= 6 && uvIndex <= 7) {
    return 'Alto';
  } else if (uvIndex >= 8 && uvIndex <= 10) {
    return 'Muito Alto';
  } else {
    return 'Extremo';
  }
}
