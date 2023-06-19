class Ordenador {
  List ordenarCervejas(List cervejas, int Function(Map, Map) comparador) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];

        if (comparador(atual, proximo) > 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }

  int compararPorNomeCrescente(Map cerveja1, Map cerveja2) {
    return cerveja1["name"].compareTo(cerveja2["name"]);
  }

  int compararPorNomeDecrescente(Map cerveja1, Map cerveja2) {
    return cerveja2["name"].compareTo(cerveja1["name"]);
  }

  int compararPorEstiloCrescente(Map cerveja1, Map cerveja2) {
    return cerveja1["style"].compareTo(cerveja2["style"]);
  }

  int compararPorEstiloDecrescente(Map cerveja1, Map cerveja2) {
    return cerveja2["style"].compareTo(cerveja1["style"]);
  }

  List ordenarCervejasPorNomeCrescente(List cervejas) {
    return ordenarCervejas(cervejas, compararPorNomeCrescente);
  }

  List ordenarCervejasPorNomeDecrescente(List cervejas) {
    return ordenarCervejas(cervejas, compararPorNomeDecrescente);
  }

  List ordenarCervejasPorEstiloCrescente(List cervejas) {
    return ordenarCervejas(cervejas, compararPorEstiloCrescente);
  }

  List ordenarCervejasPorEstiloDecrescente(List cervejas) {
    return ordenarCervejas(cervejas, compararPorEstiloDecrescente);
  }
}
