make_data <- function(tar_gz_file) {
    create_dir("./uploads")
    untar(tar_gz_file, exdir = "./tmp", compressed = "gzip")
    dataset_dir <- get_dataset_dir(tar_gz_file)
    metadata <- format_metadata(dataset_dir)
    pheno_data <- format_pheno_data(metadata)
    experiment_data <- format_experiment_data(metadata)
    genefamilies_relab(pheno_data, experiment_data, dataset_dir)
    marker_abundance(pheno_data, experiment_data, dataset_dir)
    marker_presence(pheno_data, experiment_data, dataset_dir)
    metaphlan_bugs_list(pheno_data, experiment_data, dataset_dir)
    pathabundance_relab(pheno_data, experiment_data, dataset_dir)
    pathcoverage(pheno_data, experiment_data, dataset_dir)
    combine_metadata(tar_gz_file, metadata)
}
