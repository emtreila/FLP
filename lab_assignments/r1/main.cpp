#include "lista.h"
#include <iostream>

int main() {
    Lista l1, l2;
    l1 = creare();
    tipar(l1);
    std::cout<<"\n";
    l2 = creare();
    tipar(l2);
    std::cout<<"\n";

    if (inclusion(l1, l2)) {
        std::cout << "List 2 is included in List 1\n";
    } else {
        std::cout << "List 2 is NOT included in List 1\n";
    }
    
    int e, e1;
    std::cout << "e= ";
    std::cin >> e;
    std::cout << "e1= ";
    std::cin >> e1;
    insertAfter(l1, e, e1);
    tipar(l1);
}
