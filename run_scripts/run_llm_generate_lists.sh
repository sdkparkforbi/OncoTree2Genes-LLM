#!/bin/bash

# Example shell script to run llm_mine_gene_pathway_assoc_oncotree.py with configurable arguments

# Set variables
MODEL_NAME="gemini/gemini-2.5-flash"   # NOTE: litellm needs the provider prefix "gemini/".
                                        # gemini-2.0-flash was retired; use gemini-2.5-flash / gemini-flash-latest.
TEMPERATURE=0.25
INPUT_FILE="assets/oncotree_latest_stable_June2025.json"
OUTPUT_FILE="gene_pathway_lists/llm_export_lists.json"
ONCOTREE_TRY1="PAAD"
ONCOTREE_TRY2="BRCA"

# Run the Python script with the specified arguments.
# IMPORTANT: short flags are -m (model) and -t (temperature) — NOT -model / -temp.
# You MUST pass at least one of --genes / --pathways / --molecular.
python generate_lists/llm_mine_gene_pathway_assoc_oncotree.py \
    -i "$INPUT_FILE" \
    -o "$OUTPUT_FILE" \
    -m "$MODEL_NAME" \
    -t "$TEMPERATURE" \
    -c "$ONCOTREE_TRY1" \
    -c "$ONCOTREE_TRY2" \
    --genes --pathways --molecular
