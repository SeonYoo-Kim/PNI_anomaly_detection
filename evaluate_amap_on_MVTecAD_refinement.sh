# refine anomaly map which format is ensemble_ravel, using trained refinement network.
# You can change category with "--category" path. 
# calculated anomaly map before refinement should be in directory of "--input_data_path" argument.
# Refined anomaly map will be saved in directory of "--output_data_path" argument.

python pixelwise_refinement.py --category bottle --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category cable --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category capsule --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category carpet --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category grid --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category hazelnut --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category leather --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category metal_nut --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category pill --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category screw --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category tile --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category toothbrush --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category transistor --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category wood --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
#python pixelwise_refinement.py --category zipper --input_data_path result_MVTec/WR101_ravel --output_data_path result_MVTec/refined_ravel
