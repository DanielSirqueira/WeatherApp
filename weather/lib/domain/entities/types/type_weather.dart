class TypeWeather {
  final int code;
  late String description;

  TypeWeather(this.code) {
    _getDescription();
  }

  void _getDescription() {
    switch (code) {
      case 113:
        description = 'Céu Limpo';
        break;
      case 116:
        description = 'Parcialmente Nublado';
        break;
      case 119:
        description = 'Nublado';
        break;
      case 122:
        description = 'Nublado';
        break;
      case 143:
        description = 'Névoa';
        break;
      case 176:
        description = 'Chuva irregular';
        break;
      case 179:
        description = 'Neve irregular';
        break;
      case 182:
        description = 'Granizo irregular';
        break;
      case 185:
        description = 'Chuvisco gelado';
        break;
      case 200:
        description = 'Surtos de trovoada';
        break;
      case 227:
        description = 'Soprando neve';
        break;
      case 230:
        description = 'Blizzard';
        break;
      case 248:
        description = 'Nevoeiro';
        break;
      case 260:
        description = 'Névoa congelante';
        break;
      case 263:
        description = 'Chuvisco fraco';
        break;
      case 266:
        description = 'Chuvisco leve';
        break;
      case 281:
        description = 'Garoa congelante';
        break;
      case 284:
        description = 'Garoa muito gelada';
        break;
      case 293:
        description = 'Chuva fraca irregular';
        break;
      case 296:
        description = 'Chuva fraca';
        break;
      case 299:
        description = 'Chuva moderada às vezes';
        break;
      case 302:
        description = 'Chuva moderada';
        break;
      case 305:
        description = 'Chuva forte às vezes';
        break;
      case 308:
        description = 'Chuva forte';
        break;
      case 311:
        description = 'Chuva leve e congelante';
        break;
      case 314:
        description = 'Chuva congelante moderada ou forte';
        break;
      case 317:
        description = 'Granizo leve';
        break;
      case 320:
        description = 'Granizo moderado ou pesado';
        break;
      case 323:
        description = 'Neve fraca irregular';
        break;
      case 326:
        description = 'Neve leve';
        break;
      case 329:
        description = 'Neve moderada irregular';
        break;
      case 332:
        description = 'Neve moderada';
        break;
      case 335:
        description = 'Neve pesada irregular';
        break;
      case 338:
        description = 'Neve pesada';
        break;
      case 350:
        description = 'Pellets de gelo';
        break;
      case 353:
        description = 'Chuveiro leve';
        break;
      case 356:
        description = 'Chuva moderada ou forte';
        break;
      case 359:
        description = 'Chuva torrencial';
        break;
      case 362:
        description = 'Chuveiros de granizo leves';
        break;
      case 365:
        description = 'Chuveiros de granizo';
        break;
      case 368:
        description = 'Aguaceiros de neve leves';
        break;
      case 371:
        description = 'Aguaceiros de neve / fortes';
        break;
      case 374:
        description = 'Chuvas leves';
        break;
      case 377:
        description = 'Chuvas moderadas ou fortes';
        break;
      case 386:
        description = 'Chuva fraca e irregular';
        break;
      case 389:
        description = 'Chuva moderada ou forte';
        break;
      case 392:
        description = 'Neve fraca e irregular';
        break;
      case 395:
        description = 'Neve moderada ou forte';
        break;
      default:
        description = 'Não definido';
    }
  }

  @override
  String toString() => '$code';
}
