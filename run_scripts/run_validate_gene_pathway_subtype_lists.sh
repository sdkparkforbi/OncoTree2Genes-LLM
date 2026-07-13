#!/bin/bash

# Example shell script to run validate_genelist.py with configurable arguments

# Set variables
MODEL_NAME="gemini/gemini-2.5-flash"   # NOTE: litellm needs the provider prefix "gemini/".
VALIDATION_TEMPERATURE=0.0
VALIDATION_INPUT_FILE="gene_pathway_lists/export_lists_info_6codes.json"
REFERENCE_FILE="assets/mmc1.xlsx"

# Run the Python script with the specified arguments.
# IMPORTANT: short flags are -m (model), -t (temperature), -r (reference) — NOT -model / -temp / -ref.
# You MUST pass at least one of --genes / --pathways / --molecular.
# (The input file must contain the matching top-level key: "genes", "pathways", or "molecular_subtypes".)
python generate_lists/validate_genelist.py \
    -i "$VALIDATION_INPUT_FILE" \
    -r "$REFERENCE_FILE" \
    -m "$MODEL_NAME" \
    -t "$VALIDATION_TEMPERATURE" \
    --genes
