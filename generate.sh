#!/usr/bin/env bash
pub run intl_translation:generate_from_arb \
    --generated-file-prefix= \
    --output-dir=./web/ \
    ./web/main.dart \
    extract/messages_en.arb extract/messages_fr.arb