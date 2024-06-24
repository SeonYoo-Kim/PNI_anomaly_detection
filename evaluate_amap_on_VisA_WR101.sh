# train our proposed model and evaluates anomaly map for each category
# You can change dataset with "--dataset_category" argument, and category with "--category" path. 
# Note that dataset should be in directory of "--dataset_path" argument. 
# If you want other pretrained network rather than WideResNet101-2, change "--backbone" argument.

python train_coreset_distribution.py --category candle --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category capsules --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category cashew --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category chewinggum --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category fryum --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category macaroni1 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category macaroni2 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category pcb1 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category pcb2 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category pcb3 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category pcb4 --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA
python train_coreset_distribution.py --category pipe_fryum --seed 23 --train_coreset --train_nb_dist --train_coor_dist --dataset_path ../dataset/VisA --dataset_category VisA


# make ensemble score for each category and save the result in "./result/ensemble_result" repository.
#"--backbone_list" argument is list of pretrained networks which are to ensemble. You can change category with "--category" path. 
python analysis_code/calc_ensemble_score.py --category candle --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category capsules --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category cashew --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category chewinggum --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category fryum --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category macaroni1 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category macaroni2 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category pcb1 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category pcb2 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category pcb3 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category pcb4 --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result
python analysis_code/calc_ensemble_score.py --category pipe_fryum --backbone_list WR101 --project_root_path ./result --ensemble_root_path ./result/WR101_result

# convert result format and save it into "./result/ensemble_ravel" repository.
# Add argument "--is_BTAD" if dataset is BTAD, and "--is_MVtec_small" if dataset is small version of MVTec which we provided.
# Default dataste is MVTec AD benchmark.
python analysis_code/convert_result_format.py --before_result_root_dir ./result/WR101_result --after_result_root_dir ./result/WR101_ravel --is_VisA

# analysis anomaly map from "./result/ensemble_ravel" repository.
# Add argument "--visualize" to visualize anomaly map on "./result/ensemble_ravel/viz" repository.
# If you want to find misclassified images with trained model, add argument "--calc_misclassified_sample" and indices of false positive samples and false negative samples will be presented on "./result/ensemble_ravel/misclassified_sample_list.csv"
# In addition, add "--calc_pro" argument to additionally calculate AUPRO score. The result will presented on "./result/ensemble_ravel/score_result.csv".
python analysis_code/analysis_amap.py --project_root_path ./result/WR101_ravel --visualize --is_VisA