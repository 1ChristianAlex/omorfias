class CategoryEnum {
  static int tattoo = 1;
  static int beautyStudio = 2;
  static int barberShop = 3;
  static int beautyClinic = 4;
}

String getCaregoryName(int categoryId) {
  switch (categoryId) {
    case 1:
      return 'Estudio de tatuagem';
    case 2:
      return 'Estudio de beleza';
    case 3:
      return 'Barberia';
    case 4:
      return 'Clinica de belza';
    default:
      return 'Estudio';
  }
}
