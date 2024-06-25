# refine anomaly map which format is ensemble_ravel, using trained refinement network.
# You can change category with "--category" path. 
# calculated anomaly map before refinement should be in directory of "--input_data_path" argument.
# Refined anomaly map will be saved in directory of "--output_data_path" argument.

python pixelwise_refinement.py --input_data_path result_BTAD/WR101_ravel --output_data_path result_BTAD/refined_ravel