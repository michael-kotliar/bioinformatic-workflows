#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerImageId: zlskidmore/kallisto:0.44.0
  - class: ResourceRequirement
    ramMin: 4000

baseCommand: [ "kallisto", "quant" ]

arguments:
  - valueFrom: "kallisto"
    position: 2
    prefix: "--output-dir"
  - valueFrom: "100"
    position: 3
    prefix: "--bootstrap-samples"
  - valueFrom: "--fusion"
    position: 4
  - valueFrom: "--pseudobam"
    position: 5


inputs:
  kallisto_index:
    type: File
    inputBinding:
      position: 1
      prefix: --index
  firststrand:
    type: boolean?
    inputBinding:
      prefix: --fr-stranded
      position: 6
  secondstrand:
    type: boolean?
    inputBinding:
      prefix: --fr-stranded
      position: 6
  fastq1:
    type: File
    inputBinding:
      position: 7
  fastq2:
    type: File
    inputBinding:
      position: 8

outputs:
  expression_transcript_table:
    type: File
    outputBinding:
      glob: "kallisto/abundance.tsv"
  expression_transcript_h5:
    type: File
    outputBinding:
      glob: "kallisto/abundance.h5"
  fusions:
    type: File
    outputBinding:
      glob: "kallisto/fusion.txt"
  bam_file:
    type: File
    outputBinding:
      glob: "kallisto/pseudoalignments.bam"
