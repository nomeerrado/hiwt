class CityUtils {
  static String? getWOEID(String cidade) =>
      cities.entries.firstWhere((element) => element.key == cidade).value;

  static Map<String, String> cities = {
    'Cuiabá, MT': '455834',
    'Campo Verde, MT': '55943851',
    'Curitiba, PR': '455822',
    'Rio Grande, RS': '455906',
    'Porto Alegre, RS': '455823',
    'Campinas, SP': '455828',
    'São Paulo, SP': '455827',
    'Rio de Janeiro, RJ': '455825',
    'Belo Horizonte, MG': '455821',
    'Brasília, DF': '455819',
    'Salvador, BA': '455826',
    'Fortaleza, CE': '455820',
    'Recife, PE': '455824',
    'Manaus, AM': '455833',
    'Belém, PA': '455832',
    'Goiânia, GO': '455830',
    'São Luís, MA': '455831',
    'Maceió, AL': '455829',
  };
}
