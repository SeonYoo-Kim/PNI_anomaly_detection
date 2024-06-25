import os
import numpy as np
from PIL import Image
from refinement import get_auroc
from refinement import get_aupro
def run(args):
    category_list = ['bottle', 'cable', 'capsule', 'carpet', 'grid', 'hazelnut', 'leather', 'metal_nut', 'pill',
                     'screw',
                     'tile', 'toothbrush', 'transistor', 'wood', 'zipper']
    category_border = [0, 83, 233, 365, 482, 560, 670, 794, 909, 1076, 1236, 1353, 1395, 1495, 1574, 1725]
    
    if args.is_MVTec_small:
        category_border = [0, 25]
        category_list = ['bottle']
    if args.is_BTAD:
        category_border = [0, 70, 300, 741]
        category_list = ['01', '02', '03']
    if args.is_AeBAD:
        category_border = [0, 342, 653, 1380, 1818]
        category_list = ['background', 'illumination', 'same', 'view']
    if args.is_VisA:
        category_border = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
        category_list = ['candle', 'capsules', 'cashew', 'chewinggum', 'fryum', 'macaroni1', 'macaroni2', 'pcb1', 'pcb2', 'pcb3', 'pcb4', 'pipe_fryum']

    for i, category in enumerate(category_list):
        index_start = category_border[i]
        index_end = category_border[i+1]

        data_count = 0
        gt, gt_max, pred, pred_max = [], [], [], []
        for index in range(index_start, index_end):
            path_gt = os.path.join(args.input_data_path, str(index).zfill(5)+'_gt.png')
            path_pred = os.path.join(args.output_data_path, str(index).zfill(5)+'_pred.png')
            if os.path.isfile(path_gt) == True and os.path.isfile(path_pred) == True:
                one_gt = np.asarray(Image.open(path_gt)).astype(np.float32) / 65535
                one_pred = np.asarray(Image.open(path_pred)).astype(np.float32) / 65535
                gt.append(one_gt)
                pred.append(one_pred)
                gt_max.append(round(one_gt.max()))
                pred_max.append(one_pred.max())
                data_count = data_count + 1
        if data_count == 0:
            print('Category '+category+': no available data')
            continue
        if data_count < index_end - index_start:
            print('Category '+category+': some images are missing')

        all_scores, image_auroc, pixel_auroc = get_auroc.run(pred_max, gt_max, pred, gt)
        if args.get_aupro == True:
            pixel_aupro = get_aupro.run(pred, gt)
        else:
            pixel_aupro = 0
        max_F1 = max(all_scores[:, 7])

        print('   ')
        print('------ ' + category + ' ------')
        print("image AUROC: ", image_auroc)
        print("pixel AUROC: ", pixel_auroc)
        print("pixel AUPRO: ", pixel_aupro)
        print("max F1: ", max_F1)
        print('---------------------------------------------------------')