String generateUrl(String name) {
  String answer = '';
  const String defaultUrl = 'https://everyayah.com/data/';
  if (name == 'Al Mishary') {
    answer = '${defaultUrl}Alafasy_64kbps/';
  } else if (name == 'Abdulbasit') {
    answer = '${defaultUrl}AbdulSamad_64kbps_QuranExplorer.Com/';
  } else if (name == 'As Sudais') {
    answer = '${defaultUrl}Abdurrahmaan_As-Sudais_64kbps/';
  } else if (name == 'Al Minshawy') {
    answer = '${defaultUrl}Minshawy_Mujawwad_64kbps/';
  } else if (name == 'Ash Shuraym') {
    answer = '${defaultUrl}Saood_ash-Shuraym_64kbps/';
  } else {
    answer = '${defaultUrl}Husary_64kbps/';
  }
  return answer;
}
