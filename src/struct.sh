#!/bin/bash

buildStruct() {
    createSrcAndInclude
    buildStructHeaderBody
    buildStructSourceBody
    writeToFile "${HEADER_BODY}" "${HEADER_PATH}"
    writeToFile "${SOURCE_BODY}" "${SOURCE_PATH}"
}

buildStructHeaderBody() {
read -r -d '' HEADER_BODY << EOF
// ${LOWERCASE_NAME}.h
#ifndef INCLUDED_${UPPERCASE_NAME}
#define INCLUDED_${UPPERCASE_NAME}

struct ${FILE_NAME} {
private:

public:
    // CREATORS
    ${FILE_NAME}();
}

#endif
EOF
}

buildStructSourceBody() {
read -r -d '' SOURCE_BODY << EOF
#include "${LOWERCASE_NAME}.h"

${FILE_NAME}::${FILE_NAME}()
{
}
EOF
}
