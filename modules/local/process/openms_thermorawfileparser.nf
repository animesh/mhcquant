// Import generic module functions
include {  saveFiles; getSoftwareName } from './functions'

params.options = [:]

process OPENMS_THERMORAWFILEPARSER {
    conda (params.enable_conda ? "bioconda::openms-thirdparty=2.5.0" : null)
    if (workflow.containerEngine == 'singularity' && !params.singularity_pull_docker_container) {
        container "https://depot.galaxyproject.org/singularity/openms-thirdparty:2.5.0--6"
    } else {
        container "quay.io/biocontainers/openms-thirdparty:2.5.0--6"
    }

    input:
        tuple val(id), val(Sample), val(Condition), file(rawfile)
    
    output:
        tuple val("$id"), val("$Sample"), val("$Condition"), file("${rawfile.baseName}.mzML"), emit: mzml   
        path  "*.version.txt", emit: version

    script:
        def software = getSoftwareName(task.process)

        """
            ThermoRawFileParser.sh -i=${rawfile} \\
            -f=2 \\
            -b=${rawfile.baseName}.mzML
            echo \$(FileInfo --help 2>&1) | sed 's/^.*Version: //; s/ .*\$//' &> ${software}.version.txt
        """
}