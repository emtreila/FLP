#include "lista.h"
#include <iostream>

using namespace std;


PNod creare_rec() {
    TElem x;
    cout << "x=";
    cin >> x;
    if (x == 0)
        return NULL;
    else {
        PNod p = new Nod();
        p->e = x;
        p->urm = creare_rec();
        return p;
    }
}

Lista creare() {
    Lista l;
    l._prim = creare_rec();
    return l;
}

void tipar_rec(PNod p) {
    if (p != NULL) {
        cout << p->e << " ";
        tipar_rec(p->urm);
    }
}

void tipar(Lista l) {
    tipar_rec(l._prim);
}

void distrug_rec(PNod p) {
    if (p != NULL) {
        distrug_rec(p->urm);
        delete p;
    }
}

void distrug(Lista l) {
    //se elibereaza memoria alocata nodurilor listei
    distrug_rec(l._prim);
}

// 12. a. Test the inclusion of two lists (l2 in l1)
//     b. Insert in a list, after value e, a new value e1.

bool inclusion(Lista l1, Lista l2) {
    return inclusion_rec(l1._prim, l2._prim);
}

bool inclusion_rec(PNod p1, PNod p2) {
    if (p2 == NULL) {
        return true;
    }
    if (p1 == NULL) {
        return false;
    }
    if (p1->e == p2->e) {
        return inclusion_rec(p1->urm, p2->urm);
    }
    return inclusion_rec(p1->urm, p2);
}

void insertAfter(Lista &l, TElem e, TElem e1) {
    insertAfter_rec(l._prim, e, e1);
}

void insertAfter_rec(PNod p, TElem e, TElem e1) {
    if (p == NULL) {
        return;
    }
    if (p->e == e) {
        PNod nou = new Nod();
        nou->e = e1;
        nou->urm = p->urm;
        p->urm = nou;
        return;
    }
    insertAfter_rec(p->urm, e, e1);
}
