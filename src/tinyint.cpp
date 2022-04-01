#include "cpp11/external_pointer.hpp"
#include "cpp11/logicals.hpp"
#include <memory>
#include <oroch/integer_array.hpp>
#include <cpp11.hpp>

using cpp11::logicals;
using cpp11::integers;
using cpp11::external_pointer;
using comparr = oroch::integer_array<size_t>;

[[cpp11::register]]
SEXP tinyint_compress_(integers x) {
    comparr *array = new comparr;
    size_t len = x.size();
    for (size_t i = 0; i < len; i++) {
        array->insert(i, x.at(i));
    }

    external_pointer<comparr> xptr(array);
    return xptr;
}

[[cpp11::register]]
integers tinyint_get_(SEXP ptr, int pos) {
    external_pointer<comparr> xptr(ptr);
    if (pos >= xptr.get()->size()) {
        return cpp11::as_sexp(NA_INTEGER);
    } else {
        return cpp11::as_sexp(xptr.get()->at(pos));
    }
}

[[cpp11::register]]
integers tinyint_gets_(SEXP ptr, integers pos) {
    external_pointer<comparr> xptr(ptr);
    size_t len = pos.size();
    size_t ptr_size = xptr.get()->size();

    cpp11::writable::integers ret(len);
    for (size_t i = 0; i < len; i++) {
        if (pos[i] >= ptr_size) {
            ret[i] = NA_INTEGER;
        } else {
            ret[i] = xptr.get()->at(pos[i]);
        }
    }

    return ret;
}

[[cpp11::register]]
integers tinyint_size_(SEXP ptr) {
    external_pointer<comparr> xptr(ptr);
    return cpp11::as_sexp(xptr.get()->size());
}

[[cpp11::register]]
integers tinyint_index_(SEXP ptr, integers x) {
    external_pointer<comparr> xptr(ptr);
    size_t len = x.size();
    cpp11::writable::integers indices(len);
    for (size_t i = 0; i < len; i++) {
        indices[i] = xptr.get()->find(x[i]);
    }

    return indices;
}

[[cpp11::register]]
logicals tinyint_contains_(SEXP ptr, integers x) {
    external_pointer<comparr> xptr(ptr);
    size_t len = x.size();
    cpp11::writable::logicals bools(len);
    for (size_t i = 0; i < len; i++) {
        bools[i] = (xptr.get()->find(x[i]) != -1);
    }

    return bools;
}