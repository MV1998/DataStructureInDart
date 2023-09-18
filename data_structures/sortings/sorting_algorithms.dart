

void selectionSort(List<int> list) {
  // for(int i = 0; i < list.length - 1; i++) {
  //   for (int j = i + 1; j < list.length; j++) {
  //     if (list[i] >= list[j]) {
  //       int temp = list[i];
  //       list[i] = list[j];
  //       list[j] = temp;
  //     }
  //   }
  // }

  for (int i = 0; i < list.length; i++) {
    int min = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[min]) {
        min = j;
      }
    }
    int temp = list[i];
    list[i] = list[min];
    list[min] = temp;
  }
}

void bubbleSort(List<int> list) {
  for (int i = list.length - 1; i >= 1; i--) {
    for (int j = 0; j <= i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j + 1];
        list[j + 1] = list[j];
        list[j] = temp;
      }
    }
  }
}

void insertionSort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    int j = i;
    while (j > 0 && list[j] < list[j - 1]) {
      int temp = list[j - 1];
      list[j - 1] = list[j];
      list[j] = temp;
      j --;
    }
  }
}